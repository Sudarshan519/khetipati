import 'package:get/get.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/models/order.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/services/app_service.dart';
import 'package:khetipati/utils/snackbar.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  RxBool active = false.obs;
  var isLoading = true.obs;
  var index = 0.obs;
  var orderlist = <OrderDetail>[].obs;
  var order = Order().obs;
  get selectedIndex => index.value;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory

    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen

    super.onReady();
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory

    super.onClose();
  }

  void isActive() {
    if (active.isFalse) {
      active = true.obs;
    } else {
      active = false.obs;
    }

    update();
  }

  // getOrderByCode() async {
  //   // orderlist.value = [];
  //   // orderlist.clear();
  //   try {
  //     isLoading(true);
  //     var list = await AppServices().getOrderbyCode(authController.token.value);

  //     print(list);
  //     order.value = list;
  //   } finally {
  //     // TODO
  //     isLoading(false);
  //   }
  // }

  getOrderByUserId() async {
    try {
      isLoading(true);
      var list = await AppServices().getOrderbyUserid(
          authController.user.value.id.toString(), authController.token.value);

      // print('codeeeeeee' + authController.user.value.id.toString());
      order.value = list;
      print(list);
    } finally {
      // TODO
      isLoading(false);
    }
  }
}
