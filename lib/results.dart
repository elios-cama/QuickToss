import 'package:flutter/material.dart';
import 'dart:math';
class ResultScreen extends StatefulWidget {
  final List persons;
  ResultScreen({this.persons});
  
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
final _random = Random();

// var selectedPerson = persons[_random.nextInt(persons.length)];
                    // print(selectedPerson);
  @override
  Widget build(BuildContext context) {
    return Material(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/fond.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Text(' And the loser is\n ${widget.persons[_random.nextInt(widget.persons.length)]} ', style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
