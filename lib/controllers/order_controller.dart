import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();

  RxBool active = false.obs;

  var index = 0.obs;
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
}
