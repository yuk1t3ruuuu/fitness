import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:training/main.dart';
import 'package:training/model.dart';

Map<DateTime, List> eventsList = {}; //このリストにfirestoreからとってきたデータを格納する


class TodoNotifier extends StateNotifier<Map<DateTime, List>> {
  TodoNotifier() : super(eventsList);



  final CollectionReference<ToDo> todoRef = FirebaseFirestore.instance
      .collection('todos')
      .withConverter<ToDo>(
    fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );


  void addEvent (int index) async{
    final eventSnapshot = await todoRef.snapshots();

  }
}







final focusDayProvider = StateProvider((ref) => DateTime.now());

final selectDayProvider = StateProvider((ref) => DateTime.now());


