import 'package:flutter/material.dart';
import 'package:calculator1/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Home(),
        ),
    );
  }
}
