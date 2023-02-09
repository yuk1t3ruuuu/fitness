import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:training/count.dart';
import 'package:training/rm_calc.dart';
import 'package:training/calender.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Mainpage()
    );
  }
}

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  int _activeIndex = 0;

  final _pages = [
    Calender(),
    Count(),
    RmCalculator()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF303030),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'schedule',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'timer',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'RM',
          )
        ],
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        currentIndex: _activeIndex,
        onTap: (index){
          setState((){
            _activeIndex = index;
          });
        },
      ),
    );
  }
}

