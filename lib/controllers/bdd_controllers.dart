import 'package:covoiturage_vavite/constants/constants_bdd.dart';
import 'package:mysql1/mysql1.dart';

class BddController {
  Future<List<dynamic>> getData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: ConstantBDD.host,
        port: ConstantBDD.port,
        user: ConstantBDD.user,
        password: ConstantBDD.password,
        db: ConstantBDD.db));

    var resultat = await conn.query('select * from profil order by asc');

    return resultat.toList();
  }
}
