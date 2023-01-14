import 'dart:io';

import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget{
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const MyCustomButton({
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
            child: SizedBox(
              width: 98.1,
              height: 98.1,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.white,
                ),
              child:Text(text,style: TextStyle(fontSize: 24)),
              onPressed: () => callback(text),
                ),
              ),
              );
          
  }
}

class MyHome extends StatefulWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String history = '';
  List<Object>arit=[];
  String enteredValue='';
  String textToDisplay = '';
  String res='';

  bool isOperator(String val){
    if(val=='+'||val=='-'||val=='÷'||val=='x'||val=='='||val=='%'){
      return true;
    }
    return false;
  }
  void clearAll(){
    arit.clear();
    textToDisplay = '';
    enteredValue = '';
  }
  void btnOnClick(String btnVal){
    
   setState(() {
     if(btnVal=='C'){
      clearAll();
      return;
    }
    if(btnVal=='DEL'){
      textToDisplay=textToDisplay.substring(0,textToDisplay.length-1);
      return;
    }
    if(btnVal =='='){
      arit.add(double.parse(enteredValue));
      int oprCount= arit.where((element) => element.runtimeType == String).length;

      for(int i=0;i<oprCount;i++){
        if(arit.contains('%')){
          int x_place=arit.indexOf('%');
          double mult=double.parse(arit[x_place-1].toString())%double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
        else if(arit.contains('x')){
          int x_place=arit.indexOf('x');
          double mult=double.parse(arit[x_place-1].toString())*double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
        else if(arit.contains('÷')){
          int x_place=arit.indexOf('÷');
          double mult=double.parse(arit[x_place-1].toString())/double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
        else if(arit.contains('+')){
          int x_place=arit.indexOf('+');
          double mult=double.parse(arit[x_place-1].toString())+double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
        else if(arit.contains('-')){
          int x_place=arit.indexOf('-');
          double mult=double.parse(arit[x_place-1].toString())-double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
        else if(arit.contains('+/-')){
          int x_place=arit.indexOf('-');
          double mult=double.parse(arit[x_place-1].toString())-double.parse(arit[x_place+1].toString());
          print("mult= "+ mult.toString());
          print(arit);
          for(int j=0;j<3;j++){
          arit.removeAt(x_place-1);
          }
          arit.insert(x_place-1,mult);
          print(arit);
        }
      }
      if(arit[0].toString().contains(".0")){
        var round=double.parse(arit[0].toString());
        textToDisplay=round.toInt().toString();
      }
      else{
        textToDisplay=arit[0].toString();
      }
      return;
    }
    if(isOperator(btnVal)){
      arit.add(double.parse(enteredValue));
      arit.add(btnVal);
      enteredValue='';
      print(arit);
      print(enteredValue);
    }
    else{
      enteredValue+=btnVal;
    }
   textToDisplay+=btnVal;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Flutter Calculator'),
      ),
      body:Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
       Column(
          children: [
            Container(
              child:Padding(
                padding: EdgeInsets.only(right:12),
                child:Text(
                  history,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    ),
                ),
              ),
              alignment: Alignment(1.0,1.0),
            ),
            Container(
              child:Padding(
                padding:EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                style: const TextStyle(
                    fontSize: 48,
                    color: Colors.black,
                    ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              MyCustomButton(
              text: 'C',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(
              text: '+/-',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '%',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: 'DEL',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
            ],),
            Row(
              children: [
              MyCustomButton(text: '7',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '8',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '9',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '÷',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              
            ],),
            Row(children: [
              MyCustomButton(text: '4',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '5'
              ,fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '6'
              ,fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: 'x',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
            ],),
            Row(children: [
              MyCustomButton(text: '1',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '2',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '3',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '-',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              
            ],),
            Row(children: [
              MyCustomButton(text: '0',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '.',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '=',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              MyCustomButton(text: '+',
              fillColor:0xFF8ac4d0,
              textColor:0xFF000000,
              textSize:20,
              callback: btnOnClick,
              ),
              
            ],)
          
            ],
          ),
        ],
        ),
        ),
        
    
      );
  }
}