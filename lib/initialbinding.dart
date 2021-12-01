import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'controllers/splash_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );

    Get.put(InternetConnectivityController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
