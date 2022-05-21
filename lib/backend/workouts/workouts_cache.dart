import 'models.dart';

class WorkoutsCache {
  final List<Workout> _workouts = List.of([]);

  WorkoutsCache();

  List<Workout> get workouts => [..._workouts];

  bool get isEmpty => _workouts.isEmpty;

  void saveWorkouts(List<Workout> workouts) {
    _workouts.addAll(workouts);
  }
}
