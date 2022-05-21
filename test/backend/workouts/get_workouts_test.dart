import 'package:bloc_test/bloc_test.dart';
import 'package:fit_buddy_app/backend/workouts/dto/dto.dart';
import 'package:fit_buddy_app/backend/workouts/models.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_bloc.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_cache.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Initially no workouts are loaded', () {
    var bloc = WorkoutsBloc(WorkoutsRepositoryInMemory());
    expect(bloc.state, AllWorkouts(const []));
  });

  var workouts = [
    Workout(0, 'w1', DateTime.now().subtract(const Duration(days: 2))),
    Workout(1, 'w2', DateTime.now().subtract(const Duration(days: 1))),
  ];

  group('Load workouts from the repository', () {
    var cache = WorkoutsCache();

    blocTest<WorkoutsBloc, WorkoutsState>(
      'Get all workouts successfully from the repository when not loaded',
      build: () => WorkoutsBloc(WorkoutsRepositoryInMemory(workouts: workouts), cache),
      act: (bloc) => bloc.add(GetAllWorkouts()),
      expect: () => [WorkoutsLoading(), AllWorkouts(workouts)],
    );

    test('Cache is populated with loaded data', () {
      expect(cache.workouts, workouts);
    });
  });

  blocTest<WorkoutsBloc, WorkoutsState>(
    'Get all workouts from cache if already filled with workouts',
    build: () => WorkoutsBloc(WorkoutsRepositoryInMemory(), WorkoutsCache()..saveWorkouts(workouts)),
    act: (bloc) => bloc.add(GetAllWorkouts()),
    expect: () => [WorkoutsLoading(), AllWorkouts(workouts)],
  );
}

class WorkoutsRepositoryInMemory implements WorkoutsRepository {
  final List<Workout> _workouts;

  WorkoutsRepositoryInMemory({List<Workout>? workouts}) : _workouts = workouts ?? const [];

  @override
  Future<List<WorkoutDto>> fetchAllWorkouts() async {
    return _workouts.map((e) => WorkoutDto.fromEntity(e)).toList();
  }
}
