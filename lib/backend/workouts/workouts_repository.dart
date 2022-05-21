import 'package:supabase_flutter/supabase_flutter.dart';

import 'dto/dto.dart';

abstract class WorkoutsRepository {
  Future<List<WorkoutDto>> fetchAllWorkouts();
}

class WorkoutsRepositorySupabase extends WorkoutsRepository {
  @override
  Future<List<WorkoutDto>> fetchAllWorkouts() async {
    var response = await Supabase.instance.client.from('workouts').select('''
    id, 
    title,
    training_at,
    exercises (
      id,
      title,
      sets (
        id,
        weight,
        reps,
        rest_time
      )
    )
    ''').execute();
    var data = response.data as List<dynamic>;
    return data.map((e) => WorkoutDto.fromJson(e)).toList();
  }
}
