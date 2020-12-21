import 'package:flutter/material.dart';
import 'dart:async';
/*
Since this is a stateless widget based on the requirements I cant add an animation for the loading screen.
I can't change the value of boolean values of the widget like in the first instance.
 */
class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second View"),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
            child: FlatButton(
          child: Text(
            "Go to the first Page",
            style: TextStyle(fontSize: 20.0),
          ),
          color: Colors.blue[900],
          textColor: Colors.white,
          onPressed: () {
          Timer(Duration(seconds:2),()=>Navigator.pop(context));
          },
        )));
  }
}
