import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/orders/widgets/order_item_card.dart';
import 'package:khetipati/widgets/app_bar.dart';
import 'package:khetipati/widgets/product_card.dart';

final List<Tab> myTabs = <Tab>[
  Tab(
    text: 'allorders',
    child: Text(
      'All orders',
      style: TextStyle(
          fontSize: getFont(14),
          color: Colors.green[900],
          fontWeight: FontWeight.w500),
    ),
  ),
  Tab(
    text: 'delivered',
    child: Text(
      'Delivered',
      style: TextStyle(
          fontSize: getFont(14),
          color: Colors.green[900],
          fontWeight: FontWeight.w500),
    ),
  ),
  Tab(
    text: 'pending',
    child: Text(
      'Pending',
      style: TextStyle(
          fontSize: getFont(14),
          color: Colors.green[900],
          fontWeight: FontWeight.w500),
    ),
  ),
  Tab(
    text: 'process',
    child: Text(
      'Process',
      style: TextStyle(
          fontSize: getFont(14),
          color: Colors.green[900],
          fontWeight: FontWeight.w500),
    ),
  )
];

class OrderTab extends StatelessWidget {
  final controller = Get.put(HomeController());

  OrderTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // controller.getOrder();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: buildAppBar('Orders'),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: getWidth(20),
                          top: getWidth(20),
                          bottom: getWidth(20)),
                      child: Text(
                        'Recommended Items',
                        style: TextStyle(
                            fontSize: getFont(18),
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGreen),
                      ),
                    ),
                    buildRecommendedItemsCard()
                  ],
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
      width: SizeConfigs.screenHeight * .8,
      margin: EdgeInsets.fromLTRB(getWidth(20), getHeight(26), getWidth(20), 0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          TabBar(
            onTap: (i) {
              print(i);
            },
            tabs: myTabs,
          ),
          Container(
            margin: EdgeInsets.zero,
            width: double.infinity,
            height: SizeConfigs.screenHeight * .5,
            child: TabBarView(
              children: [
                ...tabs.map(
                  (e) => orderItemCard(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  buildOrderItems() {
    return Obx(() => controller.products.isEmpty
        ? const Center(child: Text("No data found"))
        : ListView.separated(
            itemBuilder: (_, i) {
              return orderItemCard();
            },
            separatorBuilder: (_, i) {
              return Divider();
            },
            itemCount: 3));
  }

  buildRecommendedItemsCard() {
    return Obx(() => controller.products.isEmpty
        ? const Center(child: Text("Empty"))
        : SizedBox(
            height: getHeight(226),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.products.length,
                itemBuilder: (_, int i) {
                  return productCard(controller.products[i]);
                }),
          ));
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("All Orders"),
    );
  }
}
