import 'package:ollama/app/app.locator.dart';
import 'package:ollama/app/app.logger.dart';
import 'package:ollama/app/app.router.dart';
import 'package:ollama/models/model_model.dart';
import 'package:ollama/services/ollama_service.dart';
import 'package:ollama/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChooseModelViewModel extends BaseViewModel {
  ChooseModelViewModel() {
    init();
  }
  final _log = getLogger("ChooseModelViewModel");

  final _navigationService = locator<NavigationService>();
  final _ollamaService = locator<OllamaService>();

  List<ModelModel>? listOfModels;

  Future<void> init() async {
    listOfModels = await _ollamaService.getModels();
    notifyListeners();
    // for (var model in listOfModels) {
    //   _log.i(model.name);
    // }
  }

  Future<void> navToModel(ModelModel? model) async {
    await _navigationService.navigateToHomeView(model: model);
  }

  Future<void> createModel() async {
    await _navigationService.navigateToCreateModelView();
  }

  Future<void> deleteModel(ModelModel model) async {
    try {
      await _ollamaService.deleteModel(model);
      _log.i('deletado com sucesso');
    } on Exception catch (e) {
      _log.e(e);
    }
    /*ja fiz catch no service http e no service do ollama.
    terei que fazer try catch aqui tbm? se eu quiser mandar
    feedback pro individuo tipo um snackbar, é melhor colocar 
    lá no service do ollama ne? se nao, eu teria que fazer try catch aqui tambem
    só pra poder chamar o snackbar por aqui.
    alias, e se eu tiver mais logicas aqui embaixo? eu nao quero que elas sejam lidas
    caso dê excecao nesse deleteModel(). Por deleteModel ja ter um try-catch la,
    entao as coisas aqui embaixo serão lidas? ou terei que colocar um try catch aqui tbm 
    pois só assim terei certeza que a partir da liha 38 só será lido caso nao tenha tido
    excecao?*/
  }
}
