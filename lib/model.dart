import 'package:flutter/material.dart';

@immutable
class ToDo{
  const ToDo({
    required this.description,
  });

  ToDo.fromJson(Map<String, Object?> json)
      :this(
      description: json['description']! as String,
  );

  final String description;

  Map<String, Object?> toJson() {
    return {
      'description': description,
    };
  }


}



@immutable
class Date{
  const Date({
    required this.createdAt
  });

  Date.fromJson(Map<String, Object?> json)
      :this(
      createdAt: json['createdAt']! as DateTime
  );


  final DateTime createdAt;

  Map<String, Object?> toJson() {
    return {
      'createdAt': createdAt
    };
  }

}