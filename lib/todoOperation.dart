import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:training/iconButton.dart';
import 'package:training/model.dart';
import 'package:training/provider.dart';

Map<DateTime, List> eventsList = {}; //このリストにfirestoreからとってきたデータを格納する
List eventContents = [];

var docData;


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



    await todoRef.doc('work ${workLength + 1}').update({
      'description': description!,
      'isCompleted': true
    }
      );


    todoRef.snapshots().listen((snapshot) {   //各日付に紐づけられているタスク内容(description)を取得しリストに格納する処理
      eventContents = [];
      snapshot.docs.map((doc) {
         docData = doc.data().description;
       eventContents.add(docData);
      });
      debugPrint('リストの中身$eventContents');
    });


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
