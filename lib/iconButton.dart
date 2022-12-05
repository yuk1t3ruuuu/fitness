import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/todoOperation.dart';



TextEditingController descriptionEditingController = TextEditingController();

class ButtonActions extends ConsumerWidget{
  ButtonActions({Key? key}) : super(key: key);


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
                            controller: descriptionEditingController,
                            decoration:  InputDecoration(labelText: 'タスク名', border: OutlineInputBorder()),
                          ),
                          SizedBox(height: 30,)
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
                          todoOperation().addToDo(description: descriptionEditingController.text);
                          descriptionEditingController.clear();
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
        icon: Icon(Icons.add));

  }
}