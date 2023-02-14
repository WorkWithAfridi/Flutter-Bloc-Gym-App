// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExerciseModel extends Equatable {
  String? title;
  int? prelude;
  int? duration;
  int? index;
  int? startTime;

  ExerciseModel({
    this.title,
    this.prelude,
    this.duration,
    this.index,
    this.startTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'prelude': prelude,
      'duration': duration,
    };
  }

  factory ExerciseModel.fromMap(
    Map<String, dynamic> map,
    int? index,
    int? startTime,
  ) {
    return ExerciseModel(
      title: map['title'] != null ? map['title'] as String : null,
      prelude: map['prelude'] != null ? map['prelude'] as int : null,
      duration: map['duration'] != null ? map['duration'] as int : null,
      index: index,
      startTime: startTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseModel.fromJson(
    String source,
    int? index,
    int? startTime,
  ) =>
      ExerciseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
        index,
        startTime,
      );

  @override
  List<Object?> get props => [
        title,
        prelude,
        duration,
        index,
        startTime,
      ];

  @override
  bool get stringify => true;
}
