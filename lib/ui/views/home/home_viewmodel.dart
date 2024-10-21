import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ollama/app/app.locator.dart';
import 'package:ollama/app/app.logger.dart';
import 'package:ollama/models/chatbot_model.dart';
import 'package:ollama/models/model_model.dart';
import 'package:ollama/services/ollama_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  //modelo que quero usar
  ModelModel? model;
  HomeViewModel(
    this.model,
  ) {
    initializeScrollController();
  }
  final _ollamaService = locator<OllamaService>();
  final _log = getLogger("HomeViewModel");

  // TextEditingController para obter o texto do campo de mensagem
  final messageController = TextEditingController();

  // ScrollController para sempre mantermos a lista visível, conforme a IA vai gerando a resposta
  final scrollController = ScrollController();

  final formKey = GlobalKey<FormState>();

  // Armazenará as mensagens do chat
  List<ChatbotMessageModel> messages = [];

  @override
  void dispose() {
    messageController.dispose();

    super.dispose();
  }

  bool shouldScrollToBottom = true;

  void initializeScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Usuário rolou para baixo, pode voltar a ativar o scroll automático
        shouldScrollToBottom = true;
        _log.i(shouldScrollToBottom);
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Usuário rolou para cima, desativar o scroll automático
        shouldScrollToBottom = false;
        _log.i(shouldScrollToBottom);
      }
    });
  }

  // Método chamado sempre que o usuário fizer uma nova mensagem
  Future<void> onNewMessage() async {
    FocusManager.instance.primaryFocus!
        .unfocus(); // Retira o focus do TextField

    //   if (!formKey.currentState!.validate()) return;
    if (messageController.text.trim().isEmpty) return;

    // final question = messageController.text;

    final messageUser = ChatbotMessageModel(
      question: messageController.text,
      tipoPessoa: ChatbotTipoPessoa.user,
      iaResponses: [],
    );

    messageController.clear();

    // Adiciona a mensagem do usuário a lista de mensagens
    messages.add(messageUser);
    notifyListeners();

    // Cria uma nova mensagem, de IA, que futuramente terá as respostas adicionadas conforme a Stream de dados
    //final messageIa = ChatbotMessageModel.ia();
    final messageIA = ChatbotMessageModel(
      tipoPessoa: ChatbotTipoPessoa.ia,
      iaResponses: [],
    );

    messages.add(messageIA);
    notifyListeners();

    // Faz a requisição pra API, obtendo uma Stream<String>? como resposta
    final stream = await _ollamaService.generateResponse(
      prompt: messageUser.question!,
      model: model!.name,
    );

    // Ouve a Stream
    stream.listen(
      (data) {
        _log.i(data);
        // Decodifica a resposta e adiciona a resposta na mensagem criada para a IA
        final iaResponse = IAResponseModel.fromMap(jsonDecode(data));

        messageIA.addIAResponse(iaResponse);
        notifyListeners();

        // A cada nova resposta da IA, mantém a ListView sempre visível (final do conteúdo)

        if (shouldScrollToBottom && scrollController.hasClients) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }
      },
      onError: (err) {
        // Tratamento de erros na geração de respostas
        log(err);
      },
      onDone: () {
        // Ao finalizar a geração das respostas
        log('done');
      },
    );

    // Limpa o prompt de mensagem após a inserção
  }

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }

  // void showBottomSheet() {
  //   _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.notice,
  //     title: ksHomeBottomSheetTitle,
  //     description: ksHomeBottomSheetDescription,
  //   );
  // }
}
