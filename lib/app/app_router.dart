import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        _overview,
        _home,
      ];

  @override
  get defaultRouteType => RouteType.custom();
}

// Routes

final _overview = AutoRoute(
  path: '/overview',
  page: OverviewRoute.page,
);

final _home = AutoRoute(
  path: '/home',
  page: HomeRoute.page,
  initial: true,
);
