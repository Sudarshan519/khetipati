import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/screens/orders/widgets/order_item_card.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';
import 'package:khetipati/theme.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  _OrdersTabState createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: buildAppBar(context, 'Orders'),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                orderContainer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [recommendedItemsCard()],
                ),
                SizedBox(
                  height: getHeight(40),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  orderContainer() {
    return Container(
      width: getWidth(378),
      margin: EdgeInsets.fromLTRB(getWidth(20), getHeight(26), getWidth(20), 0),
      decoration: BoxDecoration(
          boxShadow: [boxShadow()],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            //  height: getHeight(34),
            padding: EdgeInsets.symmetric(vertical: getHeight(12)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOrderStatus('All orders'),
                  buildOrderStatus('Delivered'),
                  buildOrderStatus('Pending'),
                  buildOrderStatus('Process')
                ]),
          ),
          buildOrderItems()
        ],
      ),
    );
    // return Container(
    //   width: getWidth(378),
    //   margin: EdgeInsets.fromLTRB(getWidth(20), getHeight(26), getWidth(20), 0),
    //   // height: 558,
    //   decoration: BoxDecoration(
    //       boxShadow: [boxShadow()],
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(10)),
    //   child: Column(
    //     children: [
    //       ///tabbar
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         // height: getHeight(40),
    //         child: TabBar(
    //           indicatorPadding: EdgeInsets.only(top: getHeight(10)),
    //           indicatorSize: TabBarIndicatorSize.label,
    //           isScrollable: false,
    //           unselectedLabelColor: Colors.black,
    //           labelColor: AppColors.textGreen,
    //           labelStyle: archivotitleStyle.copyWith(fontSize: getFont(14)),
    //           labelPadding: EdgeInsets.zero,
    //           tabs: const [
    //             Tab(
    //               text: 'All orders',
    //             ),
    //             Tab(
    //               text: 'Delivered',
    //             ),
    //             Tab(
    //               text: 'Pending',
    //             ),
    //             Tab(
    //               text: 'Process',
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.zero,
    //         height: MediaQuery.of(context).size.height * .6,
    //         width: MediaQuery.of(context).size.width,
    //         child: TabBarView(
    //           children: [
    //             buildOrderItems(),
    //             buildOrderItems(),
    //             buildOrderItems(),
    //             buildOrderItems()
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  buildOrderItems() {
    return Obx(() => controller.products.isEmpty
        ? Container(height: 400, child: const Center(child: Text("Empty")))
        : Column(
            children: List.generate(controller.products.length,
                (i) => orderItemCard(controller.products[i])),
          ));
  }

  buildOrderStatus(title) {
    return Column(
      children: [
        Text(
          title,
          style: archivotitleStyle.copyWith(fontSize: getFont(14)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          height: 1,
          width: 70,
          color: AppColors.textGreen,
        )
      ],
    );
  }
}
