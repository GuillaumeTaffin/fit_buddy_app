import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/pages.dart';
import 'package:flutter/material.dart';

import '../../backend/workouts/models.dart';

class WorkoutsDataPage extends StatelessWidget {
  final Workout workout;

  const WorkoutsDataPage({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: workout.title.toUpperCase(),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => ExerciseReadOnlyData(workout.exercises[index]),
        itemCount: workout.exercises.length,
      ),
    );
  }
}

class ExerciseReadOnlyData extends StatelessWidget {
  final Exercise exercise;

  const ExerciseReadOnlyData(this.exercise, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            exercise.title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
          ),
          DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Set',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Weight',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Reps',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rest',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: exercise.sets
                .asMap()
                .map(
                  (i, e) => MapEntry(
                    i,
                    DataRow(
                      cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(Text('${e.weight}')),
                        DataCell(Text('${e.numberOfRepetitions}')),
                        DataCell(Text('${e.restTime.inSeconds}')),
                      ],
                    ),
                  ),
                )
                .values
                .toList(),
          )
        ].padItems(const EdgeInsets.symmetric(vertical: 8.0)),
      ),
    );
  }
}
