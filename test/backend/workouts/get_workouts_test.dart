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
    Workout(
      0,
      'w1',
      DateTime.now().subtract(const Duration(days: 2)),
      const [
        Exercise(
          0,
          'e1',
          [
            Set(3, 55.5, 10, Duration(seconds: 190)),
            Set(5, 90, 15, Duration(seconds: 120)),
            Set(5, 90, 15, Duration(seconds: 120)),
          ],
        ),
        Exercise(
          3,
          'e2',
          [
            Set(4, 14.25, 15, Duration(seconds: 190)),
          ],
        ),
      ],
    ),
    Workout(
      1,
      'w2',
      DateTime.now().subtract(const Duration(days: 1)),
      const [
        Exercise(
          5,
          'e5',
          [
            Set(2, 40, 6, Duration(seconds: 90)),
          ],
        )
      ],
    ),
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
