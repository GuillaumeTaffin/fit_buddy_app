import 'package:fit_buddy_app/backend/workouts/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable()
class WorkoutDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'training_at')
  final DateTime trainedAt;

  @JsonKey(name: 'exercises')
  final List<ExerciseDto> exercises;

  WorkoutDto({required this.id, required this.title, required this.trainedAt, required this.exercises});

  WorkoutDto.fromEntity(Workout workout)
      : id = workout.id,
        title = workout.title,
        trainedAt = workout.trainedAt,
        exercises = [];

  factory WorkoutDto.fromJson(Map<String, dynamic> json) => _$WorkoutDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);

  Workout toEntity() {
    return Workout(id, title, trainedAt);
  }
}

@JsonSerializable()
class ExerciseDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'sets')
  final List<SetDto> sets;

  ExerciseDto({required this.id, required this.title, required this.sets});

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseDtoToJson(this);
}

@JsonSerializable()
class SetDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'weight')
  final double weight;

  @JsonKey(name: 'reps')
  final int numberOfRepetitions;

  @JsonKey(name: 'rest_time')
  final int restInSeconds;

  SetDto({required this.id, required this.weight, required this.numberOfRepetitions, required this.restInSeconds});

  factory SetDto.fromJson(Map<String, dynamic> json) => _$SetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SetDtoToJson(this);
}
