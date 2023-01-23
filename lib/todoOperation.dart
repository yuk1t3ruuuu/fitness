

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  }


   getDocument() async{
    List<String> workList = [];
     final dateSnapshot = await dateRef.get();

     for (final dateDoc in dateSnapshot.docs){
       final CollectionReference<ToDo> workRef = dateDoc.reference.collection(
           'work')
           .withConverter<ToDo>(
           fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
           toFirestore: (todo, _) => todo.toJson()
       );
       final workSnapshot = await workRef.get();

        for (final workDoc in workSnapshot.docs)  {
         workList.add(workDoc.data().description);
       }
       eventsList[DateTime.parse(dateDoc.id)] = workList;
       workList = [];
     }
     debugPrint('中身$eventsList');



   }



  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
