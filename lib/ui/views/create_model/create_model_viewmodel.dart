import 'package:flutter/material.dart';
import 'package:ollama/app/app.locator.dart';
import 'package:ollama/app/app.logger.dart';
import 'package:ollama/services/ollama_service.dart';
import 'package:stacked/stacked.dart';

class CreateModelViewModel extends BaseViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _log = getLogger("CreateModelViewModel");
  final _ollamaService = locator<OllamaService>();
  Future<void> createModel() async {
    final String modelName = nameController.text;
    final String modelDescription = descriptionController.text;

    // Aqui você pode adicionar a lógica para criar o modelo com os dados fornecidos
    _log.i('Model Name: $modelName');
    _log.i('Model Description: $modelDescription');

    // Limpar os campos após a criação (opcional)
    // nameController.clear();
    // descriptionController.clear();

    try {
      await _ollamaService.createModel(
        name: modelName,
        description: modelDescription,
      );
    } on Exception catch (e) {
      _log.e(e);
    }
  }
}