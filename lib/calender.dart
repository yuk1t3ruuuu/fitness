import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:training/provider.dart';
import 'package:training/iconButton.dart';


class Calender extends  ConsumerWidget{
   Calender({Key? key}) : super(key: key);

   int getHashCode(DateTime key) {
     return key.day * 1000000 + key.month * 10000 + key.year;
   }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final focusedDay = ref.watch(focusDayProvider);
    final selectDay = ref.watch(selectDayProvider);

    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventsList);

    List getEvent(DateTime day) {
      return events[day] ?? [];
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Calender'),
        actions: <Widget>[
          ButtonActions()
        ],
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2022, 8, 1),
        lastDay: DateTime.utc(2022, 12, 31),
        eventLoader: getEvent,
        headerStyle: HeaderStyle(formatButtonVisible: false),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(selectDay, day);
        },
        onDaySelected: (selectedDay, focusedDay){
          if (!isSameDay(selectDay, selectedDay)){
            ref.read(focusDayProvider.notifier).state = focusedDay;
            ref.read(selectDayProvider.notifier).state = selectedDay;
          }
        },
        onPageChanged:(focusedDay) {
          ref.read(focusDayProvider.notifier).state = focusedDay;
        },
      ),
    );
  }
}
