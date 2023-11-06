// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:peruri_app/presentation/pages/aar_page/aar_integration_page.dart'
    as _i6;
import 'package:peruri_app/presentation/pages/calculator/calculator_page.dart'
    as _i8;
import 'package:peruri_app/presentation/pages/counter_page/counter_page.dart'
    as _i7;
import 'package:peruri_app/presentation/pages/dummy_ui/dummy_ui_part_one_page.dart'
    as _i4;
import 'package:peruri_app/presentation/pages/dummy_ui/dummy_ui_part_two_page.dart'
    as _i5;
import 'package:peruri_app/presentation/pages/main_page.dart' as _i1;
import 'package:peruri_app/presentation/pages/signature_page/signature_page.dart'
    as _i3;
import 'package:peruri_app/presentation/pages/signature_page/transform_signature_page.dart'
    as _i2;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    TransformSignatureRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.TransformSignaturePage(),
      );
    },
    SignatureRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignaturePage(),
      );
    },
    DummyUIPartOneRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DummyUIPartOnePage(),
      );
    },
    DummyUIPartTwoRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DummyUIPartTwoPage(),
      );
    },
    AARIntegrationRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AARIntegrationPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CounterPage(),
      );
    },
    CalculatorRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CalculatorPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.TransformSignaturePage]
class TransformSignatureRoute extends _i9.PageRouteInfo<void> {
  const TransformSignatureRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TransformSignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransformSignatureRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignaturePage]
class SignatureRoute extends _i9.PageRouteInfo<void> {
  const SignatureRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignatureRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignatureRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DummyUIPartOnePage]
class DummyUIPartOneRoute extends _i9.PageRouteInfo<void> {
  const DummyUIPartOneRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DummyUIPartOneRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIPartOneRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DummyUIPartTwoPage]
class DummyUIPartTwoRoute extends _i9.PageRouteInfo<void> {
  const DummyUIPartTwoRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DummyUIPartTwoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIPartTwoRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AARIntegrationPage]
class AARIntegrationRoute extends _i9.PageRouteInfo<void> {
  const AARIntegrationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AARIntegrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AARIntegrationRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CounterPage]
class CounterRoute extends _i9.PageRouteInfo<void> {
  const CounterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CalculatorPage]
class CalculatorRoute extends _i9.PageRouteInfo<void> {
  const CalculatorRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
