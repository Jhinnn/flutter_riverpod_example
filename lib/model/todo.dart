// The state of our StateNotifier should be immutable.
// We could also use packages like Freezed to help with the implementation.

import 'package:flutter/material.dart';

@immutable
class Todo {
  const Todo(
      {
      required this.id,
      required this.title,
      required this.description,
      required this.completed,required this.dateTime });

  // All properties should be `final` on our class.
  final String id;
  final String title;
  final String description;
  final bool completed;
  final DateTime dateTime;

  // Since Todo is immutable, we implement a method that allows cloning the
  // Todo with slightly different content.
  //由于Todo是不可变的，我们实现了一个方法，允许克隆Todo的内容略有不同。
  Todo copyWith({String? id, String? title, String? description, bool? completed,DateTime? dateTime}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      dateTime: dateTime ?? this.dateTime
    );
  }
}
