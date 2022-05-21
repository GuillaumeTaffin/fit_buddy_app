part of 'workouts_bloc.dart';

@immutable
abstract class WorkoutsState extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class AllWorkouts extends WorkoutsState {
  final List<Workout> workouts;

  AllWorkouts(this.workouts);

  @override
  List<Object?> get props => [workouts];
}

@immutable
class WorkoutsLoading extends WorkoutsState {}
