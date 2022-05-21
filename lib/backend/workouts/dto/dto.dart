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

  WorkoutDto({required this.id, required this.title, required this.trainedAt});

  WorkoutDto.fromEntity(Workout workout)
      : id = workout.id,
        title = workout.title,
        trainedAt = workout.trainedAt;

  factory WorkoutDto.fromJson(Map<String, dynamic> json) => _$WorkoutDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);

  Workout toEntity() {
    return Workout(id, title, trainedAt);
  }
}
