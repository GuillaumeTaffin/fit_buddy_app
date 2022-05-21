// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) => WorkoutDto(
      id: json['id'] as int,
      title: json['title'] as String,
      trainedAt: DateTime.parse(json['training_at'] as String),
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutDtoToJson(WorkoutDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'training_at': instance.trainedAt.toIso8601String(),
      'exercises': instance.exercises,
    };

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) => ExerciseDto(
      id: json['id'] as int,
      title: json['title'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => SetDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseDtoToJson(ExerciseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sets': instance.sets,
    };

SetDto _$SetDtoFromJson(Map<String, dynamic> json) => SetDto(
      id: json['id'] as int,
      weight: (json['weight'] as num).toDouble(),
      numberOfRepetitions: json['reps'] as int,
      restInSeconds: json['rest_time'] as int,
    );

Map<String, dynamic> _$SetDtoToJson(SetDto instance) => <String, dynamic>{
      'id': instance.id,
      'weight': instance.weight,
      'reps': instance.numberOfRepetitions,
      'rest_time': instance.restInSeconds,
    };
