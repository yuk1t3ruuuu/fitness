import 'package:flutter/material.dart';
import 'package:training/timer.dart';
import 'package:training/rm_calc.dart';
import 'package:training/home.dart';
import 'package:training/calender.dart';
import 'dart:async';

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
    Timer(),
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
              label: 'ホーム'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'スケジュール'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'タイマー'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'RM'
          )
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green,
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

