// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:peruri_app/infrastructure/common/dtos/article_model.dart'
    as _i16;
import 'package:peruri_app/presentation/pages/aar_page/aar_integration_page.dart'
    as _i12;
import 'package:peruri_app/presentation/pages/calculator/calculator_page.dart'
    as _i4;
import 'package:peruri_app/presentation/pages/counter_page/counter_page.dart'
    as _i11;
import 'package:peruri_app/presentation/pages/dummy_ui/dummy_ui_part_one_page.dart'
    as _i5;
import 'package:peruri_app/presentation/pages/dummy_ui/dummy_ui_part_two_page.dart'
    as _i6;
import 'package:peruri_app/presentation/pages/input_validation_page/input_validation_page.dart'
    as _i13;
import 'package:peruri_app/presentation/pages/main_page.dart' as _i1;
import 'package:peruri_app/presentation/pages/news_page/most_popular_page.dart'
    as _i9;
import 'package:peruri_app/presentation/pages/news_page/news_page.dart' as _i8;
import 'package:peruri_app/presentation/pages/news_page/top_stories_categories_page.dart'
    as _i10;
import 'package:peruri_app/presentation/pages/news_page/top_stories_page.dart'
    as _i7;
import 'package:peruri_app/presentation/pages/signature_page/signature_page.dart'
    as _i3;
import 'package:peruri_app/presentation/pages/signature_page/transform_signature_page.dart'
    as _i2;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    TransformSignatureRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TransformSignaturePage(),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignaturePage(),
      );
    },
    CalculatorRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CalculatorPage(),
      );
    },
    DummyUIPartOneRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DummyUIPartOnePage(),
      );
    },
    DummyUIPartTwoRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DummyUIPartTwoPage(),
      );
    },
    TopStoriesRoute.name: (routeData) {
      final args = routeData.argsAs<TopStoriesRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.TopStoriesPage(
          key: args.key,
          section: args.section,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsPage(),
      );
    },
    MostPopularRoute.name: (routeData) {
      final args = routeData.argsAs<MostPopularRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.MostPopularPage(
          key: args.key,
          listArticles: args.listArticles,
        ),
      );
    },
    TopStoriesCategoriesRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TopStoriesCategoriesPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CounterPage(),
      );
    },
    AARIntegrationRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.AARIntegrationPage(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.InputValidationPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TransformSignaturePage]
class TransformSignatureRoute extends _i14.PageRouteInfo<void> {
  const TransformSignatureRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TransformSignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransformSignatureRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignaturePage]
class SignatureRoute extends _i14.PageRouteInfo<void> {
  const SignatureRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CalculatorPage]
class CalculatorRoute extends _i14.PageRouteInfo<void> {
  const CalculatorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DummyUIPartOnePage]
class DummyUIPartOneRoute extends _i14.PageRouteInfo<void> {
  const DummyUIPartOneRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DummyUIPartOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIPartOneRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DummyUIPartTwoPage]
class DummyUIPartTwoRoute extends _i14.PageRouteInfo<void> {
  const DummyUIPartTwoRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DummyUIPartTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIPartTwoRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TopStoriesPage]
class TopStoriesRoute extends _i14.PageRouteInfo<TopStoriesRouteArgs> {
  TopStoriesRoute({
    _i15.Key? key,
    required String section,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          TopStoriesRoute.name,
          args: TopStoriesRouteArgs(
            key: key,
            section: section,
          ),
          initialChildren: children,
        );

  static const String name = 'TopStoriesRoute';

  static const _i14.PageInfo<TopStoriesRouteArgs> page =
      _i14.PageInfo<TopStoriesRouteArgs>(name);
}

class TopStoriesRouteArgs {
  const TopStoriesRouteArgs({
    this.key,
    required this.section,
  });

  final _i15.Key? key;

  final String section;

  @override
  String toString() {
    return 'TopStoriesRouteArgs{key: $key, section: $section}';
  }
}

/// generated route for
/// [_i8.NewsPage]
class NewsRoute extends _i14.PageRouteInfo<void> {
  const NewsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MostPopularPage]
class MostPopularRoute extends _i14.PageRouteInfo<MostPopularRouteArgs> {
  MostPopularRoute({
    _i15.Key? key,
    required List<_i16.ArticleModel> listArticles,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MostPopularRoute.name,
          args: MostPopularRouteArgs(
            key: key,
            listArticles: listArticles,
          ),
          initialChildren: children,
        );

  static const String name = 'MostPopularRoute';

  static const _i14.PageInfo<MostPopularRouteArgs> page =
      _i14.PageInfo<MostPopularRouteArgs>(name);
}

class MostPopularRouteArgs {
  const MostPopularRouteArgs({
    this.key,
    required this.listArticles,
  });

  final _i15.Key? key;

  final List<_i16.ArticleModel> listArticles;

  @override
  String toString() {
    return 'MostPopularRouteArgs{key: $key, listArticles: $listArticles}';
  }
}

/// generated route for
/// [_i10.TopStoriesCategoriesPage]
class TopStoriesCategoriesRoute extends _i14.PageRouteInfo<void> {
  const TopStoriesCategoriesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TopStoriesCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopStoriesCategoriesRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CounterPage]
class CounterRoute extends _i14.PageRouteInfo<void> {
  const CounterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.AARIntegrationPage]
class AARIntegrationRoute extends _i14.PageRouteInfo<void> {
  const AARIntegrationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AARIntegrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AARIntegrationRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.InputValidationPage]
class InputValidationRoute extends _i14.PageRouteInfo<void> {
  const InputValidationRoute({List<_i14.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
