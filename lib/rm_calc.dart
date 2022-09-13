import 'package:flutter/material.dart';

class RmCalculator extends StatefulWidget {
  const RmCalculator({Key? key}) : super(key: key);

  @override
  State<RmCalculator> createState() => _RmCalculatorState();
}

class _RmCalculatorState extends State<RmCalculator> {

  TextEditingController weight_controller = TextEditingController();
  TextEditingController rep_controller = TextEditingController();
  //ElevateButtonのOppressedの処理でエラーを出さないために仮で使う
  double a = 0;
  double b = 0;
  double _weight = 0;
  double _rep = 0;
  int base_number = 10;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
          SizedBox(height: 100),
          Center(
            child: Container(
                    width: 250,
                    height: 60,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '値を入力してください';
                         }
                       },
                       controller: weight_controller,
                       keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: '使用重量', border: OutlineInputBorder()),
                       ),
                    ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
                    width: 250,
                    height: 60,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value){
                         if(value!.isEmpty){
                           return '値を入力してください' ;
                         }
                       },
                       controller: rep_controller,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(hintText: 'レップ数', border: OutlineInputBorder()),
                       ),
                     ),
          ),
          SizedBox(height: 30),
          Center(
            child:SizedBox(
              width: 130,
              height: 50,
              child:ElevatedButton(
                onPressed: () => setState((){
                  _weight = double.parse(weight_controller.text);
                  _rep = double.parse(rep_controller.text);
                }) ,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
              ),
               child: const Text('1RM測定', style: TextStyle(color: Colors.white))),
            )
          ),
          Center(
            child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size:30,),
          ),
          Center(
            child: Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size:30,),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              width: 250,
              height: 60,
              child: Text(((_weight * (1 + (_rep / 40))) * base_number.floor() / base_number).toString()),
            ),
          ),
          SizedBox(height: 60,),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Text('筋肥大', style: TextStyle(color: Colors.black))
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15,left: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                width: 100,
                height: 40,
                padding: EdgeInsets.only(bottom: 15),
                child: TextField()
                ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Text('kg', style: TextStyle(color: Colors.black))
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Text('神経強化', style: TextStyle(color: Colors.black))
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15,left: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 40,
                  padding: EdgeInsets.only(bottom: 15),
                  child: TextField()
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text('kg', style: TextStyle(color: Colors.black))
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child:Text('筋持久力', style: TextStyle(color: Colors.black))
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 15,left: 10),
                  child:Text('●', style: TextStyle(color: Colors.black))
              ),
              Container(
                  width: 100,
                  height: 40,
                  padding: EdgeInsets.only(bottom: 15),
                  child: TextField()
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text('kg', style: TextStyle(color: Colors.black))
              )
            ],
          ),
        ],
      )
      )
    );
  }
}
