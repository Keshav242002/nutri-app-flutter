// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) =>
    _Questionnaire(
      version: json['version'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => QuestionnaireStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionnaireToJson(_Questionnaire instance) =>
    <String, dynamic>{'version': instance.version, 'steps': instance.steps};

_QuestionnaireStep _$QuestionnaireStepFromJson(Map<String, dynamic> json) =>
    _QuestionnaireStep(
      step: (json['step'] as num).toInt(),
      title: json['title'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => QuestionnaireField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionnaireStepToJson(_QuestionnaireStep instance) =>
    <String, dynamic>{
      'step': instance.step,
      'title': instance.title,
      'fields': instance.fields,
    };

_QuestionnaireField _$QuestionnaireFieldFromJson(Map<String, dynamic> json) =>
    _QuestionnaireField(
      name: json['name'] as String,
      label: json['label'] as String,
      type: json['type'] as String,
      isRequired: json['required'] as bool,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => FieldOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      constraints: json['constraints'] as Map<String, dynamic>?,
      hint: json['hint'] as String?,
      group: json['group'] as String?,
      groupConstraint: json['group_constraint'] as String?,
    );

Map<String, dynamic> _$QuestionnaireFieldToJson(_QuestionnaireField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'type': instance.type,
      'required': instance.isRequired,
      'options': instance.options,
      'constraints': instance.constraints,
      'hint': instance.hint,
      'group': instance.group,
      'group_constraint': instance.groupConstraint,
    };

_FieldOption _$FieldOptionFromJson(Map<String, dynamic> json) => _FieldOption(
  value: json['value'] as String,
  label: json['label'] as String,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$FieldOptionToJson(_FieldOption instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
      'icon': instance.icon,
    };
