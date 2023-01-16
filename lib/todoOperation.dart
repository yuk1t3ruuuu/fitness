

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/iconButton.dart';
import 'package:training/model.dart';


Map<DateTime, List> eventsList = {}; //このリストにfirestoreからとってきたデータを格納する


class todoOperation extends StatelessWidget {
   todoOperation({Key? key}) : super(key: key);

  final CollectionReference<ToDo> todoRef = FirebaseFirestore.instance
      .collection('todos').doc(timeEditingController.text).collection('work')
      .withConverter<ToDo>(
    fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );

   final CollectionReference<ToDo> dateRef = FirebaseFirestore.instance
       .collection('todos')
       .withConverter<ToDo>(
     fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
     toFirestore: (todo, _) => todo.toJson(),
   );


  addToDo({String? description, DateTime? workDay}) async {
    final workSnapshot = await todoRef.get();
    final workLength = workSnapshot.docs.length;
    await todoRef.doc('work ${workLength + 1}').set(
        ToDo(
          description: description!,
          isCompleted: true,
        )
    );

    final dateSnapshots = await dateRef.get();
    final dateDocs = dateSnapshots.docs;
    debugPrint('dateDocs中身$dateDocs');

    for (final doc in dateDocs){
      final CollectionReference<ToDo> workRef = doc.reference.collection('work')
          .withConverter<ToDo>(
        fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
        toFirestore: (todo, _) => todo.toJson()
      );

      final workSnapshot = await workRef.get();
      final workDocs = workSnapshot.docs;
      eventsList[DateTime.parse('$doc')] = workDocs;
    }
    debugPrint('eventsList中身$eventsList');
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
