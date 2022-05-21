part of 'workouts_bloc.dart';

@immutable
abstract class WorkoutsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class GetAllWorkouts extends WorkoutsEvent {}
