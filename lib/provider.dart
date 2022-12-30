import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:training/main.dart';
import 'package:training/model.dart';
import 'package:training/iconButton.dart';
import 'package:training/todoOperation.dart';




class TodoNotifier extends StateNotifier<Map<DateTime, List>> {
  TodoNotifier() : super(eventsList);





  void addEvent (int index) async{


  }
}







final focusDayProvider = StateProvider((ref) => DateTime.now());

final selectDayProvider = StateProvider((ref) => DateTime.now());


