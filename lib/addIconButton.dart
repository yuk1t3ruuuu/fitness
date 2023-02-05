import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:training/todoOperation.dart';



TextEditingController descriptionEditingController = TextEditingController();
TextEditingController timeEditingController = TextEditingController();

DateTime? selectedDate;

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
                          SizedBox(height: 10,),
                          TextField(
                            controller: timeEditingController,
                            decoration:  InputDecoration(labelText: '予定日', border: OutlineInputBorder()),
                          ),
                          IconButton(
                              onPressed: () {
                                selectDate(context);
                              },
                              icon: Icon(Icons.calendar_today, color: Colors.red,)),
                          SizedBox(height: 30)
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
                          addToDo(description: descriptionEditingController.text, workDay: DateTime.parse(timeEditingController.text));
                          descriptionEditingController.clear();
                          timeEditingController.clear();
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

  selectDate(BuildContext context) async {
    final newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      timeEditingController.text = selectedDate.toString();
    }
  }

}