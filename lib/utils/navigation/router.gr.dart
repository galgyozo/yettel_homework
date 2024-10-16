// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:yettel_homework/models/county/county_model.dart' as _i11;
import 'package:yettel_homework/models/vehicle/vehicle_category_model.dart'
    as _i9;
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart' as _i8;
import 'package:yettel_homework/models/vignette/vignette_model.dart' as _i10;
import 'package:yettel_homework/screens/confirm_order/confirm_order_screen.dart'
    as _i1;
import 'package:yettel_homework/screens/confirm_order_success/confirm_order_success.dart'
    as _i2;
import 'package:yettel_homework/screens/county_vignettes/county_vignettes_screen.dart'
    as _i3;
import 'package:yettel_homework/screens/home/home_screen.dart' as _i4;
import 'package:yettel_homework/screens/vignettes/vignettes_screen.dart' as _i5;

/// generated route for
/// [_i1.ConfirmOrderScreen]
class ConfirmOrderRoute extends _i6.PageRouteInfo<ConfirmOrderRouteArgs> {
  ConfirmOrderRoute({
    _i7.Key? key,
    required _i8.VehicleInfo vehicleInfo,
    required List<_i9.VehicleCategory> vehicleCategories,
    required _i10.Vignette vignette,
    List<_i11.County> counties = const [],
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ConfirmOrderRoute.name,
          args: ConfirmOrderRouteArgs(
            key: key,
            vehicleInfo: vehicleInfo,
            vehicleCategories: vehicleCategories,
            vignette: vignette,
            counties: counties,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmOrderRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConfirmOrderRouteArgs>();
      return _i1.ConfirmOrderScreen(
        key: args.key,
        vehicleInfo: args.vehicleInfo,
        vehicleCategories: args.vehicleCategories,
        vignette: args.vignette,
        counties: args.counties,
      );
    },
  );
}

class ConfirmOrderRouteArgs {
  const ConfirmOrderRouteArgs({
    this.key,
    required this.vehicleInfo,
    required this.vehicleCategories,
    required this.vignette,
    this.counties = const [],
  });

  final _i7.Key? key;

  final _i8.VehicleInfo vehicleInfo;

  final List<_i9.VehicleCategory> vehicleCategories;

  final _i10.Vignette vignette;

  final List<_i11.County> counties;

  @override
  String toString() {
    return 'ConfirmOrderRouteArgs{key: $key, vehicleInfo: $vehicleInfo, vehicleCategories: $vehicleCategories, vignette: $vignette, counties: $counties}';
  }
}

/// generated route for
/// [_i2.ConfirmOrderSuccessScreen]
class ConfirmOrderSuccessRoute extends _i6.PageRouteInfo<void> {
  const ConfirmOrderSuccessRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ConfirmOrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmOrderSuccessRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ConfirmOrderSuccessScreen();
    },
  );
}

/// generated route for
/// [_i3.CountyVignettesScreen]
class CountyVignettesRoute extends _i6.PageRouteInfo<CountyVignettesRouteArgs> {
  CountyVignettesRoute({
    _i7.Key? key,
    required _i8.VehicleInfo vehicleInfo,
    required List<_i9.VehicleCategory> vehicleCategories,
    required List<_i11.County> counties,
    required _i10.Vignette vignette,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CountyVignettesRoute.name,
          args: CountyVignettesRouteArgs(
            key: key,
            vehicleInfo: vehicleInfo,
            vehicleCategories: vehicleCategories,
            counties: counties,
            vignette: vignette,
          ),
          initialChildren: children,
        );

  static const String name = 'CountyVignettesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CountyVignettesRouteArgs>();
      return _i3.CountyVignettesScreen(
        key: args.key,
        vehicleInfo: args.vehicleInfo,
        vehicleCategories: args.vehicleCategories,
        counties: args.counties,
        vignette: args.vignette,
      );
    },
  );
}

class CountyVignettesRouteArgs {
  const CountyVignettesRouteArgs({
    this.key,
    required this.vehicleInfo,
    required this.vehicleCategories,
    required this.counties,
    required this.vignette,
  });

  final _i7.Key? key;

  final _i8.VehicleInfo vehicleInfo;

  final List<_i9.VehicleCategory> vehicleCategories;

  final List<_i11.County> counties;

  final _i10.Vignette vignette;

  @override
  String toString() {
    return 'CountyVignettesRouteArgs{key: $key, vehicleInfo: $vehicleInfo, vehicleCategories: $vehicleCategories, counties: $counties, vignette: $vignette}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.VignettesScreen]
class VignettesRoute extends _i6.PageRouteInfo<void> {
  const VignettesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          VignettesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VignettesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.VignettesScreen();
    },
  );
}
