enum ChatbotTipoPessoa {
  user,
  ia;
}

class ChatbotMessageModel {
  ChatbotMessageModel({
    required this.tipoPessoa,
    required this.iaResponses,
    this.question,
  });
  List<IAResponseModel> iaResponses = [];
  final ChatbotTipoPessoa tipoPessoa;
  String? question; //Quando a mensagem for da IA, question será null

  // Getter para verificar se a mensagem é do usuário
  bool get isUser => tipoPessoa == ChatbotTipoPessoa.user;

  // Obtém o texto completo gerado pela a IA
  String get fullIaResponseText {
    return iaResponses.map((e) => e.response).join('');
  }

  // Verifica se a IA já parou de responder
  bool get iaResponseDone {
    return iaResponses.any((e) => e.isDone);
  }

  // Adiciona uma nova resposta da IA
  void addIAResponse(IAResponseModel response) {
    iaResponses.add(response);
  }
}

// Classe model para as respostas da IA
class IAResponseModel {
  IAResponseModel({
    required this.response,
    required this.isDone,
  });

  final String response;
  final bool isDone;

  factory IAResponseModel.fromMap(Map<String, dynamic> map) {
    return IAResponseModel(
      response: map['response'],
      isDone: map['done'],
    );
  }
}
