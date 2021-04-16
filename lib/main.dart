import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Color _color = Colors.white;
  double _size = 15;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          var rand = new Random();
          _color = Color.fromARGB(
              255, rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));
          if (_size < 70) {
            _size += 15;
          } else {
            _size = 15;
          }
        });
      },
      child: Scaffold(
        body: Container(
          color: _color,
          alignment: Alignment.center,
          child: AnimatedSize(
            duration: Duration(milliseconds: 700),
            vsync: this,
            curve: Curves.fastLinearToSlowEaseIn,
            child: Text(
              'Hey there',
              style: TextStyle(fontSize: _size, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
