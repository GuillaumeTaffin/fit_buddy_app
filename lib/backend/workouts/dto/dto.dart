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

  factory WorkoutDto.fromJson(Map<String, dynamic> json) => _$WorkoutDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);

  factory WorkoutDto.fromEntity(Workout workout) {
    return WorkoutDto(
      id: workout.id,
      title: workout.title,
      trainedAt: workout.trainedAt,
      exercises: workout.exercises.map(ExerciseDto.fromEntity).toList(),
    );
  }

  Workout toEntity() {
    return Workout(
      id,
      title,
      trainedAt,
      exercises.map((e) => e.toEntity()).toList(),
    );
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

  factory ExerciseDto.fromEntity(Exercise exercise) {
    return ExerciseDto(
      id: exercise.id,
      title: exercise.title,
      sets: exercise.sets.map(SetDto.fromEntity).toList(),
    );
  }

  Exercise toEntity() {
    return Exercise(
      id,
      title,
      sets.map((e) => e.toEntity()).toList(),
    );
  }
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

  factory SetDto.fromEntity(Set set) {
    return SetDto(
      id: set.id,
      weight: set.weight,
      numberOfRepetitions: set.numberOfRepetitions,
      restInSeconds: set.restTime.inSeconds,
    );
  }

  Set toEntity() {
    return Set(id, weight, numberOfRepetitions, Duration(seconds: restInSeconds));
  }
}
