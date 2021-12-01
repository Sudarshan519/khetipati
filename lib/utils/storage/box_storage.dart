import 'package:get_storage/get_storage.dart';

import 'app_storage.dart';

class BoxStorage {
  static init() async {
    await GetStorage.init(boxKey);
  }
}
