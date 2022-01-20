import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/payment/payment.dart';
import 'package:khetipati/screens/shipping/add_shipping_address.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/divider.dart';
import 'package:khetipati/theme.dart';

class Checkout extends StatelessWidget {
  CartController controller = Get.put(CartController());

  Checkout({Key? key}) : super(key: key);
  // final Product product;
  // final int quantity;
  // final int index;

  // Checkout(
  //     {Key? key,
  //     required this.product,
  //     required this.quantity,
  //     required this.index})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: getWidth(18), vertical: getHeight(20)),
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(15), vertical: getHeight(20)),
                //height: 953,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      child: buildShippinInfo(),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildItems(),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    BuildOrderSummary(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    buildTotalAmmont()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildShippinInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Information',
          style: archivotitleStyle.copyWith(
              color: Colors.black,
              fontSize: getFont(16),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: getHeight(15),
        ),
        buildShippingDetails(
            Icons.home, 'Default Address', 'Shankhaul Marga,\nKathmandu 44600'),
        SizedBox(
          height: getHeight(20),
        ),
        buildShippingDetails(Icons.phone, 'Phone', '98012432545'),
        SizedBox(
          height: getHeight(20),
        ),
        buildShippingDetails(Icons.email, 'Email', 'SSS@gmai.com'),
        SizedBox(
          height: getHeight(20),
        ),
      ],
    );
  }

  buildShippingDetails(IconData icon, title, subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.mainGreen,
            ),
            SizedBox(
              width: getWidth(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  //'Default Address',
                  style: archivotitleStyle.copyWith(
                      color: Colors.black,
                      fontSize: getFont(15),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getFont(8),
                ),
                Text(
                  subtitle,
                  //'Shankhaul Marga,\nKathmandu 44600',
                  style: robotosubtitleStyle.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => AddShippingAddress());
          },
          child: Container(
            width: getWidth(42),
            height: getHeight(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromRGBO(135, 194, 65, 0.2)),
            child: Center(
              child: Text(
                'Edit',
                style: archivotitleStyle.copyWith(
                    color: AppColors.textGreen,
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items',
          style: archivotitleStyle.copyWith(
              color: Colors.black,
              fontSize: getFont(16),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: getHeight(15)),

        controller.products.isNotEmpty
            ? Column(
                children: [
                  ...List.generate(
                      controller.products.length,
                      (index) => BuildCheckoutItems(
                            controller: controller,
                            index: index,
                            product: controller.products.keys.toList()[index],
                            quantity:
                                controller.products.values.toList()[index],
                          )),
                ],
              )
            : const SizedBox(
                height: 100,
                child: Center(
                  child: Text('Empty'),
                ),
              )

        // buildCheckoutItems(),
        // buildCheckoutItems()
      ],
    );
  }

  buildTotalAmmont() {
    return Container(
      height: 70,
      //width: 414,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Amount',
                    style: robototitleStyle.copyWith(
                        fontSize: getFont(15),
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Rs.',
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(15), fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: controller.total.toString(),
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(20), fontWeight: FontWeight.w500))
                ]))
                // Text('Rs. 1000',
                //     style: robototitleStyle.copyWith(
                //       fontSize: getFont(20),
                //     )),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Get.to(() => Payment());
              controller.submitOrder();
            },
            child: Container(
              height: getHeight(41),
              padding: EdgeInsets.symmetric(horizontal: getWidth(35)),
              decoration: BoxDecoration(
                  color: AppColors.mainGreen,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  'Proceed To Pay',
                  style: robototitleStyle.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: getFont(16),
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCheckoutItems extends StatelessWidget {
  const BuildCheckoutItems(
      {Key? key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index})
      : super(key: key);

  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: getHeight(83),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              width: 1, color: const Color.fromRGBO(193, 193, 193, 0.3))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                  width: getWidth(79),
                  height: getHeight(56),
                  child: Image.network('http://192.168.10.67:8080' +
                      product.featureImage.originalImage)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,
                      style: archivotitleStyle.copyWith(
                          fontSize: getFont(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                  Text(
                    '10 kcal',
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(10),
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  // SizedBox(
                  //   height: getHeight(5),
                  // ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Rs.',
                        style: robototitleStyle.copyWith(
                            fontSize: getFont(15),
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: product.productPrice.toString(),
                        style: robototitleStyle.copyWith(
                            fontSize: getFont(20), fontWeight: FontWeight.w500))
                  ]))
                  // Text(
                  //   'Rs. 250',
                  //   style: TextStyle(
                  //       fontSize: getFont(15),
                  //       fontWeight: FontWeight.bold,
                  //       color: AppColors.textGreen),
                  // )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10),
            child: Text('Quantity: $quantity',
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(12),
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          )
        ],
      ),
    );
  }
}

class BuildOrderSummary extends StatelessWidget {
  BuildOrderSummary({Key? key}) : super(key: key);
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: archivotitleStyle.copyWith(
              fontSize: getFont(16),
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: getHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: archivotitleStyle.copyWith(
                  color: Colors.black,
                  fontSize: getFont(15),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Rs. ${controller.total}',
              style: archivotitleStyle.copyWith(
                  color: Colors.black,
                  fontSize: getFont(15),
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Fee',
              style: archivotitleStyle.copyWith(
                  fontSize: getFont(15),
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rs. 100',
                  style: archivotitleStyle.copyWith(
                      fontSize: getFont(15),
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                Text(
                  'Total Rs. ${controller.total}',
                  style: archivotitleStyle.copyWith(
                      fontSize: getFont(15),
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Offers',
              style: archivotitleStyle.copyWith(
                  fontSize: getFont(15),
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Container(
              height: getHeight(31),
              padding: EdgeInsets.symmetric(horizontal: getWidth(3)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(135, 194, 65, 0.2)),
              child: Center(
                child: Text(
                  'Promo Code Applied',
                  style: archivotitleStyle.copyWith(
                      color: AppColors.textGreen,
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
