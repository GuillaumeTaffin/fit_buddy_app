import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Workout extends Equatable {
  final int id;
  final String title;
  final DateTime trainedAt;

  const Workout(this.id, this.title, this.trainedAt);

  @override
  List<Object?> get props => [id, title, trainedAt];
}
