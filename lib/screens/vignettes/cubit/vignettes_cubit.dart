import 'package:bloc/bloc.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';
import 'package:yettel_homework/repositories/vignette_repository.dart';
import 'package:yettel_homework/screens/vignettes/cubit/vignettes_state.dart';
import 'package:yettel_homework/utils/di/injectable.dart';

class VignettesCubit extends Cubit<VignettesState> {
  VignettesCubit() : super(VignettesInitial());

  final VignetteRepository _repository = getIt();

  Future<void> fetchHighwayVignetteInfo() async {
    try {
      emit(VignettesLoading());
      final highwayInfo = await _repository.fetchHighwayVignetteInfo();
      final vehicleInfo = await _repository.fetchVehicleInfo();

      emit(
        VignettesLoaded(
          highwayVignetteInfo: highwayInfo,
          vehicleInfo: vehicleInfo,
        ),
      );
    } catch (error) {
      emit(const VignettesError('Nem sikerült betölteni az adatokat'));
    }
  }

  void selectItem(Vignette? selectedVignette) {
    if (state is VignettesLoaded) {
      final currentState = state as VignettesLoaded;
      emit(currentState.copyWith(selectedVignette: selectedVignette));
    }
  }

  void resetState() {
    emit(VignettesInitial());
  }
}
