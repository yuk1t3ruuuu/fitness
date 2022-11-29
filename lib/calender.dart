
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';


class Calender extends StatefulWidget { 
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calender')),
      body: TableCalendar(
        firstDay: DateTime.utc(2022, 8, 1),
        lastDay: DateTime.utc(2022, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay){
          if (!isSameDay(_selectedDay, selectedDay)){
            setState((){
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
      ),

    );
  }
}
