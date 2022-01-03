import 'package:get/get.dart';

class OrderController extends GetxController {
  var selectedTab = 0.obs;
  updateIndex(int index) {
    selectedTab.value = index;
  }
}
