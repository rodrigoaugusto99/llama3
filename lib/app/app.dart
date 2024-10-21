import 'package:ollama/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ollama/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ollama/ui/views/home/home_view.dart';
import 'package:ollama/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ollama/services/http_service.dart';
import 'package:ollama/services/ollama_service.dart';
import 'package:ollama/ui/views/create_model/create_model_view.dart';
import 'package:ollama/ui/views/choose_model/choose_model_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CreateModelView),
    MaterialRoute(page: ChooseModelView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: OllamaService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
