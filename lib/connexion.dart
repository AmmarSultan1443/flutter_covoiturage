import 'dart:convert';
import 'package:covoiturage_vavite/createAccount.dart';
import 'package:flutter/material.dart';
import 'package:covoiturage_vavite/menu.dart';
import 'package:covoiturage_vavite/screens/page_suivante.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:page_transition/page_transition.dart';

class Connexion extends StatefulWidget {
  @override
  ConnexionState createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  late TextEditingController clogin;
  late TextEditingController cmdp;
  String? username = '';
  //late TextEditingController cPrenom;

  //Fonction de connexion à la page de login en php
  Future login() async {
    var url = Uri.parse("http://localhost:8888/bdvavite/login.php");
    var response = await http.post(url, body: {
      "login": clogin.text,
      "mdp": cmdp.text,
      //"prenUser": cPrenom.text
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data == "Erreur") {
        print('pas ok');
        FlutterToastr.show("Problème d'authentification", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom);
      } else {
        print('okkkk');

        FlutterToastr.show("Accès autorisé", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Menu(
                    username: clogin.text,
                    password: cmdp.text,
                  )),
        );
        //Navigator.pushReplacementNamed(context, '/secondePage');
      }
    } else {
      print('Erreur!!!');
      print(response.statusCode.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    clogin = TextEditingController();
    cmdp = TextEditingController();
  }

  @override
  void dispose() {
    clogin.dispose();
    cmdp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoVoiturage'),
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        // Affichage de l'image
        Image.asset('images/covoiturage.jpg'),
        Card(
          // Champ d'insertion du nom d'utilisateur
          child: TextField(
            controller: clogin,
            decoration: const InputDecoration(
                hintText: "Entrez votre login",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Card(
          // Champ d'insertion du mot de passe
          child: TextField(
            controller: cmdp,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "Entrez votre mot de passe",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: MaterialButton(
              color: Colors.indigo,
              child: Text(
                'Connexion',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                login();
              },
            ))
          ],
        ),
        ButtonBar(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                },
                child: Text('Créer un compte ?'))
          ],
        )
      ]),
    );
  }
}
