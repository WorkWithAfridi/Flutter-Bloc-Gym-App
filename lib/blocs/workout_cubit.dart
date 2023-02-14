import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/models/workout_model.dart';

class WorkoutCubit extends Cubit<List<WorkoutModel>> {
  WorkoutCubit() : super([]);

  getWorkout() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final workoutListJson = jsonDecode(
      await rootBundle.loadString("assets/workouts.json"),
    );

    List<WorkoutModel> workoutList = [];

    for (var workout in (workoutListJson as Iterable)) {
      workoutList.add(
        WorkoutModel.fromJson(
          workout,
        ),
      );
    }

    emit(workoutList);
  }
}
