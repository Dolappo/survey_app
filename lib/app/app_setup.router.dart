// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../app_controller.dart';
import '../screen/category/category_screen.dart';
import '../screen/create_account/create_account_screen.dart';
import '../screen/display_questions_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/prepare_survey_screen.dart';
import '../screen/preview_answer_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/welcome/persona_welcome_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String personaWelcomeScreen = '/persona-welcome-screen';
  static const String catScreen = '/cat-screen';
  static const String questionsScreen = '/questions-screen';
  static const String previewAnswerScreen = '/preview-answer-screen';
  // static const String personaWelcomeScreen = '/persona-welcome-screen';
  static const String createAccScreen = '/create-acc-screen';
  static const String loginScreen = '/login-screen';
  static const String readyScreen = '/ready-screen';
  static const all = <String>{
    splashScreen,
    personaWelcomeScreen,
    catScreen,
    questionsScreen,
    previewAnswerScreen,
    createAccScreen,
    loginScreen,
    readyScreen,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.personaWelcomeScreen, page: PersonaWelcomeScreen),
    RouteDef(Routes.catScreen, page: CatScreen),
    RouteDef(Routes.questionsScreen, page: QuestionsScreen),
    RouteDef(Routes.previewAnswerScreen, page: PreviewAnswerScreen),
    RouteDef(Routes.personaWelcomeScreen, page: PersonaWelcomeScreen),
    RouteDef(Routes.createAccScreen, page: CreateAccScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.readyScreen, page: ReadyScreen),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    PersonaWelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const PersonaWelcomeScreen(),
        settings: data,
      );
    },
    CatScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CatScreen(),
        settings: data,
      );
    },
    QuestionsScreen: (data) {
      var args = data.getArgs<QuestionsScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuestionsScreen(
          type: args.type,
          key: args.key,
        ),
        settings: data,
      );
    },
    PreviewAnswerScreen: (data) {
      var args = data.getArgs<PreviewAnswerScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PreviewAnswerScreen(
          viewModel: args.viewModel,
          type: args.type,
          key: args.key,
        ),
        settings: data,
      );
    },
    CreateAccScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateAccScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreen(),
        settings: data,
      );
    },
    ReadyScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ReadyScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// QuestionsScreen arguments holder class
class QuestionsScreenArguments {
  final Cats type;
  final Key? key;
  QuestionsScreenArguments({required this.type, this.key});
}

/// PreviewAnswerScreen arguments holder class
class PreviewAnswerScreenArguments {
  final AppController viewModel;
  final Cats type;
  final Key? key;
  PreviewAnswerScreenArguments(
      {required this.viewModel, required this.type, this.key});
}
