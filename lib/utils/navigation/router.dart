import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:yettel_homework/utils/navigation/router.gr.dart';

/// The [AppRouter] class is responsible for configuring and managing the
/// application's navigation using the [auto_route] package. It extends
/// [RootStackRouter], allowing it to handle routing and navigation
/// throughout the app.
///
/// - `@singleton`: This annotation indicates that the [AppRouter] will
///   be created as a singleton instance, ensuring that a single router
///   instance is used for the entire application lifecycle.
///
/// - `@AutoRouterConfig(replaceInRouteName: 'Screen,Route')`: This annotation
///   configures the router by specifying how routes are generated. The
///   `replaceInRouteName` parameter indicates that the suffixes "Screen"
///   and "Route" will be removed from the generated route names, simplifying
///   their usage.
///
/// - `RouteType get defaultRouteType`: This getter defines the default
///   route type for the application. Here, it is set to `RouteType.adaptive()`,
///   which means the route behavior will adapt based on the platform
///   (e.g., different behaviors on mobile and web).
///
/// - `List<AutoRoute> get routes`: This getter defines the list of routes
///   available in the application. Each route is created using the `AutoRoute`
///   class, specifying the associated page and whether it is the initial route.
///   In this case, the defined routes are:
///   - `HomeRoute.page`: The initial route of the application.
///   - `VignettesRoute.page`: A route for viewing vignettes.
///   - `CountyVignettesRoute.page`: A route for viewing county-specific vignettes.
///   - `ConfirmOrderRoute.page`: A route for confirming orders.
///   - `ConfirmOrderSuccessRoute.page`: A route for displaying order success.

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: VignettesRoute.page),
        AutoRoute(page: CountyVignettesRoute.page),
        AutoRoute(page: ConfirmOrderRoute.page),
        AutoRoute(page: ConfirmOrderSuccessRoute.page),
      ];
}
