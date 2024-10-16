import 'package:injectable/injectable.dart';
import 'package:yettel_homework/api/vignette_api.dart';
import 'package:yettel_homework/models/highway_order/highway_order_api_request_model.dart';
import 'package:yettel_homework/models/highway_order/highway_order_api_response_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_api_response_model.dart';

/// The [VignetteRepository] class is responsible for managing the data related
/// to vignettes and making API calls to fetch or manipulate that data. It is
/// annotated with [@singleton], indicating that it will be instantiated as a
/// singleton throughout the application.
///
/// This class requires an instance of [VignetteApi], which is injected via
/// the constructor. It provides the following methods:
///
/// - `fetchHighwayVignetteInfo()`: This asynchronous method calls the
///   [fetchHighwayVignetteInfo] method of the [VignetteApi]. It returns
///   an instance of [HighwayVignetteInfo] containing detailed information
///   about available vignettes.
///
/// - `fetchVehicleInfo()`: This asynchronous method retrieves vehicle
///   information by calling the [getVehicleInfo] method of the [VignetteApi].
///   It returns an instance of [VehicleInfo] containing the
///   relevant data.
///
/// - `postOrder(HighwayOrderApiRequest request)`: This asynchronous method
///   sends a highway order request to the API by calling the [postHighwayOrder]
///   method of the [VignetteApi]. It takes a [HighwayOrderApiRequest] object
///   as an argument and returns an instance of [HighwayOrderApiResponse]
///   with the response data.
///
/// Each API call is subject to a timeout of 10 seconds. If the request does
/// not complete within this duration, a timeout exception will be thrown.
///
/// This repository abstracts the interaction with the API, allowing other parts
/// of the application to access vignette-related data without needing to
/// understand the details of the API implementation.

const timeout = Duration(seconds: 10);

@singleton
class VignetteRepository {
  VignetteRepository(this.api);

  final VignetteApi api;

  Future<HighwayVignetteInfo> fetchHighwayVignetteInfo() async {
    final result = await api.fetchHighwayVignetteInfo().timeout(timeout);

    return result.payload;
  }

  Future<VehicleInfo> fetchVehicleInfo() async {
    final result = await api.getVehicleInfo().timeout(timeout);

    return result;
  }

  Future<HighwayOrderApiResponse> postOrder(
    HighwayOrderApiRequest request,
  ) async {
    final result = await api.postHighwayOrder(request).timeout(timeout);

    return result;
  }
}
