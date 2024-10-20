import 'package:ollama/app/app.locator.dart';
import 'package:ollama/app/app.logger.dart';
import 'package:ollama/models/model_model.dart';
import 'package:ollama/services/http_service.dart';

class OllamaService {
  String url = 'http://192.168.1.64';
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
    return _httpService.postStream1(
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
      //todo: verificar se o ultimo status foi success.

      //todo: averiguar se aqui eu to recebendo uma stream de objetos
//pois to em duvida se estou recendo todos os status de uma vez ou se estou recebendo stream
//averiguar se eu consigo manipular isso melhor com o "stream" true ou false do endpoint
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
        url: '$url/api/delete',
        body: {
          "name": model.name,
        },
      );
      _log.i('deletado com sucesso!');
    } on Exception catch (e) {
      _log.e(e);
      throw Exception('Erro ao deletar modelo');
      //tenho que capturar esse exception lá na viewModel, se nao vai contar como uncaughjt exception.
      //o ato de capturar ou nao é muito importante? muda algo? se nao capturar, o app trava?
      //mas se capturar, entao tem que fazer algo especifico pra alem de nao travar, tambem ter um bom
      //fluxo pra demonstrar o erro ao usuario
    }
  }

  //todo: showModelInformations
  //todo: check if blob exists
}
