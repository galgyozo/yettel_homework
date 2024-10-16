import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:yettel_homework/utils/di/injectable.config.dart';

/// The dependency injection setup for the application is handled through
/// the [GetIt] package in combination with [injectable]. This allows for easy
/// management and retrieval of dependencies throughout the app.
///
/// - `final getIt = GetIt.instance;`: This line creates a singleton instance
///   of [GetIt], which is used to register and retrieve dependencies.
///
/// - `@InjectableInit(includeMicroPackages: false)`: This annotation
///   generates the necessary code for dependency injection. The `includeMicroPackages`
///   parameter determines whether to include micro-packages for dependency
///   registration. Setting it to `false` excludes them.
///
/// - `Future<void> configureDependencies() async => getIt.init();`: This
///   asynchronous function initializes the dependency injection container
///   by calling `init()` on the [getIt] instance. This function should be
///   called at the start of the application (e.g., in the `main()` function)
///   to ensure all dependencies are properly registered before they are used.

final getIt = GetIt.instance;

@InjectableInit(includeMicroPackages: false)
Future<void> configureDependencies() async => getIt.init();
