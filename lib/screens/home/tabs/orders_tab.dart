import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/controllers/order_controller.dart';

import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';
import 'package:khetipati/theme.dart';

List orderTabs = ["All orders", "Delivered", "Pending", "Process"];
final ordercontroller = Get.put(OrderController());

class OrdersTab extends StatelessWidget {
  final controller = Get.put(HomeController());
  final ordercontroller = Get.put(OrderController());

  OrdersTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: buildAppBar('Orders'),
        body: RefreshIndicator(
          onRefresh: () => ordercontroller.getOrderByUserId(),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: double.infinity,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  InkWell(
                      child: Text('tdata'),
                      onTap: () => ordercontroller.getOrderByUserId()),
                  orderContainer(),
                  recommendedItemsCard(),
                  SizedBox(
                    height: getHeight(40),
                  )
                ],
              ),
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
      // height: 558,
      decoration: BoxDecoration(
          boxShadow: [boxShadow()],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ///tabbar
          SizedBox(
            width: double.infinity,
            // height: getHeight(40),
            child: TabBar(
              indicatorPadding: EdgeInsets.only(top: getHeight(10)),
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: false,
              unselectedLabelColor: Colors.black,
              labelColor: AppColors.textGreen,
              labelStyle: archivotitleStyle.copyWith(fontSize: getFont(14)),
              labelPadding: EdgeInsets.zero,
              tabs: const [
                Tab(
                  text: 'All orders',
                ),
                Tab(
                  text: 'Delivered',
                ),
                Tab(
                  text: 'Pending',
                ),
                Tab(
                  text: 'Process',
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            height: 600,
            width: double.infinity,
            child: TabBarView(
              children: [
                BuildOrderItems(),
                ordercontroller.order.value.data?.singleOrder?.orderstatusId ==
                        8
                    ? BuildOrderItems()
                    : Container(),
                ordercontroller.order.value.data?.singleOrder?.orderstatusId ==
                        1
                    ? BuildOrderItems()
                    : Container(),
                ordercontroller.order.value.data?.singleOrder?.orderstatusId ==
                        4
                    ? BuildOrderItems()
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildOrderItems extends StatelessWidget {
  BuildOrderItems({Key? key}) : super(key: key);
  final ordercontroller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    var product = ordercontroller.order.value.data?.singleOrder;
    return Column(children: [
      Obx(() => ordercontroller.isLoading.value
          ? const SizedBox(child: Center(child: CircularProgressIndicator()))
          : product?.orderDetails == null
              ? const Center(child: Text('Empty'))
              : Column(
                  children: List.generate(
                      product!.orderDetails!.length,
                      (i) => OrderItemCard(
                            image:
                                "${product.orderDetails![i].product?.featureImage?.originalImage}",
                            title: "${product.orderDetails![i].product?.title}",
                            price:
                                "${product.orderDetails![i].product?.productPrice}",
                          )),
                )),
      // Obx(() => ordercontroller.isLoading.value
      //     ? const SizedBox(child: Center(child: CircularProgressIndicator()))
      //     : SizedBox(
      //         height: 600,
      //         child: ListView.builder(

      //             itemCount: ordercontroller
      //                 .order.value.data?.singleOrder?.orderDetails?.length,
      //             itemBuilder: (_, i) => OrderItemCard(
      //                   image:
      //                       "${product?.orderDetails?[i].product?.featureImage?.originalImage}",
      //                   title: "${product?.orderDetails?[i].product?.title}",
      //                   price:
      //                       "${product?.orderDetails?[i].product?.productPrice}",
      //                 )),
      //       ))
    ]);
  }
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard(
      {Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  final String image;
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(10)),
        SizedBox(
          height: getHeight(100),
          width: getWidth(340),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(139),
                height: getHeight(99),
                child: Image.network(
                  "http://192.168.10.67:8080" + image,
                  fit: BoxFit.contain,
                  width: getWidth(139),
                  height: getHeight(99),
                ),
              ),
              SizedBox(
                width: getWidth(3),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textblack),
                  ),
                  SizedBox(
                    height: getHeight(5),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Rs.',
                      style: robotosubtitleStyle.copyWith(
                          fontSize: getFont(15),
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGreen),
                    ),
                    TextSpan(
                      text: price,
                      style: robotosubtitleStyle.copyWith(
                          fontSize: getFont(20),
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGreen),
                    )
                  ]))
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: getWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    labels(),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    FittedBox(
                      child: Text(
                        '23 hrs ago',
                        style: archivotitleStyle.copyWith(
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(0, 0, 0, 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getHeight(10),
        ),
        const Divider(
          // height: 0.1,
          indent: 10,
          endIndent: 10,
          thickness: 0.4,
          color: Color.fromRGBO(0, 0, 0, 0.3),
        )
      ],
    );
  }
}

Widget labels() {
  var orderstatus =
      ordercontroller.order.value.data?.singleOrder?.orderstatusId;
  return Container(
    margin: EdgeInsets.only(left: getWidth(20), right: getWidth(10)),
    //width: 50,
    // height: 22,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(135, 194, 65, 0.2)),
    child: Center(
      child: Text(
        orderstatus == 1
            ? 'Pending'
            : orderstatus == 8
                ? 'Delivered'
                : orderstatus == 4
                    ? 'processing'
                    : '',
        style: TextStyle(
            color: AppColors.textGreen,
            fontSize: getFont(14),
            fontWeight: FontWeight.w400),
      ),
    ),
  );
}
