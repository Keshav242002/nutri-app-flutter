import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_meal_request.freezed.dart';
part 'log_meal_request.g.dart';

/// Request body for `POST /tracker/log/`.
@freezed
abstract class LogMealRequest with _$LogMealRequest {
  /// Creates a [LogMealRequest].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LogMealRequest({
    required String logDate,
    required String slot,
    required String status,
    int? plannedRecipeId,
    int? actualRecipeId,
    String? servingsEaten,
    String? customDescription,
    int? customCalories,
    String? customProteinG,
    String? customCarbsG,
    String? customFatG,
  }) = _LogMealRequest;

  /// Serialises to JSON for the request body.
  factory LogMealRequest.fromJson(Map<String, dynamic> json) =>
      _$LogMealRequestFromJson(json);
}
