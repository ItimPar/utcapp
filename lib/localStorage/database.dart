import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';

class DBLocal {
  var dbName = 'UTC';
  Future<Database> connectDB() async {
    dynamic dict = await getApplicationDocumentsDirectory();
    var location = join(dict.path, dbName);

    var createDB = databaseFactoryIo.openDatabase(location);
    return createDB;
  }

  Future<void> register(name, email, password) async {
    var db = await connectDB();

    var store = intMapStoreFactory.store('user');

    var user = await store.add(db, {
      'name': name,
      'email': email,
      'password': password,
    });
    print(user);

    await store
        .find(db)
        .then(((response) => print(response)))
        .catchError((err) => print(err));

    db.close();
  }

  Future<bool> login(email, password) async {
    var db = await connectDB();
    var store = intMapStoreFactory.store('user');
    var user = await store.find(db);

    for (var temp in user) {
      if (temp['email'] == email && temp['password'] == password) {
        return true;
      }
    }

    return false;
  }
}
