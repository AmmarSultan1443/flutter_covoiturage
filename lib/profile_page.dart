import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covoiturage_vavite/page_suivante.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  late TextEditingController clogin;
  late TextEditingController cmdp;
  @override
  void dispose() {
    clogin.dispose();
    cmdp.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    clogin = TextEditingController();
    cmdp = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('CoVoiturage'),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/covoiturage.jpg'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                controller: clogin,
                decoration: const InputDecoration(
                    hintText: "Identifiant",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)))),
                onSubmitted: ((newValue) {}),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextField(
                  controller: cmdp,
                  decoration: const InputDecoration(
                      hintText: "Mot de passe",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0)))),
                  obscureText: true,
                  onSubmitted: ((newValue) {})),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new PageSuivante();
                }));
              },
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}
