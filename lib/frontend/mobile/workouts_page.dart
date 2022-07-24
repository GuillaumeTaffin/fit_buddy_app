import 'package:fit_buddy_app/backend/workouts/workouts_bloc.dart';
import 'package:fit_buddy_app/frontend/components/helpers.dart';
import 'package:fit_buddy_app/frontend/components/pages.dart';
import 'package:fit_buddy_app/frontend/mobile/workouts_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../backend/workouts/models.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WorkoutsBloc>().add(GetAllWorkouts());
    return BasePage(
      title: 'workouts',
      body: BlocBuilder<WorkoutsBloc, WorkoutsState>(
        builder: (context, state) {
          if (state is AllWorkouts) {
            return WorkoutsList(workouts: state.workouts);
          }
          return const LoadingPageBody(label: 'Loading workouts ...');
        },
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final List<Workout> workouts;

  const WorkoutsList({
    Key? key,
    required this.workouts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => WorkoutItem(workout: workouts.reversed.toList()[index]),
      itemCount: workouts.length,
    );
  }
}

class WorkoutItem extends StatelessWidget {
  final Workout workout;

  const WorkoutItem({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        workout.title.toUpperCase(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        workout.trainedAt.toLocal().toString().split(' ')[0],
        style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey),
      ),
      trailing: IconButton(
        onPressed: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => WorkoutsDataPage(workout: workout))),
        icon: const Icon(Icons.dataset_outlined),
      ),
    );
  }
}

class LoadingPageBody extends StatelessWidget {
  final String label;

  const LoadingPageBody({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const CircularProgressIndicator(),
        ].padItems(const EdgeInsets.all(16.0)),
      ),
    );
  }
}
