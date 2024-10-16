// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:yettel_homework/api/vignette_api.dart' as _i970;
import 'package:yettel_homework/repositories/vignette_repository.dart' as _i612;
import 'package:yettel_homework/utils/di/register_module.dart' as _i263;
import 'package:yettel_homework/utils/navigation/router.dart' as _i59;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i59.AppRouter>(() => _i59.AppRouter());
    gh.singleton<_i970.VignetteApi>(
        () => registerModule.provideVignetteApi(gh<_i361.Dio>()));
    gh.singleton<_i612.VignetteRepository>(
        () => _i612.VignetteRepository(gh<_i970.VignetteApi>()));
    return this;
  }
}

class _$RegisterModule extends _i263.RegisterModule {}
