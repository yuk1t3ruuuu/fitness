

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/iconButton.dart';
import 'package:training/model.dart';


Map<DateTime, List> eventsList = {}; //このリストにfirestoreからとってきたデータを格納する


class todoOperation extends StatelessWidget {
   todoOperation({Key? key}) : super(key: key);



   final CollectionReference dateRef = FirebaseFirestore.instance
       .collection('todos')
       .withConverter<Date>(
     fromFirestore: (snapshots, _) => Date.fromJson(snapshots.data()!),
     toFirestore: (date, _) => date.toJson(),
   );


  addToDo({String? description, DateTime? workDay}) async {
    await dateRef.doc('$workDay').set(
      Date(
        createdAt: DateTime.now()
      )
    );

    final CollectionReference<ToDo> workRef = FirebaseFirestore.instance
        .collection('todos').doc('$workDay').collection('work')
        .withConverter<ToDo>(
      fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
      toFirestore: (todo, _) => todo.toJson(),
    );

    final workSnapshot = await workRef.get();
    final workLength = workSnapshot.docs.length;

    await workRef.doc('work ${workLength + 1}').set(
      ToDo(
          description: description!,
          isCompleted: true
      ));

    List dateDocsList = [];
    final dateSnapshot = await dateRef.get();
    dateSnapshot.docs.map((QueryDocumentSnapshot doc)  {
      dateDocsList = [];
      dateDocsList.add(doc!.id);
    });

    await Future.forEach(dateDocsList, (dateDoc) async{
      final CollectionReference<ToDo> workRef = dateDoc.reference.collection('work')
          .withConverter<ToDo>(
          fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
          toFirestore: (todo, _) => todo.toJson()
      );

      final workSnapshot = await workRef.get();
      final workDocs = workSnapshot.docs;
      eventsList[DateTime.parse('$dateDoc')] = workDocs;
    });











  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
