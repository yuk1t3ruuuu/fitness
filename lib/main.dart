import 'package:flutter/material.dart';
import 'package:training/count.dart';
import 'package:training/rm_calc.dart';
import 'package:training/home.dart';
import 'package:training/calender.dart';


void main() {
  runApp(const MyApp());
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
    Home(),
    Calender(),
    Count(),
    RmCalculator()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'ホーム',
              backgroundColor: Color(0xFF303030)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'スケジュール',
              backgroundColor: Color(0xFF303030)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'タイマー',
              backgroundColor: Color(0xFF303030)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'RM',
              backgroundColor: Color(0xFF303030)
          )
        ],
        unselectedItemColor: Colors.grey[400],
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

