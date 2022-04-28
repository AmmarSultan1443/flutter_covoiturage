import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:covoiturage_vavite/menu.dart';
import 'package:covoiturage_vavite/screens/page_suivante.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

class Connexion extends StatefulWidget {
  @override
  ConnexionState createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  late TextEditingController clogin;
  late TextEditingController cmdp;

  Future login() async {
    var url = Uri.parse("http://localhost:8888/bdvavite/login.php");
    var response =
        await http.post(url, body: {"login": clogin.text, "mdp": cmdp.text});

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
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new Menu();
        }));
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
        Image.asset('images/covoiturage.jpg'),
        Card(
          child: TextField(
            controller: clogin,
            decoration: const InputDecoration(
                hintText: "Entrez votre login",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)))),
          ),
        ),
        Card(
          child: TextField(
            controller: cmdp,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: "Entrez votre mot de passe",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)))),
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
        )
      ]),
    );
  }
}
