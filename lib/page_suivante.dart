import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageSuivante extends StatefulWidget {
  @override
  PageSuivanteState createState() => PageSuivanteState();
}

class PageSuivanteState extends State<PageSuivante> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wassup, Yamin'),
      ),
      body: SingleChildScrollView(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Container(
              height: 110,
              width: 390,
              color: Colors.grey,
              child: Row(
                children: [
                  Text("YOOOO"),
                ],
              ),
            ),
          ),
          /*FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.indigo,
            child: const Icon(Icons.search),
          )*/
        ],
      )),
      bottomNavigationBar: Container(
          height: 135,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            child: BottomNavigationBar(
              backgroundColor: Colors.indigo,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.car_rental,
                      size: 50,
                      color: Color.fromARGB(179, 211, 204, 204),
                    ),
                    label: '',
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 50,
                    color: Color.fromARGB(179, 211, 204, 204),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 50,
                      color: Color.fromARGB(179, 211, 204, 204),
                    ),
                    label: '')
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              elevation: 5,
            ),
          )),
    );
  }
}
