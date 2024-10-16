import 'package:equatable/equatable.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_api_response_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';

abstract class VignettesState extends Equatable {
  const VignettesState();

  @override
  List<Object?> get props => [];
}

class VignettesInitial extends VignettesState {}

class VignettesLoading extends VignettesState {}

class VignettesLoaded extends VignettesState {
  final HighwayVignetteInfo highwayVignetteInfo;
  final VehicleInfo vehicleInfo;
  final Vignette? selectedVignette;

  const VignettesLoaded({
    required this.highwayVignetteInfo,
    required this.vehicleInfo,
    this.selectedVignette,
  });

  @override
  List<Object?> get props => [
        highwayVignetteInfo,
        vehicleInfo,
        selectedVignette,
      ];

  VignettesLoaded copyWith({
    HighwayVignetteInfo? highwayVignetteInfo,
    VehicleInfo? vehicleInfo,
    Vignette? selectedVignette,
  }) {
    return VignettesLoaded(
      highwayVignetteInfo: highwayVignetteInfo ?? this.highwayVignetteInfo,
      vehicleInfo: vehicleInfo ?? this.vehicleInfo,
      selectedVignette: selectedVignette ?? this.selectedVignette,
    );
  }
}

class VignettesError extends VignettesState {
  const VignettesError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
