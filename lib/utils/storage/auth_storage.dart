import 'package:get_storage/get_storage.dart';
import 'package:khetipati/models/user.dart';

final boxKey = "boxKey";
final box = GetStorage(boxKey);

class AuthStorage {
  static setUser(User user) => box.write("user", user);
  static User? get currentUser => box.read("user");

  static setToken(String token) => box.write("token", token);
  static String get token => box.read("token") ?? "";

  // static setBookmarks(List<String> todos) => box.write("bookmarks", todos);
  // static List get bookamrks => box.read("bookmarks") ?? [];

  static reset() {
    box.erase();
  }
}
