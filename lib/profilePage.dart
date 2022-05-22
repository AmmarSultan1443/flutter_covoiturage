import 'dart:ui';

import 'package:covoiturage_vavite/connexion.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covoiturage_vavite/ajouter.dart';
import 'package:covoiturage_vavite/ride.dart';
import 'package:covoiturage_vavite/menu.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final String password;

  ProfilePage({required this.username, required this.password});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController pastPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Future getInfoProfile() async {
    var url = Uri.parse("http://localhost:8888/bdvavite/profile.php");
    print('Connexion faite');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Erreur');
    }
  }

  Future updateProfile() async {
    if (pastPasswordController.text == widget.password) {
      var url = Uri.parse("http://localhost:8888/bdvavite/updateProfile.php");
      var response = await http.post(url, body: {
        "nom": nomController.text,
        "prenom": prenomController.text,
        "tel": telController.text,
        "mail": mailController.text,
        "password": newPasswordController.text

        //"prenUser": cPrenom.text
      });

      if (response.statusCode == 200) {
        print('yooo on est dans le if');

        FlutterToastr.show("Donnée ajoutée", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom);
        print('Compte mis à jour');
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: ProfilePage(
                username: widget.username,
                password: widget.password,
              )),
        );
        //Navigator.pushReplacementNamed(context, '/secondePage');
      } else {
        print('Erreur!!!');
        print(response.statusCode.toString());
      }
    } else {
      FlutterToastr.show("Les mots de passe ne correspondent pas", context,
          duration: FlutterToastr.lengthLong, position: FlutterToastr.center);
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
              type: PageTransitionType.fade,
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
      appBar: AppBar(title: Text('Modifier votre profil')),
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
        future: getInfoProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print('builder');
          return snapshot.hasData
              ? ListView.builder(itemBuilder: ((context, index) {
                  var data = (snapshot.data);
                  print(data);
                  List? liste = snapshot.data as List?;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.person_outline_rounded),
                          title: TextField(
                            controller: nomController,
                            decoration: InputDecoration(
                                hintText: liste![index]['nomUser'],
                                labelText: liste![index]['nomUser'],
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 2.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.indigoAccent,
                                        width: 2.0))),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.person_outline_rounded),
                            title: TextField(
                              controller: prenomController,
                              decoration: InputDecoration(
                                  hintText: liste![index]['prenUser'],
                                  labelText: liste![index]['prenUser'],
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.phone),
                            title: TextField(
                              controller: telController,
                              decoration: InputDecoration(
                                  hintText: liste![index]['telUser'],
                                  labelText: liste![index]['telUser'],
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.mail),
                            title: TextField(
                              controller: mailController,
                              decoration: InputDecoration(
                                  hintText: liste![index]['mailUser'],
                                  labelText: liste![index]['mailUser'],
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.password),
                            title: TextField(
                              controller: pastPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Ancien mot de passe',
                                  labelText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      Card(
                        child: ListTile(
                            leading: Icon(Icons.password),
                            title: TextField(
                              controller: newPasswordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Nouveau mot de passe',
                                  labelText: 'Password',
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent,
                                          width: 2.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent,
                                          width: 2.0))),
                            )),
                      ),
                      ButtonBar(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                updateProfile();
                              },
                              child: Text('Modifier')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .leftToRightWithFade,
                                      child: Connexion()),
                                );
                              },
                              child: Text('Se déconnecter'),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red))
                        ],
                      )
                    ],
                  );
                }))
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
