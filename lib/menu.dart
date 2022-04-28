import 'dart:convert';
import 'package:flutter/material.dart';
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
      body: FutureBuilder(
        future: getTransport(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(itemBuilder: (context, index) {
                  var data = (snapshot.data);
                  List? liste = snapshot.data as List?;
                  return ListTile(
                    title: Text(liste![index]['date']),
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
