import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  CreateAccountState createState() => createState();
}

class CreateAccountState extends State<CreateAccount> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController motPasseController = TextEditingController();
  TextEditingController verifMotPasseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Créer son compte')),
      body: Center(
        child: Form(
            child: ListView(
          children: <Widget>[
            Image.asset('images/create.png'),
            Card(
              child: TextField(
                  controller: nomController,
                  decoration: InputDecoration(
                      labelText: 'Nom',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextField(
                  controller: prenomController,
                  decoration: InputDecoration(
                      labelText: 'Prenom',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      labelText: 'Mail',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextField(
                  controller: telController,
                  decoration: InputDecoration(
                      labelText: 'Téléphone',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextField(
                  controller: motPasseController,
                  decoration: InputDecoration(
                      labelText: 'Mot de Passe',
                      hintText: 'Saisir mot de passe',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            Card(
              child: TextField(
                  controller: verifMotPasseController,
                  decoration: InputDecoration(
                      labelText: 'Mot de Passe',
                      hintText: 'Saisir à nouveau',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.indigoAccent, width: 2.0)))),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Créer !'))
              ],
            )
          ],
        )),
      ),
    );
  }
}
