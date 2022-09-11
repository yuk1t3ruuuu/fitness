import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {

  DateTime time = DateTime(0);
  bool isCounting = false;
  late Timer timer;

  addSecond5(){
    setState(() {
      time = time.add(Duration(seconds: 5));
    });
  }

  substractSecond5(){
    setState(() {
      time = time.subtract(Duration(seconds: 5));
    });
  }

  addMinute5(){
    setState((){
      time = time.add(Duration(minutes: 5));
    });
  }

  substractMinute5(){
    setState(() {
      time = time.subtract(Duration(minutes: 5));
    });
  }

  addSecond1(){
    setState(() {
      time = time.add(Duration(seconds: 1));
    });
  }

  substractSecond1(){
    setState(() {
      time = time.subtract(Duration(seconds: 1));
    });
  }

  addMinute1(){
    setState((){
      time = time.add(Duration(minutes: 1));
    });
  }

  substractMinute1(){
    setState(() {
      time = time.subtract(Duration(minutes: 1));
    });
  }

  startTimer(){
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if(time.hour==0&&time.minute==0&&time.second==0){
          stopTimer();
          return;
        }
        setState(() {
          time = time.add(Duration(seconds: -1));
          isCounting =true;
        });
      },
    );
  }

  stopTimer(){
    timer.cancel();
    setState(() {
      isCounting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 120,),
            Container(
                child: Center(
                    child:Text(DateFormat.ms().format(time),style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),)
                )
            ),
            const SizedBox(height: 50),
            Row(
                children:[
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child:Text('Minute', style: TextStyle(color: Colors.black),textAlign: TextAlign.left))
                ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  //setStateのところは仮で記述している処理。以下同じ
                    onPressed: () => addMinute5(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('+5', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => substractMinute5(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('-5', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => addMinute1(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('+1', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => substractMinute1(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('-1', style: TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(height: 50,),
            Row(
                children:[
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child:Text('Second', style: TextStyle(color: Colors.black),textAlign: TextAlign.left))
                ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => addSecond5(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('+5', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => substractSecond5(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('-5', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => addSecond1(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('+1', style: TextStyle(color: Colors.white))),
                ElevatedButton(
                    onPressed: () => substractSecond1(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ),
                    child: const Text('-1', style: TextStyle(color: Colors.white))),
              ],
            ),
            const SizedBox(height: 100,),
            SizedBox(
                width: 200,
                height: 80,
                child:
                  isCounting?ElevatedButton(onPressed: stopTimer,style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                    ), child: const Text('STOP',style: TextStyle(color: Colors.white,fontSize: 30)))
                    :ElevatedButton(onPressed: startTimer, style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                   ),child: const Text('START',style: TextStyle(color: Colors.white,fontSize: 30)))
            )
          ],
        )
    );
  }
}

