import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:yettel_homework/models/vehicle/vehicle_category_model.dart';

part 'vignette_model.g.dart';

/// The [CountryVignetteType] enum represents the types of vignettes available
/// in the country, with values:
///
/// - `day`: Represents a daily vignette.
/// - `week`: Represents a weekly vignette.
/// - `month`: Represents a monthly vignette.
/// - `year`: Represents an annual vignette.
///
/// Each value is annotated with [JsonValue] to map the enum values to their respective
/// string representations in JSON. The enum also includes an extension that provides
/// a Hungarian translation for each vignette type.
///
/// The [CountryVignetteTypeExtension] extension adds a `hu` getter to retrieve
/// the Hungarian name of the vignette type.
///
/// The following translations are provided:
/// - `day` -> 'napi (1 napos)'
/// - `week` -> 'heti (10 napos)'
/// - `month` -> 'havi'
/// - `year` -> 'éves'

@JsonEnum()
enum CountryVignetteType {
  @JsonValue('DAY')
  day,
  @JsonValue('WEEK')
  week,
  @JsonValue('MONTH')
  month,
  @JsonValue('YEAR')
  year,
}

extension CountryVignetteTypeExtension on CountryVignetteType {
  String get hu => switch (this) {
        CountryVignetteType.day => 'napi (1 napos)',
        CountryVignetteType.week => 'heti (10 napos)',
        CountryVignetteType.month => 'havi',
        CountryVignetteType.year => 'éves',
      };
}

/// The [Vignette] class represents a vignette, which includes details such as:
///
/// - `vignetteType`: A list of strings representing the types of vignettes.
/// - `vehicleCategory`: The category of vehicle to which the vignette applies.
/// - `cost`: The cost of the vignette.
/// - `trxFee`: The transaction fee associated with the vignette.
/// - `sum`: The total cost including fees.
///
/// This class uses the `json_serializable` package to generate methods for
/// serializing to and deserializing from JSON format.
///
/// The following methods are available:
///
/// - `Vignette.fromJson(Map<String, dynamic> json)`: A factory constructor
///   that creates an instance of [Vignette] from a JSON map.
/// - `toJson()`: A method that converts the [Vignette] instance to a JSON map.
///
/// The generated serialization code can be found in the `vignette_model.g.dart` file.

@JsonSerializable(explicitToJson: true)
class Vignette {
  final List<String> vignetteType;
  final String vehicleCategory;
  final double cost;
  final double trxFee;
  final double sum;

  Vignette({
    required this.vignetteType,
    required this.vehicleCategory,
    required this.cost,
    required this.trxFee,
    required this.sum,
  });

  factory Vignette.fromJson(Map<String, dynamic> json) =>
      _$VignetteFromJson(json);
  Map<String, dynamic> toJson() => _$VignetteToJson(this);
}

/// The [VignetteExtension] extension adds functionality to the [Vignette] class,
/// including a `name` method that generates a formatted string combining the
/// vignette category and its type in Hungarian. This method uses a list of
/// vehicle categories to find the corresponding vignette category and uses
/// the `CountryVignetteType` enum to find the vignette type's Hungarian name.

extension VignetteExtension on Vignette {
  String name(List<VehicleCategory> vehicleCategories) {
    final vignetteCategory = vehicleCategories
        .firstWhereOrNull(
          (category) => category.category == vehicleCategory,
        )
        ?.vignetteCategory;

    final vignetteType = CountryVignetteType.values.firstWhereOrNull(
      (element) => element.name == this.vignetteType.first.toLowerCase(),
    );
    return '$vignetteCategory - ${vignetteType?.hu}';
  }
}
