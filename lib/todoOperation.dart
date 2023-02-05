import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training/model.dart';


Map<DateTime, List> eventsList = {};

   final CollectionReference dateRef = FirebaseFirestore.instance
       .collection('todos')
       .withConverter<Date>(
     fromFirestore: (snapshots, _) => Date.fromJson(snapshots.data()!),
     toFirestore: (date, _) => date.toJson(),
   );


   addToDo({required String description, required DateTime workDay}) async {
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

    await workRef.doc('${workLength + 1}').set(
      ToDo(
          description: description!,
      ));
    getDocument();
  }


   getDocument() async{

     List <String> _workList = [];
     final dateSnapshot = await dateRef.get();

     for (final dateDoc in dateSnapshot.docs){
       _workList = [];
       final CollectionReference<ToDo> workRef = dateDoc.reference.collection(
           'work')
           .withConverter<ToDo>(
           fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
           toFirestore: (todo, _) => todo.toJson()
       );
       final workSnapshot = await workRef.get();
       for (final workDoc in workSnapshot.docs) {
        _workList.add(workDoc.data().description) ;
       }
       eventsList[DateTime.parse(dateDoc.id)] = _workList;
     } return eventsList;
   }




   deleteDocument({required DateTime date, required String description})async{
     final dateSnapshot = await dateRef.get();

     for (final dateDoc in dateSnapshot.docs){
       final CollectionReference<ToDo> workRef = dateDoc.reference.collection(
           'work')
           .withConverter<ToDo>(
           fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
           toFirestore: (todo, _) => todo.toJson()
       );
       final workSnapshot = await workRef.get();
       String castDate = date.toString();
       int lastPos = castDate.length - 1;
       String result = castDate.substring(0, lastPos);


       for (final workDoc in workSnapshot.docs){
          if (result == dateDoc.id){
            if (workDoc.data().description.contains(description)){
               workRef.doc(workDoc.id).delete();
               eventsList[result]?.remove(description);
               getDocument();
            }
          }
         }
       }
     }
     
     
     updateDocument({required DateTime date, required String oldDesc, required String newDesc })async{
       final dateSnapshot = await dateRef.get();
       
       for (final dateDoc in dateSnapshot.docs){
         final CollectionReference<ToDo> workRef = dateDoc.reference.collection(
             'work')
             .withConverter<ToDo>(
             fromFirestore: (snapshots, _) => ToDo.fromJson(snapshots.data()!),
             toFirestore: (todo, _) => todo.toJson()
         );
         
         final workSnapshot = await workRef.get();
         String castDate = date.toString();
         int lastPos = castDate.length - 1;
         String result = castDate.substring(0, lastPos);
         
         for (final workDoc in workSnapshot.docs){
           if (result == dateDoc.id){
             if (workDoc.data().description.contains(oldDesc)){
               await workRef.doc(workDoc.id).update({'description': newDesc});
               int? index = eventsList[result]?.indexOf(oldDesc);
               eventsList[result]?[index!] = newDesc;
               getDocument();
             }
           }
         }
       }
     }





