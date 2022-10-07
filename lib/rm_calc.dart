import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RmCalculator extends StatefulWidget {
  const RmCalculator({Key? key}) : super(key: key);

  @override
  State<RmCalculator> createState() => _RmCalculatorState();
}

class _RmCalculatorState extends State<RmCalculator> {

  TextEditingController weightController = TextEditingController();
  TextEditingController repController = TextEditingController();

  double _weight = 0; //使用重量
  double _rep = 0;  //レップ数
  final int _baseNumber = 10;  //桁数調整のため使用
  double _maxRmResult = 0; //1RMの計算結果を格納するため使用
  double _rm3Result = 0; //3RMの計算結果を格納するため使用
  double _rm8Result = 0; //8RMの計算結果を格納するため使用
  double _rm12Result = 0; //12RMの計算結果を格納するため使用
  double _rm15Result = 0; //15RMの計算結果を格納するため使用

  double? _deviceWidth;

  maxRmCalc(){
    //　使用重量*(1+(レップ数/40))で1RMを求められる
   _maxRmResult = ((_weight * (1 + (_rep / 40))) * _baseNumber).floor() / _baseNumber;
   return _maxRmResult;
  }

  rm3Calc(){
    // 1RM/(1+(求めたいRM数/40)で任意のRM数を求められる
    _rm3Result = ((_maxRmResult / (1 + (3 / 40))) * _baseNumber).floor() / _baseNumber;
    return _rm3Result;
  }

  rm8Calc(){
    _rm8Result = ((_maxRmResult / (1 + (8 / 40))) * _baseNumber).floor() / _baseNumber;
    return _rm8Result;
  }

  rm12Calc(){
    _rm12Result = ((_maxRmResult / (1 + (12 / 40))) * _baseNumber).floor() / _baseNumber;
    return _rm12Result;
  }

  rm15Calc(){
    _rm15Result = ((_maxRmResult / (1 + (15 / 40))) * _baseNumber).floor() / _baseNumber;
    return _rm15Result;
  }


  widgetShow1RM() {
    if(_maxRmResult == 0){
      return const Text(' ');
    }
    return Text('${_maxRmResult}kg',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }


  widgetShow3RM() {
    if(_maxRmResult == 0){
      return const Text(' ');
    }
    return Text('${_rm3Result}kg以上',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }

  widgetShow8_12RM() {
    if(_maxRmResult == 0){
      return const Text(' ');
    }
    return Text('${_rm12Result}kg以上 ${_rm8Result}kg以下',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }

  widgetShow15RM() {
    if(_maxRmResult == 0){
      return const Text(' ');
    }
    return Text('${_rm15Result}kg以下',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }




  @override
  Widget build(BuildContext context) {

    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
         children: [
           const SizedBox(height: 60),

          Container(
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.bottomLeft,
            width: _deviceWidth,
            height: 30,
            color: Colors.grey[900],
            child: Text('使用重量(kg)', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10,),
          Container(
                    width: _deviceWidth,
                    height: 40,
                    color: Colors.grey[850],
                    child: TextFormField(
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                       validator: (value){
                         if(value!.isEmpty){
                           return '値が入力されていません' ;
                         }
                         return null;
                       },
                       controller: weightController,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                           isDense: true,
                           contentPadding: const EdgeInsets.symmetric(
                             horizontal: 15,
                             vertical: 4
                           ),
                           hintText: '値を入力してください',
                           border: InputBorder.none,
                           hintStyle: TextStyle(color: Colors.grey[400])),
                           style: TextStyle(color: Colors.grey[400])
                       ),
                     ),
           Container(
             padding: const EdgeInsets.only(left: 10),
             alignment: Alignment.bottomLeft,
             width: _deviceWidth,
             height: 30,
             color: Colors.grey[900],
             child: Text('レップ数(回)', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold)),
           ),
           const SizedBox(height: 10,),
           Container(
             width: _deviceWidth,
             height: 40,
             color: Colors.grey[850],
             child: TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               validator: (value){
                 if(value!.isEmpty){
                   return '値が入力されていません' ;
                 }
                 return null;
               },
               controller: repController,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   isDense: true,
                   contentPadding: const EdgeInsets.symmetric(
                     horizontal: 15,
                     vertical: 4
                   ),
                   hintText: '値を入力してください',
                   border: InputBorder.none,
                   hintStyle: TextStyle(color: Colors.grey[400])),
                   style: TextStyle(color: Colors.grey[400])
             ),
           ),
           const SizedBox(height: 30),
          Center(
            child:SizedBox(
              width: _deviceWidth,
              height: 50,
              child:ElevatedButton(
                onPressed: () => setState((){
                  _weight = double.parse(weightController.text);
                  _rep = double.parse(repController.text);
                  maxRmCalc();
                  rm3Calc();
                  rm8Calc();
                  rm12Calc();
                  rm15Calc();
                }) ,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                ),
               child: const Text('1RM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
            )
          ),
          const SizedBox(height: 40,),

           Container(
                   padding: const EdgeInsets.only(left: 10),
                   alignment: Alignment.bottomLeft,
                   height: 60,
                   width: _deviceWidth,
                   color: Colors.grey[900],
                   child:Text('1RM', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
               ),
           Row(
             children: [
               Container(
                   padding: const EdgeInsets.only(bottom: 10,left: 10),
                   child:const Text('●', style: TextStyle(color: Colors.black))
               ),
               Container(
                   width: 100,
                   height: 40,
                   margin: const EdgeInsets.only(top: 13),
                   child: widgetShow1RM()
               )
             ],
           ),
           Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _deviceWidth,
                  color: Colors.grey[900],
                  child:Text('筋肥大', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child:const Text('●', style: TextStyle(color: Colors.black))
              ),
              Expanded( //textを１行で表示するためにexpandedを使用
                  child:Container(
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.only(top: 9, left: 3),
                      child: widgetShow8_12RM()
                  )
              )
            ],
          ),
          const SizedBox(height: 10,),

           Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _deviceWidth,
                  color: Colors.grey[900],
                  child:Text('神経強化', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child:const Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 40,
                  padding: const EdgeInsets.only(top: 9, left: 3),
                  child: widgetShow3RM()
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _deviceWidth,
                  color: Colors.grey[900],
                  child:Text('筋持久力', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child:const Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 50,
                  padding: const EdgeInsets.only(top: 9, left: 3),
                  child: widgetShow15RM()
              ),
            ],
          ),
        ],
      )
      )
    );
  }
}
