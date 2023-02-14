import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/blocs/workout_cubit.dart';

void main() {
  runApp(const WorkoutTime());
}

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutCubit>(
      create: (BuildContext context) {
        WorkoutCubit workoutCubit = WorkoutCubit();

        if (workoutCubit.state.isEmpty) {
          workoutCubit.getWorkout();
        }

        return workoutCubit;
      },
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}


// link: https://www.youtube.com/watch?v=1ENQHfNB9gM&ab_channel=dbestech