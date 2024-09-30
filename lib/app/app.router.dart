// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:ollama/models/model_model.dart' as _i8;
import 'package:ollama/ui/views/choose_model/choose_model_view.dart' as _i6;
import 'package:ollama/ui/views/create_model/create_model_view.dart' as _i5;
import 'package:ollama/ui/views/home/home_view.dart' as _i2;
import 'package:ollama/ui/views/startup/startup_view.dart' as _i3;
import 'package:ollama/ui/views/talking_with_bob_sponja/talking_with_bob_sponja_view.dart'
    as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const talkingWithBobSponjaView = '/talking-with-bob-sponja-view';

  static const createModelView = '/create-model-view';

  static const chooseModelView = '/choose-model-view';

  static const all = <String>{
    homeView,
    startupView,
    talkingWithBobSponjaView,
    createModelView,
    chooseModelView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.talkingWithBobSponjaView,
      page: _i4.TalkingWithBobSponjaView,
    ),
    _i1.RouteDef(
      Routes.createModelView,
      page: _i5.CreateModelView,
    ),
    _i1.RouteDef(
      Routes.chooseModelView,
      page: _i6.ChooseModelView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      final args = data.getArgs<HomeViewArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(key: args.key, model: args.model),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.TalkingWithBobSponjaView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.TalkingWithBobSponjaView(),
        settings: data,
      );
    },
    _i5.CreateModelView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CreateModelView(),
        settings: data,
      );
    },
    _i6.ChooseModelView: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ChooseModelView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HomeViewArguments {
  const HomeViewArguments({
    this.key,
    required this.model,
  });

  final _i7.Key? key;

  final _i8.ModelModel? model;

  @override
  String toString() {
    return '{"key": "$key", "model": "$model"}';
  }

  @override
  bool operator ==(covariant HomeViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.model == model;
  }

  @override
  int get hashCode {
    return key.hashCode ^ model.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView({
    _i7.Key? key,
    required _i8.ModelModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTalkingWithBobSponjaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.talkingWithBobSponjaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateModelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createModelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChooseModelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.chooseModelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView({
    _i7.Key? key,
    required _i8.ModelModel? model,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.homeView,
        arguments: HomeViewArguments(key: key, model: model),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTalkingWithBobSponjaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.talkingWithBobSponjaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateModelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createModelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChooseModelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.chooseModelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
