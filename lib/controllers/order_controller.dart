import 'package:get/get.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/controllers/profile_controller.dart';
import 'package:khetipati/models/order.dart';
import 'package:khetipati/services/app_service.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  final profilecontroller = Get.put(ProfileController());

  var isLoading = false.obs;
  var index = 0.obs;
  var order = Order().obs;
  var orderlist = <OrderDetail>[].obs;
  get selectedIndex => index.value;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    getOrderByUserId();
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

  getOrderByUserId() async {
    isLoading(true);
    var list = await AppServices().getOrderbyUserid(
        profilecontroller.user.value.id.toString(), authController.token.value);

    // print('codeeeeeee' + profilecontroller.user.value.id.toString());
    if (list != null) {
      isLoading(false);
      order.value = Order.fromJson(list);
      print(list);
    }
  }

  // getOrderDetailByUserId() async {
  //   isLoading(true);
  //   var list = await AppServices().getOrderbyUserid(
  //       profilecontroller.user.value.id.toString(), authController.token.value);

  //   if (list != null) {
  //     isLoading(false);
  //     orderlist.value = list;
  //     print(orderlist.value);
  //   }
  // }
}
