import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionnaire.freezed.dart';
part 'questionnaire.g.dart';

/// Full questionnaire returned by `GET /profiles/onboarding/questions`.
@freezed
abstract class Questionnaire with _$Questionnaire {
  /// Creates a [Questionnaire].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Questionnaire({
    required String version,
    required List<QuestionnaireStep> steps,
  }) = _Questionnaire;

  /// Deserialises from the API `data` field.
  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);
}

/// A single numbered step in the questionnaire.
@freezed
abstract class QuestionnaireStep with _$QuestionnaireStep {
  /// Creates a [QuestionnaireStep].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionnaireStep({
    required int step,
    required String title,
    required List<QuestionnaireField> fields,
  }) = _QuestionnaireStep;

  /// Deserialises from JSON.
  factory QuestionnaireStep.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireStepFromJson(json);
}

/// A single field within a questionnaire step.
@freezed
abstract class QuestionnaireField with _$QuestionnaireField {
  /// Creates a [QuestionnaireField].
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory QuestionnaireField({
    required String name,
    required String label,
    required String type,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(name: 'required') required bool isRequired,
    List<FieldOption>? options,
    Map<String, dynamic>? constraints,
    String? hint,
    String? group,
    // ignore: invalid_annotation_target — freezed requires @JsonKey on factory params
    @JsonKey(name: 'group_constraint') String? groupConstraint,
  }) = _QuestionnaireField;

  /// Deserialises from JSON.
  factory QuestionnaireField.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFieldFromJson(json);
}

/// A selectable option within a [QuestionnaireField].
@freezed
abstract class FieldOption with _$FieldOption {
  /// Creates a [FieldOption].
  const factory FieldOption({
    required String value,
    required String label,
    String? description,
    String? icon,
  }) = _FieldOption;

  /// Deserialises from JSON.
  factory FieldOption.fromJson(Map<String, dynamic> json) =>
      _$FieldOptionFromJson(json);
}
