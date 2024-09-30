import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_model_viewmodel.dart';

class CreateModelView extends StackedView<CreateModelViewModel> {
  const CreateModelView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CreateModelViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Modelo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewModel.nameController,
              decoration: const InputDecoration(
                labelText: 'Nome do Modelo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: viewModel.descriptionController,
              decoration: const InputDecoration(
                labelText: 'Como o modelo deve ser',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Permite múltiplas linhas
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.createModel,
              child: const Text('Criar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreateModelViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateModelViewModel();
}
