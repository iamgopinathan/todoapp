import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main()=>runApp(myapp());

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      debugShowCheckedModeBanner: false,
      title: 'TO DO APP',
      home: home(),
    );
  }
}