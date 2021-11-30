import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';

import 'navitem.dart';

class CustomNav extends StatelessWidget {
  CustomNav({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
          () =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NavItem(
              ontap: () {
                controller.updateIndex(0);
              },
              icon: const [
                'assets/icons/home.png',
                'assets/icons/homeselected.png'
              ],
              isSelected: controller.selectedIndex == 0 ? true : false,
              label: 'Home',
            ),
            NavItem(
              ontap: () {
                controller.updateIndex(1);
                print("tap");
              },
              icon: const [
                'assets/icons/navorder.png',
                'assets/icons/orderselected.png'
              ],
              isSelected: controller.selectedIndex == 1 ? true : false,
              label: 'Order',
            ),
            SizedBox(width: getWidth(40)),
            NavItem(
              ontap: () {
                controller.updateIndex(2);
              },
              icon: const [
                'assets/icons/notification.png',
                'assets/icons/notificationselected.png'
              ],
              isSelected: controller.selectedIndex == 2 ? true : false,
              label: 'Notification',
            ),
            NavItem(
              ontap: () {
                controller.updateIndex(3);
              },
              icon: const [
                'assets/icons/user.png',
                'assets/icons/userselected.png'
              ],
              isSelected: controller.selectedIndex == 3 ? true : false,
              label: 'Home',
            ),
          ]),
        ),
        height: getHeight(94),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(234, 238, 238, 1),
            boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: .5)]));
  }
}