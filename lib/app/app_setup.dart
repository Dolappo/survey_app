
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:survey_challenge/screen/category_screen.dart';
import 'package:survey_challenge/screen/display_questions_screen.dart';
import 'package:survey_challenge/screen/prepare_survey_screen.dart';
import 'package:survey_challenge/screen/preview_answer_screen.dart';
import 'package:survey_challenge/screen/register_screen.dart';
import 'package:survey_challenge/screen/welcome.dart';

import '../screen/splash_screen.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: RegisterScreen,),
    MaterialRoute(page: CatScreen,),
    MaterialRoute(page: QuestionsScreen,),
    MaterialRoute(page: PreviewAnswerScreen,),
    MaterialRoute(page: WelcomeScreen,),
    MaterialRoute(page: ReadyScreen,),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
  ],
  logger: StackedLogger(),
)
class $AppSetup {}
