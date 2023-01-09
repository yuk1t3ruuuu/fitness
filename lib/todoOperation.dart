import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/iconButton.dart';
import 'package:training/model.dart';


Map<DateTime, List> eventsList = {}; //このリストにfirestoreからとってきたデータを格納する
List eventContents = [];

class todoOperation extends StatelessWidget {
   todoOperation({Key? key}) : super(key: key);

  final CollectionReference<ToDo> todoRef = FirebaseFirestore.instance
      .collection('todos').doc(timeEditingController.text).collection('work')
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
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
