import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Workout extends Equatable {
  final int id;
  final String title;
  final DateTime trainedAt;
  final List<Exercise> exercises;

  const Workout(this.id, this.title, this.trainedAt, this.exercises);

  @override
  List<Object?> get props => [id, title, trainedAt, exercises];
}

@immutable
class Exercise extends Equatable {
  final int id;
  final String title;
  final List<Set> sets;

  const Exercise(this.id, this.title, this.sets);

  @override
  List<Object?> get props => [id, title, sets];
}

@immutable
class Set extends Equatable {
  final int id;
  final double weight;
  final int numberOfRepetitions;
  final Duration restTime;

  const Set(this.id, this.weight, this.numberOfRepetitions, this.restTime);

  @override
  List<Object?> get props => [id, weight, numberOfRepetitions, restTime];
}
