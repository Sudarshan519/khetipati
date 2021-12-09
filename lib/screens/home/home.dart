import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/screens/cart/cart_screen.dart';
import 'package:khetipati/screens/home/tabs/orders_tab.dart';
import 'package:khetipati/screens/home/tabs/profile_tab.dart';
import 'package:khetipati/screens/home/widgets/navbar.dart';
import 'package:khetipati/screens/notifications/notifications.dart';

import 'tabs/home_tab.dart';

List<Widget> tabs = [
  HomeTab(),
  const OrdersTab(),
  const NotificationsTab(),
  const ProfileTab(),
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    controller.getOrder();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainGreen,
      bottomNavigationBar: CustomNav(),
      body: buildTab(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => CartScreen());
        },
        child: Container(
          margin: EdgeInsets.only(top: getHeight(20)),
          width: getHeight(68),
          height: getHeight(68),
          decoration: BoxDecoration(
              color: AppColors.mainGrey,
              border: Border.all(width: 5, color: AppColors.mainGreen),
              borderRadius: BorderRadius.circular(40)),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Color.fromRGBO(0, 0, 0, 0.5),
            size: 30,
          ),
        ),
      ),
    );
  }

  buildTab() {
    return Obx(() => tabs[controller.selectedIndex]);
  }
}
