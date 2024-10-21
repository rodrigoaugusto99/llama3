import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ollama/models/chatbot_model.dart';
import 'package:ollama/models/model_model.dart';
import 'package:ollama/ui/views/home/chat_bubble.dart';
import 'package:ollama/utils/helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:ollama/ui/common/app_colors.dart';
import 'package:ollama/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  final ModelModel? model;
  const HomeView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ollama AI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: viewModel.scrollController,
                padding: const EdgeInsets.all(10),
                itemCount: viewModel.messages.length,
                itemBuilder: (_, index) {
                  final message = viewModel.messages[index];

                  return decContainer(
                    child: message.isUser
                        ? ChatBubble(
                            message: message,
                          )
                        : ChatBubble(
                            message: message,
                          ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 5),
              ),
            ),
            const SizedBox(height: 10),
            // Form(
            //   key: viewModel.formKey,
            //   child: TextFormField(
            //     controller: viewModel.messageController,
            //     validator: (message) {
            //       if (message!.trim().isEmpty) {
            //         return 'Informe uma mensagem';
            //       }

            //       return null;
            //     },
            //     decoration: InputDecoration(
            //       hintText: 'Insira sua mensagem...',
            //       labelText: 'Mensagem',
            //       labelStyle: TextStyle(
            //         color: Colors.grey[300],
            //         fontSize: 18,
            //       ),
            //       // border: borderDecoration,
            //       // errorBorder: borderDecoration,
            //       // enabledBorder: borderDecoration,
            //       // focusedBorder: borderDecoration,
            //       // disabledBorder: borderDecoration,
            //       // focusedErrorBorder: borderDecoration,
            //       suffixIcon: IconButton(
            //         icon: const Icon(Icons.send),
            //         onPressed: viewModel.onNewMessage,
            //         tooltip: 'Enviar',
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              children: [
                Expanded(
                  child: decContainer(
                    // height: MediaQuery.of(context).viewInsets.bottom + 60,
                    radius: 30,
                    // topPadding: 10,
                    // bottomPadding: 10,
                    leftPadding: 24,
                    color: Colors.grey[800],
                    child: TextField(
                      //onChanged: (_) => viewModel.onChanged(_),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: viewModel.messageController,
                    ),
                  ),
                ),
                widthSeparator(20),
                GestureDetector(
                  onTap: viewModel.onNewMessage,
                  child: decContainer(
                    height: 50,
                    width: 50,
                    radius: 100,
                    color: Colors.brown,
                    child: const Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel(model);
}
