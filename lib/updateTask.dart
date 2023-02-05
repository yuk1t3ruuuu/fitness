import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/todoOperation.dart';



TextEditingController updateDescEditingController = TextEditingController();


class UpdateTask extends ConsumerWidget{
  const UpdateTask(this.selectedDay,this.event, {Key? key}) : super(key: key);

  final DateTime selectedDay;
  final String event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed:()=> showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return Consumer(
                builder: (context, ref, _){
                  return AlertDialog(
                    title:  Text('タスクの追加'),
                    content: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: updateDescEditingController,
                            decoration:  InputDecoration(labelText: 'タスク名', border: OutlineInputBorder()),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: (){
                          updateDocument(date: selectedDay, oldDesc: event, newDesc: updateDescEditingController.text);
                          updateDescEditingController.clear();
                          Navigator.pop(context, 'OK');
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
        ),
        icon: Icon(Icons.update, color: Colors.blue));

  }
}