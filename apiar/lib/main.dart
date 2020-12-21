import 'dart:async';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';

import 'SecondView.dart';

void main() {
  runApp(MaterialApp(
      home:new HomePage()
  ));
}

class HomePage extends StatefulWidget {

  @override
  HomePageState  createState() => new HomePageState();
}

class HomePageState  extends State<HomePage> {
  List<String> raceTerms = ['Ready', 'Set', 'Go'];
  int counter=0;
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter application"),
            backgroundColor: Colors.blue[900],
            leading:IconButton(
                icon:Icon(Icons.thumb_up)
            ),
          ),
          body: !loading ? Center(child: Row(children: <Widget>[
            Expanded(
                child:Padding(
                  padding:EdgeInsets.all(15),
                  child: FlatButton(
                    child: Text(raceTerms[counter % raceTerms.length], style: TextStyle(fontSize: 20.0),),
                    color:Colors.blue[500],
                    textColor: Colors.white,
                    onPressed: () {
              setState(() {
                  counter++;
              });
                    },
                  ),
                )
            ),
          Expanded(
            child:Padding(
              padding:EdgeInsets.all(15),
              child: FlatButton(    child: Text("Next Page", style: TextStyle(fontSize: 17.0),),
                color:Colors.blue[900],
                textColor: Colors.white,
                onPressed: () {
                // thread sleeping wasnt used for obvious  performance reasons
               setState(()=>loading=true);
                  Timer(Duration(seconds:2),(){
                 setState(()=>loading=false);
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondView()));


               });
                },),
            )

          )
          ])) : SpinKitRotatingCircle(color:Colors.red)),
    );
  }
}
