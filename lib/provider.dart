import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final focusDayProvider = StateProvider((ref) => DateTime.now());

final selectDayProvider = StateProvider((ref) => DateTime.now());


