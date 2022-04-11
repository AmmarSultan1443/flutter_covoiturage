import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covoiturage_vavite/controllers/bdd_controllers.dart';

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
          /*Padding(
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
          ),*/
          FutureBuilder(
              future: BddController().getData(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                }
                if (snapshot.data!.length == 0) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Aucun utilisateur,"),
                        SizedBox(height: 10.0),
                        Text(' veuillez revenir plus tard')
                      ],
                    ),
                  );
                }
                return ListView.builder(
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data!.length,
                    itemBuilder: (context, item) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blueGrey),
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                        (snapshot.data![item]['NomPrenom'])))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 3,
                                    child:
                                        Text((snapshot.data![item]['Email'])))
                              ],
                            )
                          ],
                        ),
                      );
                    });
              })

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
