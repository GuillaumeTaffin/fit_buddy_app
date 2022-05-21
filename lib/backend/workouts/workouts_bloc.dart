import 'package:equatable/equatable.dart';
import 'package:fit_buddy_app/backend/workouts/workouts_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models.dart';
import 'workouts_cache.dart';

part 'workouts_event.dart';

part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutsRepository _workoutsRepository;
  final WorkoutsCache _workoutsCache;

  WorkoutsBloc(this._workoutsRepository, [WorkoutsCache? cache])
      : _workoutsCache = cache ?? WorkoutsCache(),
        super(AllWorkouts(const [])) {
    on<GetAllWorkouts>(_handleGetAllWorkouts);
  }

  void _handleGetAllWorkouts(GetAllWorkouts event, Emitter<WorkoutsState> emit) async {
    emit(WorkoutsLoading());
    var workouts = await _findWorkouts();
    emit(AllWorkouts(workouts));
  }

  Future<List<Workout>> _findWorkouts() async {
    if (_workoutsCache.isEmpty) {
      var workouts = await _fromRepository();
      _workoutsCache.saveWorkouts(workouts);
    }
    return _workoutsCache.workouts;
  }

  Future<List<Workout>> _fromRepository() async {
    var dtos = await _workoutsRepository.fetchAllWorkouts();
    return dtos.map((e) => e.toEntity()).toList();
  }
}
