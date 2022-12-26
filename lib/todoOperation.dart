import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/iconButton.dart';
import 'package:training/model.dart';


class todoOperation extends StatelessWidget {
   todoOperation({Key? key}) : super(key: key);

  final CollectionReference<ToDo> todoRef = FirebaseFirestore.instance
      .collection('todos').doc(timeEditingController.text).collection('work')
      .withConverter<ToDo>(
    fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
    toFirestore: (todo, _) => todo.toJson(),
  );


  addToDo({String? description, DateTime? workDay}) async {
    final workSnapshot = await todoRef.doc('$workDay').collection('work').get();
    final workLength = workSnapshot.docs.length;
    await todoRef.doc('work ${workLength + 1}').set(
      ToDo(
          description: description!,
          isCompleted: true
      ),
      SetOptions(merge: true)
    );
  }

  deleteToDo({int? key}) async {
    await todoRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        if (int.parse(doc.id) == key) {
          todoRef.doc(doc.id).delete();
        }
      });
    }
    );
  }

  updateDescription({int? key, String? description}) async {
    await todoRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        if (int.parse(doc.id) == key) {
          todoRef.doc(doc.id).update({'description': description});
        }
      });
    }
    );
  }

  updateIsCompleted({int? key, bool? isCompleted}) async {
    await todoRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        if (int.parse(doc.id) == key) {
          if (isCompleted!){
            todoRef.doc(doc.id).update({'isCompleted': false});
          }else if(!isCompleted){
            todoRef.doc(doc.id).update({'isCompleted': true});
          }
        }
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
