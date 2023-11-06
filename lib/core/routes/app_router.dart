import 'package:auto_route/auto_route.dart';
import 'package:peruri_app/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: AARIntegrationRoute.page),
    AutoRoute(page: SignatureRoute.page),
    AutoRoute(page: TransformSignatureRoute.page),
    AutoRoute(page: DummyUIPartOneRoute.page),
    AutoRoute(page: DummyUIPartTwoRoute.page),
    AutoRoute(page: CounterRoute.page),
    AutoRoute(page: CalculatorRoute.page),
  ];
}
