import 'package:flutter/material.dart';
import 'calculator.dart';

class CalculatorView extends StatefulWidget{
  const CalculatorView({super.key});

  @override
  State<CalculatorView>createState()=>_CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView>{
  String _display='';
  double? _inputNumber1;
  bool isEnterClicked=false;

  void _onButtonPressed(String value){
    double number;

    setState((){
      if(isEnterClicked){
        _display='';
        isEnterClicked=false;
      }
      if(value=='C'){
        _display='';
      }else if(value=='DEL'){
        if(_display.isNotEmpty){
          _display=_display.substring(0,_display.length -1);
        }
      }else if(value=='+/-'){
        if(_display.isNotEmpty){
          number=double.tryParse(_display)??0;
          _display=(-number).toString();
        }
      }else if(value=='%'){
        if(_display.isNotEmpty){
        number=double.tryParse(_display)??0;
        _display=(number/100).toString();
      }
      }else if(value=='='){
        if(_inputNumber1 !=null && Calculator.operator !=null){
          Calculator.y=double.tryParse(_display)??0;
          if(Calculator.y==0){
            _display='Error';
          }else{
            _display=Calculator.calculate().toString();
          }

          _inputNumber1=null;
          Calculator.operator='';
        }
      }else if(['+','-','*','/'].contains(value)){
        _inputNumber1=double.tryParse(_display);
        if(_inputNumber1 !=null)Calculator.x=_inputNumber1!;
        Calculator.operator=value;
        _display='';
      }else if(value=='.'){
        if(!_display.contains('.')){
          _display+=value;
        }
      }else{
        _display+=value;
      }
    }
    );
  }

  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar:AppBar(
    title:Text(
      "Exam 4 Alissa Owens",
      style:TextStyle(color:Colors.white),
  ),
  backgroundColor:Theme.of(context).colorScheme.primary),
  body:Column(
    children: [
      SizedBox(height:10,),
    Container(
      alignment:Alignment.bottomRight,
      margin:EdgeInsets.all(10.0),
      padding:EdgeInsets.all(10.0),
      child:Text(_display,style:TextStyle(fontSize:20)),
      decoration: 
      BoxDecoration(border:Border.all(style:BorderStyle.solid)),
    ),
    SizedBox(height:10,),
    Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('C',Colors.black38),
        _buildButton('DEL',Colors.black38),
        _buildButton('+/-',Colors.black38),
        _buildButton('%',Colors.orangeAccent),
      ],
    ),
    SizedBox(height:10,),
     Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('7',Colors.grey),
        _buildButton('8',Colors.grey),
        _buildButton('9',Colors.grey),
        _buildButton('/',Colors.orangeAccent),
      ],
    ),
    SizedBox(height:10,),
     Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('4',Colors.black38),
        _buildButton('5',Colors.black38),
        _buildButton('6',Colors.black38),
        _buildButton('*',Colors.orangeAccent),
      ],
    ),
    SizedBox(height:10,),
     Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('1',Colors.grey),
        _buildButton('2',Colors.grey),
        _buildButton('3',Colors.grey),
        _buildButton('-',Colors.orangeAccent),
      ],
    ),
    SizedBox(height:10,),
    Row(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton('0',Colors.grey),
        _buildButton('.',Colors.grey),
        _buildButton('=',Colors.orange),
        _buildButton('+',Colors.orangeAccent),
      ],
    )
    ],
  ));
 }


  Widget _buildButton(String value,Color color){
    return ElevatedButton(
      onPressed: ()=>_onButtonPressed(value),
      child:Text(value,style:TextStyle(fontSize: 20,color:Colors.white)),
      style:ElevatedButton.styleFrom(
        shape:CircleBorder(),
        padding:EdgeInsets.all(10.0),
        backgroundColor:color,
      ),
    );
  } 
}