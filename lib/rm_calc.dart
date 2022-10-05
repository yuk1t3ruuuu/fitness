import 'package:flutter/material.dart';

class RmCalculator extends StatefulWidget {
  const RmCalculator({Key? key}) : super(key: key);

  @override
  State<RmCalculator> createState() => _RmCalculatorState();
}

class _RmCalculatorState extends State<RmCalculator> {

  TextEditingController weight_controller = TextEditingController();
  TextEditingController rep_controller = TextEditingController();

  double _weight = 0; //使用重量
  double _rep = 0;  //レップ数
  int base_number = 10;  //桁数調整のため使用
  double _max_rm_result = 0; //1RMの計算結果を格納するため使用
  double _rm3_result = 0; //3RMの計算結果を格納するため使用
  double _rm8_result = 0; //8RMの計算結果を格納するため使用
  double _rm12_result = 0; //12RMの計算結果を格納するため使用
  double _rm15_result = 0; //15RMの計算結果を格納するため使用

  double? _device_width;

  max_rm_calc(){
    //　使用重量*(1+(レップ数/40))で1RMを求められる
   _max_rm_result = ((_weight * (1 + (_rep / 40))) * base_number).floor() / base_number;
   return _max_rm_result;
  }

  rm3_calc(){
    // 1RM/(1+(求めたいRM数/40)で任意のRM数を求められる
    _rm3_result = ((_max_rm_result / (1 + (3 / 40))) * base_number).floor() / base_number;
    return _rm3_result;
  }

  rm8_calc(){
    _rm8_result = ((_max_rm_result / (1 + (8 / 40))) * base_number).floor() / base_number;
    return _rm8_result;
  }

  rm12_calc(){
    _rm12_result = ((_max_rm_result / (1 + (12 / 40))) * base_number).floor() / base_number;
    return _rm12_result;
  }

  rm15_calc(){
    _rm15_result = ((_max_rm_result / (1 + (15 / 40))) * base_number).floor() / base_number;
    return _rm15_result;
  }


  Widget_show1RM() {
    if(_max_rm_result == 0){
      return Text(' ');
    }
    return Text('${_max_rm_result}kg',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }


  Widget_show3RM() {
    if(_max_rm_result == 0){
      return Text(' ');
    }
    return Text('${_rm3_result}kg以上',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }

  Widget_show8_12RM() {
    if(_max_rm_result == 0){
      return Text(' ');
    }
    return Text('${_rm12_result}kg以上 ${_rm8_result}kg以下',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }

  Widget_show15RM() {
    if(_max_rm_result == 0){
      return Text(' ');
    }
    return Text('${_rm15_result}kg以下',style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold));
  }




  @override
  Widget build(BuildContext context) {

    _device_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SingleChildScrollView(
        child: Column(
         children: [
           SizedBox(height: 60),

          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.bottomLeft,
            width: _device_width,
            height: 30,
            color: Colors.grey[900],
            child: Text('使用重量(kg)', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold)),
          ),
          Container(
                    width: _device_width,
                    height: 40,
                    color: Colors.grey[850],
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value){
                         if(value!.isEmpty){
                           return '値を入力してください' ;
                         }
                       },
                       controller: weight_controller,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                           isDense: true,
                           contentPadding: EdgeInsets.symmetric(
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
             padding: EdgeInsets.only(left: 10),
             alignment: Alignment.bottomLeft,
             width: _device_width,
             height: 30,
             color: Colors.grey[900],
             child: Text('レップ数(回)', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold)),
           ),
           Container(
             width: _device_width,
             height: 40,
             color: Colors.grey[850],
             child: TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
               validator: (value){
                 if(value!.isEmpty){
                   return '値を入力してください' ;
                 }
               },
               controller: rep_controller,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   isDense: true,
                   contentPadding: EdgeInsets.symmetric(
                     horizontal: 15,
                     vertical: 4
                   ),
                   hintText: '値を入力してください',
                   border: InputBorder.none,
                   hintStyle: TextStyle(color: Colors.grey[400])),
                   style: TextStyle(color: Colors.grey[400])
             ),
           ),
           SizedBox(height: 30),
          Center(
            child:SizedBox(
              width: _device_width,
              height: 50,
              child:ElevatedButton(
                onPressed: () => setState((){
                  _weight = double.parse(weight_controller.text);
                  _rep = double.parse(rep_controller.text);
                  max_rm_calc();
                  rm3_calc();
                  rm8_calc();
                  rm12_calc();
                  rm15_calc();
                }) ,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                ),
               child: const Text('1RM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
            )
          ),
          SizedBox(height: 50,),

           Container(
                   padding: EdgeInsets.only(left: 10),
                   alignment: Alignment.bottomLeft,
                   height: 60,
                   width: _device_width,
                   color: Colors.grey[900],
                   child:Text('1RM', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
               ),
           Row(
             children: [
               Container(
                   padding: EdgeInsets.only(bottom: 10,left: 10),
                   child:Text('●', style: TextStyle(color: Colors.black))
               ),
               Container(
                   width: 100,
                   height: 40,
                   margin: EdgeInsets.only(top: 13),
                   child: Widget_show1RM()
               )
             ],
           ),
           Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _device_width,
                  color: Colors.grey[900],
                  child:Text('筋肥大', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Expanded( //textを１行で表示するためにexpandedを使用
                  child:Container(
                      width: 100,
                      height: 40,
                      padding: EdgeInsets.only(top: 9, left: 3),
                      child: Widget_show8_12RM()
                  )
              )
            ],
          ),
          SizedBox(height: 10,),

           Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _device_width,
                  color: Colors.grey[900],
                  child:Text('神経強化', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 40,
                  padding: EdgeInsets.only(top: 9, left: 3),
                  child: Widget_show3RM()
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.bottomLeft,
                  height: 60,
                  width: _device_width,
                  color: Colors.grey[900],
                  child:Text('筋持久力', style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold))
              ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 50,
                  padding: EdgeInsets.only(top: 9, left: 3),
                  child: Widget_show15RM()
              ),
            ],
          ),
        ],
      )
      )
    );
  }
}
