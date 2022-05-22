import 'package:covoiturage_vavite/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:covoiturage_vavite/ajouter.dart';
import 'package:covoiturage_vavite/menu.dart';
import 'dart:convert';

class Ride extends StatefulWidget {
  final String date;
  final String heure;
  final String typeOffre;
  final String username;
  final String password;
  final String rider;

  Ride(
      {required this.date,
      required this.heure,
      required this.typeOffre,
      required this.username,
      required this.password,
      required this.rider});

  RideState createState() => RideState();
}

class RideState extends State<Ride> {
  Future getRider() async {
    var url = Uri.parse("http://localhost:8888/bdvavite/rider.php");
    print('Connexion faite');
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
              child: Ajout(
                username: widget.username,
                password: widget.password,
              )), /*MaterialPageRoute(builder: (context) => Ajout())*/
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: ProfilePage(
                username: widget.username,
                password: widget.password,
              )), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      } else if (index == 0) {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.topToBottom,
              child: Menu(
                username: widget.username,
                password: widget.password,
              )), /*MaterialPageRoute(builder: (context) => Menu())*/
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Réserver cette ride'),
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
          future: getRider(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            print('builder');
            return snapshot.hasData
                ? ListView.builder(itemBuilder: ((context, index) {
                    print('salut mec');
                    var data = (snapshot.data);
                    print(data);
                    List? liste = snapshot.data as List?;
                    return Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('images/ride.png'),
                        Card(
                          child: ListTile(
                            title: Text(
                              widget.typeOffre + ' le ' + widget.date,
                              style: TextStyle(fontSize: 25),
                            ),
                            isThreeLine: true,
                            subtitle: Text('Heure prévue : ' +
                                widget.heure +
                                '\n Proposé par : ' +
                                liste![index]['nomUser'] +
                                ' ' +
                                liste![index]['prenUser']),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text('Appuyez pour réserver',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6))),
                        ),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Réserver'))
                          ],
                        )
                      ],
                    ));
                  }))
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
