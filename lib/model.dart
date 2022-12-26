import 'package:flutter/material.dart';

@immutable
class ToDo{
  const ToDo({
    required this.description,
    required this.isCompleted,
  });

  ToDo.fromJson(Map<String, Object?> json)
      :this(
      description: json['description']! as String,
      isCompleted: json['isCompleted']! as bool,
  );

  final String description;
  final bool isCompleted;


  Map<String, Object?> toJson() {
    return {
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  ToDo copyWith({String? description, bool? isCompleted }) {
    return ToDo(
        description: description?? this.description,
        isCompleted: isCompleted?? this.isCompleted,
    );
  }
}