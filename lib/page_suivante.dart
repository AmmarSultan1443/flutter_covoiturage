import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageSuivante extends StatefulWidget {
  @override
  PageSuivanteState createState() => PageSuivanteState();
}

class PageSuivanteState extends State<PageSuivante> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bienvenue, Yamin'),
      ),
      body: SingleChildScrollView(
          child: Row(
        children: [
          /*BottomNavigationBar(currentIndex: ,items: items, onTap: ,)*/
        ],
      )),
    );
  }
}
