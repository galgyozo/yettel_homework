import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:yettel_homework/api/vignette_api.dart';

/// The [RegisterModule] class is a part of the dependency injection setup
/// using the [injectable] package. It defines how certain dependencies are
/// created and provided throughout the application.
///
/// - `@module`: This annotation indicates that the class is a module that
///   contains provider methods for dependencies. It will be processed by
///   the code generator to register the defined providers.
///
/// - `@singleton`: This annotation specifies that the instance of the class
///   will be created as a singleton. A singleton ensures that a single
///   instance of the class is used throughout the application lifecycle.
///
/// - `Dio get dio => Dio();`: This method provides an instance of the [Dio]
///   HTTP client. Since it is marked with `@singleton`, the same instance
///   will be returned whenever it is requested from the dependency injection
///   container.
///
/// - `VignetteApi provideVignetteApi(Dio dio) => VignetteApi(dio);`:
///   This method provides an instance of the [VignetteApi] class, which
///   requires a [Dio] instance for making HTTP requests. By injecting the
///   [Dio] instance, it ensures that the [VignetteApi] can make use of the
///   configured Dio client for its API calls. This method is also marked
///   as `@singleton`, meaning the same instance of [VignetteApi] will be
///   used throughout the application.

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();

  @singleton
  VignetteApi provideVignetteApi(Dio dio) => VignetteApi(dio);
}
