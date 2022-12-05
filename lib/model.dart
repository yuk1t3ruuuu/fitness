import 'package:flutter/material.dart';

@immutable
class ToDo{
  const ToDo({
    required this.description,
    required this.isCompleted,
    required this.key,
    required this.createdAt
  });

  ToDo.fromJson(Map<String, Object?> json)
      :this(
      description: json['description']! as String,
      isCompleted: json['isCompleted']! as bool,
      key: json['key']! as String,
      createdAt: json['createdAt']! as DateTime
  );

  final String description;
  final bool isCompleted;
  final String key;
  final DateTime createdAt;


  Map<String, Object?> toJson() {
    return {
      'description': description,
      'isCompleted': isCompleted,
      'key': key,
      'createdAt': createdAt
    };
  }

  ToDo copyWith({String? description, bool? isCompleted, String? key, DateTime? createdAt }) {
    return ToDo(
        description: description?? this.description,
        isCompleted: isCompleted?? this.isCompleted,
        key: key?? this.key,
        createdAt: createdAt?? this.createdAt
    );
  }
}