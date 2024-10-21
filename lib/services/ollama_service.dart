import 'package:ollama/app/app.locator.dart';
import 'package:ollama/app/app.logger.dart';
import 'package:ollama/models/model_model.dart';
import 'package:ollama/services/http_service.dart';

class OllamaService {
  String url = 'http://192.168.1.64:8080';
  final _httpService = locator<HttpService>();
  final _log = getLogger("OllamaService");

  Future<Stream<String>> generateResponse({
    required String prompt,
    String? model,
  }) async {
    Map<String, dynamic> body = {
      'model': model ?? 'llama3',
      'prompt': prompt,
    };

    // Chama a função postStream e retorna o Stream gerado
    return _httpService.postStream(
      url: '$url/api/generate',
      body: body,
    );
  }

  Future<void> createModel({
    required String name,
    required String description,
  }) async {
    Map<String, dynamic> body = {
      'name': name,
      "modelfile": "FROM llama3\nSYSTEM $description"
    };
    try {
      await _httpService.post(
        url: '$url/api/create',
        body: body,
      );
      _log.i('criado com sucesso!');
    } on Exception catch (e) {
      _log.e(e);
      throw Exception('Erro ao criar modelo');
    }
  }

  Future<List<ModelModel>> getModels() async {
    try {
      final response = await _httpService.get(
        url: '$url/api/tags',
      );
      _log.i('models recuperados com sucesso!');
      final models = response['models'] as List<dynamic>;
      return models
          .map((model) => ModelModel.fromMap(model as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      _log.e(e);
      throw Exception('Erro ao criar modelo');
    }
  }

  Future<void> deleteModel(ModelModel model) async {
    try {
      await _httpService.delete(
        url: '$url/api/delet',
        body: {
          "name": model.name,
        },
      );
      // _log.i('deletado com sucesso!');
    } on Exception catch (e) {
      _log.e(e);
      throw Exception('Erro ao deletar modelo');
    }
  }

  //todo: showModelInformations
  //todo: check if blob exists
}
