import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
 

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  var result= " ";

  Widget btn(var textt){
    return  MaterialButton(onPressed: (){
    setState((){
      result= result+ textt;
    
    });
    },
    child: Text(textt),
    color: Colors.blue[200], 
    );
  }

 clear(){
   setState(() {
     result="";
   });
 }

 add(){
   setState(() {
     result=  result + "+";
   });    
 }
 sub(){
   setState(() {
     result=  result + "-";
   });
 }
 mult(){
   setState(() {
     result=  result + "*";
   });
 }
 div(){
   setState(() {
     result= result + "/";
   });
 }

 output(){
   Parser p = new Parser();
   Expression exp = p.parse(result);
   ContextModel cm = ContextModel();
   double eval = exp.evaluate(EvaluationType.REAL,cm);
  
   setState(() {
     result=eval.toString();
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.indigo,
      appBar: AppBar(
        title:Center(
          child: Text("CALCULATOR",
      style: TextStyle(color: Colors.black),),
        )),

 body: Center(
          child: Column( 
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(result,
            style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("4"),
            ],),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
              btn("5"),
              btn("6"),
              btn("7"),
              btn("8"),
            ],),
            Row( 
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
              btn("9"),
              SizedBox(width: 10,),
              btn("0"),
            ],),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(onPressed: add,
                child: Text("+"),color: Colors.green[200],),

              MaterialButton(onPressed: sub,
                child: Text("-"),color: Colors.green[200],),
              
              MaterialButton(onPressed: mult,
                child: Text("*"),color: Colors.green[200],),

              MaterialButton(onPressed: div,
                child: Text("/"),color: Colors.green[200],),
            ],),
          
             Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                 MaterialButton(onPressed: clear,
                child: Text("clear"),color: Colors.green[200],),
                
                SizedBox(width: 10,),

                 MaterialButton(onPressed: output,
                child: Text("="),color: Colors.green[200],),
          ],),
            ],
            ),
        ),
      
    );
  }
}

