// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app_complete/models/exercise_model.dart';

class WorkoutModel extends Equatable {
  String? title;
  List<ExerciseModel>? exercises;

  WorkoutModel({
    this.title,
    this.exercises,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'exercises': exercises?.map((x) => x.toMap()).toList(),
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    int index = 0;
    int startTime = 0;
    return WorkoutModel(
      title: map['title'] != null ? map['title'] as String : null,
      exercises: map['exercises'] != null
          ? List<ExerciseModel>.from(
              (map['exercises'] as List).map<ExerciseModel?>(
                (x) {
                  ExerciseModel exerciseModel = ExerciseModel.fromMap(
                    x as Map<String, dynamic>,
                    index,
                    startTime,
                  );

                  index++;

                  startTime += exerciseModel.duration ?? 0 + (exerciseModel.prelude ?? 0);
                  exerciseModel.startTime = startTime;

                  return exerciseModel;
                },
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) => WorkoutModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  List<Object?> get props => [
        title,
        exercises,
      ];

  @override
  bool get stringify => true;
}
