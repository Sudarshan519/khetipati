import 'package:get_storage/get_storage.dart';
import 'package:khetipati/models/user.dart';

const boxKey = "appstorage";
final box = GetStorage(boxKey);

class AppStorage {
  static setUser(User user) => box.write("user", user.toJson());
  static get currentUser => box.read("user") ?? User();

  static setToken(String token) => box.write("token", token);
  static String get token => box.read("token") ?? "";

  static reset() {
    box.erase();
  }
}

AppStorage appStorage = AppStorage();
