import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yettel_homework/models/highway_order/highway_order_api_request_model.dart';
import 'package:yettel_homework/models/highway_order/highway_order_api_response_model.dart';
import 'package:yettel_homework/models/vehicle/vehicle_info_model.dart';
import 'package:yettel_homework/models/vignette/vignette_api_response_model.dart';

part 'vignette_api.g.dart';

/// The [VignetteApi] class is an abstract API service that communicates with
/// the backend server to fetch and post data related to highway vignettes and vehicles.
/// It uses the `retrofit` package to define the API endpoints and the `dio` package to handle HTTP requests.
///
/// - The `baseUrl` is set to `http://0.0.0.0:8080`.
///
/// The following endpoints are defined:
///
/// - `fetchHighwayVignetteInfo()`:
///   - `GET /v1/highway/info`
///   - Fetches information about available highway vignettes.
///   - Returns a [VignetteApiResponse].
///
/// - `getVehicleInfo()`:
///   - `GET /v1/highway/vehicle`
///   - Retrieves information about the vehicle.
///   - Returns a [VehicleInfo].
///
/// - `postHighwayOrder(HighwayOrderApiRequest request)`:
///   - `POST /v1/highway/order`
///   - Submits an order for a highway vignette.
///   - Accepts a [HighwayOrderApiRequest] as the request body.
///   - Returns a [HighwayOrderApiResponse].
///
/// This API client is automatically generated with Retrofit using `@RestApi` and
/// the `vignette_api.g

@RestApi(baseUrl: 'http://0.0.0.0:8080')
abstract class VignetteApi {
  factory VignetteApi(Dio dio) = _VignetteApi;

  @GET('/v1/highway/info')
  Future<VignetteApiResponse> fetchHighwayVignetteInfo();

  @GET('/v1/highway/vehicle')
  Future<VehicleInfo> getVehicleInfo();

  @POST('/v1/highway/order')
  Future<HighwayOrderApiResponse> postHighwayOrder(
    @Body() HighwayOrderApiRequest request,
  );
}
