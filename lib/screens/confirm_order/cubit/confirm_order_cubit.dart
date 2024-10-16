import 'package:bloc/bloc.dart';
import 'package:yettel_homework/models/county/county_model.dart';
import 'package:yettel_homework/models/highway_order/highway_order_api_request_model.dart';
import 'package:yettel_homework/models/highway_order/highway_order_model.dart';
import 'package:yettel_homework/models/vignette/vignette_model.dart';
import 'package:yettel_homework/repositories/vignette_repository.dart';
import 'package:yettel_homework/screens/confirm_order/cubit/confirm_order_state.dart';
import 'package:yettel_homework/utils/di/injectable.dart';

class ConfirmOrderCubit extends Cubit<ConfirmOrderState> {
  ConfirmOrderCubit() : super(ConfirmOrderInitial());

  final VignetteRepository _repository = getIt();

  Future<void> postOrder(
    Vignette vignette,
    List<County> counties,
  ) async {
    try {
      emit(ConfirmOrderLoading());

      final order = HighwayOrderApiRequest(
        highwayOrders: [
          if (counties.isEmpty)
            HighwayOrder(
              type: vignette.vignetteType.first,
              category: vignette.vehicleCategory,
              cost: vignette.sum,
            )
          else
            ...counties.map(
              (county) => HighwayOrder(
                type: county.id,
                category: vignette.vehicleCategory,
                cost: vignette.sum,
              ),
            ),
        ],
      );
      await Future.wait(
        [
          _repository.postOrder(order),
          // Making sure that the call takes at least 1 second,
          // just to show you the full screen loading dialog :)
          Future.delayed(const Duration(seconds: 1)),
        ],
      );

      emit(ConfirmOrderSuccess());
    } catch (error) {
      emit(const ConfirmOrderError('Nem sikerült a rendelést leadni'));
    }
  }

  void resetState() {
    emit(ConfirmOrderInitial());
  }
}
