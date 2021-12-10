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
    //testing
    // controller.getOrder();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainGreen,

      ////bottom navigation
      bottomNavigationBar: CustomNav(),

      ///tab widgets
      body: buildTab(),

      ///cart button
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => CartScreen());
        },
        child: Container(
            margin: EdgeInsets.only(top: getHeight(20)),
            padding: const EdgeInsets.all(10),
            width: getHeight(68),
            height: getHeight(68),
            decoration: BoxDecoration(
                color: AppColors.mainGrey,
                border: Border.all(width: 5, color: AppColors.mainGreen),
                borderRadius: BorderRadius.circular(40)),
            child: Image.asset(
              'assets/icons/cart.png',
              height: getHeight(20),
            )),
      ),
    );
  }

  buildTab() {
    return Obx(() => tabs[controller.selectedIndex]);
  }
}
