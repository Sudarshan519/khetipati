import 'package:get/state_manager.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/services/user_services.dart';

class ProfileController extends GetxController {
  var user = User().obs;
  var isloading = false.obs;

  @override
  void onInit() {
    getuserdata();
    super.onInit();
  }

  getuserdata() async {
    try {
      isloading(true);
      var data = await userrepo.getuserInfo(authController.token.value);

      if (data != null) {
        user.value = data;
        print(user);
        isloading(false);
      }
    } catch (e) {
      // TODO

    }
    update();
    // print(user.value);
    // userInfo.value = userFromJson(data);
  }
}
