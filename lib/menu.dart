import 'dart:convert';
import 'package:covoiturage_vavite/ajouter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  Future getTransport() async {
    var url = Uri.parse("http://localhost:8888/bdvavite/transport.php");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Erreur');
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
      if (index == 1) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  Ajout()), /*MaterialPageRoute(builder: (context) => Ajout())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child:
                  Menu()), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        actions: const <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Recherche',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),*/
      appBar: AppBar(
        title: Text('Wassup, Yamin'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Ajouter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped, //New
      ),
      body: FutureBuilder(
        future: getTransport(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(itemBuilder: (context, index) {
                  var data = (snapshot.data);
                  List? liste = snapshot.data as List?;
                  return Card(
                    child: ListBody(
                      children: [
                        Padding(padding: EdgeInsets.all(10.0)),
                        Title(
                            color: Colors.black,
                            child: Text(
                              liste![index]['date'],
                              style: TextStyle(fontSize: 20),
                            )),
                        //Text(liste![index]['date']),
                        Text(
                          liste![index]['heure'],
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          liste![index]['typeOffre'],
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        /*Snapshot simplifie l'accès et la conversion des propriétés 
        d'un objet de type JSON*/
      ),
    );
  }
}
