import 'package:get_storage/get_storage.dart';

const boxKey = "appstorage";
final box = GetStorage(boxKey);

class AppStorage {
  static setData(String data, String value) => box.write(data, value);
  static getData(String data) {
    box.read("user") ?? "";
  }

  static setToken(String token) => box.write("token", token);
  static String get token => box.read("token") ?? "";

  static reset() {
    box.erase();
  }
}

AppStorage appStorage = AppStorage();
