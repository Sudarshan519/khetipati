import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/cart/Checkout.dart';
import 'package:khetipati/screens/home/widgets/navbar.dart';
import 'package:khetipati/widgets/app_bar.dart';
import 'package:khetipati/widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.put(CartController());
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainGreen,
        // bottomNavigationBar: CustomNav(),
        appBar: AppBar(
          toolbarHeight: getHeight(80),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.mainGreen,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
                fontSize: getFont(22),
                color: AppColors.textGreen,
                fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  size: getFont(20), color: AppColors.textGreen)),
        ),
        body: Container(
          // padding: EdgeInsets.only(bottom: 40),
          width: double.infinity,
          height: getHeight(900),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: ListView(
            children: [
              Container(
                width: getWidth(378),
                height: getHeight(500),
                margin: EdgeInsets.only(
                    top: getHeight(20),
                    left: getWidth(20),
                    right: getHeight(20),
                    bottom: getHeight(40)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  CartProducts(),
                  CartTotal(),
                ]),
              ),
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
                  buildRecommendedItemsCard(),
                  SizedBox(
                    width: getWidth(
                      40,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
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

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();

  CartProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => controller.products.isEmpty
            ? const Center(
                child: Text("No cart items"),
              )
            : ListView.separated(
                itemCount: controller.products.length,
                itemBuilder: (_, int index) {
                  return CartProductCard(
                    controller: controller,
                    product: controller.products.keys.toList()[index],
                    index: index,
                    quantity: controller.products.values.toList()[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 1,
                    //margin: const EdgeInsets.all(20),
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
                  );
                },
              ),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  const CartProductCard(
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        //     crossAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: getWidth(139),
                height: getHeight(99),
                child: Image.network(
                  product.featureImage!.originalImage.toString(),
                ),
              ),
              Positioned(
                left: getWidth(-15),
                top: getHeight(-18),
                child: IconButton(
                    onPressed: () {
                      controller.removeFromCart(controller.products[index]);
                    },
                    icon: Icon(
                      Icons.close,
                      size: getFont(20),
                    )),
              ),
            ],
          ),
          SizedBox(
            width: getWidth(9),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title.toString(),
                style: TextStyle(
                    fontSize: getFont(18),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textblack),
              ),
              Text(
                '100 kcal',
                style: TextStyle(
                    fontSize: getFont(12), color: AppColors.textblack),
              ),
              SizedBox(
                height: getHeight(18),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Rs.',
                  style: TextStyle(
                      fontSize: getFont(15),
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGreen),
                ),
                TextSpan(
                  text: product.productPrice.toString(),
                  style: TextStyle(
                      fontSize: getFont(20),
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGreen),
                )
              ]))
            ],
          ),
          const Spacer(),
          Column(children: [
            Container(
              width: getWidth(42),
              height: getHeight(32),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.mainGrey),
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                  onPressed: () {
                    controller.addProduct(product);
                  },
                ),
              ),
            ),
            SizedBox(
              height: getHeight(4),
            ),
            Container(
                width: getWidth(42),
                height: getHeight(32),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.mainGreen),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(child: Text(quantity.toString()))),
            SizedBox(
              height: getHeight(4),
            ),
            Container(
              width: getWidth(42),
              height: getHeight(32),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.mainGrey),
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  onPressed: () {
                    controller.removeProduct(product);
                  },
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: getHeight(73),
        width: getWidth(354),
        padding: EdgeInsets.only(left: getWidth(25), right: getWidth(25)),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getWidth(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: getFont(15)),
                  ),
                  Text(
                    "Rs.${controller.total}",
                    style: TextStyle(
                        fontSize: getFont(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGreen),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getWidth(40),
            ),
            SizedBox(
              width: getHeight(150),
              height: getHeight(41),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Checkout()),
                  );
                },
                color: AppColors.mainGreen,
                child: FittedBox(
                  child: Text(
                    'Proceed To Checkout',
                    style:
                        TextStyle(color: Colors.white, fontSize: getFont(15)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.all(20),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       const Text(
      //         "Total",
      //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         "${controller.total}",
      //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
