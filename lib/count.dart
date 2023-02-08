import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';


class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {

  DateTime time = DateTime(0);
  bool isCounting = false;
  late Timer timer;
  late Timer alarm;

  addSecond5(){
    setState(() {
      time = time.add(Duration(seconds: 5));
    });
    return;
  }

  subTractSecond5(){
    setState(() {
      time = time.subtract(Duration(seconds: 5));
    });
    return;
  }

  addMinute5(){
    setState((){
      time = time.add(Duration(minutes: 5));
    });
    return;
  }

  subTractMinute5(){
    setState(() {
      time = time.subtract(Duration(minutes: 5));
    });
    return;
  }

  addSecond1(){
    setState(() {
      time = time.add(Duration(seconds: 1));
    });
    return;
  }

  subTractSecond1(){
    setState(() {
      time = time.subtract(Duration(seconds: 1));
    });
    return;
  }

  addMinute1(){
    setState((){
      time = time.add(Duration(minutes: 1));
    });
    return;
  }

  subTractMinute1(){
    setState(() {
      time = time.subtract(Duration(minutes: 1));
    });
    return;
  }

  startTimer(){
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if(time.minute==0&&time.second==0){
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
    return;
  }

  resetTimer(){
    setState((){
      time = DateTime(0);
    });
    return;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          children: [
            const SizedBox(height: 100,),
            Material(
              color: Colors.grey[850],
              elevation: 30,
              child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[800],
                  ),
                  child: Text(DateFormat.ms().format(time),style: GoogleFonts.amiri(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
              )
            ),
            const SizedBox(height: 50),
            Row(
                children:[
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child:Text('Minutes', style: GoogleFonts.amiri(color: Colors.grey[400], fontSize: 20),textAlign: TextAlign.left)
                  )
                ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      onPressed: () => addMinute5(),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(CircleBorder(
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid
                              )
                          )),
                          backgroundColor: MaterialStateProperty.all(Colors.pink[900]),
                          elevation: MaterialStateProperty.all(20)
                      ),
                      child: const Text('+5', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => subTractMinute5(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('-5', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => addMinute1(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.lightGreen[800]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('+1', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => subTractMinute1(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.indigo[800]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('-1', style: TextStyle(color: Colors.black)))
                )
              ],
            ),
            const SizedBox(height: 50,),
            Row(
                children:[
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child:Text('Seconds', style: GoogleFonts.amiri(color: Colors.grey[400], fontSize: 20),textAlign: TextAlign.left)
                  )
                ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => addSecond5(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.pink[200]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('+5', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => subTractSecond5(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('-5', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => addSecond1(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurple[200]),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child: const Text('+1', style: TextStyle(color: Colors.black)))
                ),
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ElevatedButton(
                        onPressed: () => subTractSecond1(),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                            shape: MaterialStateProperty.all(CircleBorder(
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                    style: BorderStyle.solid
                                )
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            elevation: MaterialStateProperty.all(20)
                        ),
                        child:  Text('-1', style: TextStyle(color: Colors.black)))
                )
              ],
            ),
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(width: 50,),
                  SizedBox(
                      width: 200,
                      height: 80,
                      child:
                      isCounting?ElevatedButton(onPressed: stopTimer,style: ButtonStyle(
                          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                      ), child:  Text('STOP', style: GoogleFonts.amiri(color: Colors.black87, fontSize: 30,fontWeight: FontWeight.bold),))
                          :ElevatedButton(onPressed: startTimer, style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black26),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                      ),child: Text('START', style: GoogleFonts.amiri(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold)))
                  ),
                SizedBox(width: 20,),
                GestureDetector(
                  child: Icon(Icons.refresh, color: Colors.white, size: 30,),
                  onTap: () => resetTimer(),
                )
              ],
            )
          ],
        )
    );
  }
}

