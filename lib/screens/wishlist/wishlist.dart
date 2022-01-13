// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:khetipati/controllers/wishlist_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';
import 'package:khetipati/screens/widgets/title_text.dart';
import 'package:khetipati/theme.dart';

class Wishlist extends StatelessWidget {
  final WishlistController controller = Get.put(WishlistController());
  final cartcontroller = Get.put(CartController());
  final Product? product;

  Wishlist({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Wishlist'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 800,
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(19),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        '${controller.wishlistProducts.length} items',
                        style: robototitleStyle.copyWith(
                            fontSize: getFont(18),
                            color: AppColors.textGreen,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(5),
                    ),
                    buildWishlistItems()
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(),
                  buildRecommendedItemsCard(),
                ],
              ),
              SizedBox(
                height: getWidth(
                  40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildWishlistItems() {
    return Container(
      width: double.infinity,

      //  height: 475,
      decoration: BoxDecoration(
        boxShadow: [boxShadow()],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Obx(
        () => controller.wishlistProducts.length == 0
            ? const SizedBox(
                height: 200,
                child: Center(
                  child: Text('Empty Wishlist'),
                ),
              )
            : Column(
                children: [
                  ...List.generate(
                      controller.wishlistProducts.length,
                      (index) => Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: getWidth(7)),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: index == 9
                                    ? null
                                    : const Border(
                                        bottom: BorderSide(
                                            width: 0.5, color: Colors.grey))),
                            child: wishlistItemCard(
                                controller,
                                controller.wishlistProducts.keys
                                    .toList()[index],
                                index),
                          )),
                  // wishlistItemCard('assets/images/items/grapes.png', 'Cherry'),
                  // wishlistItemCard('assets/images/items/melons.png', 'Water Melon'),
                  // wishlistItemCard('assets/images/items/grapes.png', 'Cherry'),
                  addToCartButton()
                ],
              ),
      ),
    );
  }

  wishlistItemCard(
    // CartController controller,
    WishlistController controller,
    Product product,
    int index,
  ) {
    return Container(
      padding: EdgeInsets.only(
        left: getWidth(5),
        right: getWidth(25),
      ),
      height: getHeight(130),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: getWidth(140),
                    height: getHeight(100),
                    child: Image.network(
                      'http://192.168.10.67:8080' +
                          product.featureImage.originalImage.toString(),
                      // fit: BoxFit.contain,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: getFont(18),
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    onPressed: () {
                      controller.removeFromWishlist(product);
                      print('object');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toString(),
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textblack),
                  ),
                  Text(
                    '100 kcal',
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400,
                        color: AppColors.textblack),
                  ),
                  SizedBox(
                    height: getHeight(18),
                  ),
                  Text(
                    'Rs. ${product.productPrice}',
                    style: robototitleStyle.copyWith(
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: getFont(15),
                  ),
                  Text(
                    '${product.averagerating}',
                    style: TextStyle(fontSize: getFont(10)),
                  )
                ],
              ),
              SizedBox(
                height: getHeight(20),
              ),
              InkWell(
                onTap: () {
                  cartcontroller.addProduct(product);
                },
                child: Container(
                    height: getHeight(40),
                    width: getWidth(42),
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(10),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: .5, color: AppColors.mainGreen),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/icons/cartsm.png',
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  addToCartButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getWidth(30), getHeight(30), getWidth(30), getHeight(30)),
      child: SizedBox(
          width: getWidth(310),
          height: getHeight(41),
          child: RaisedButton(
            onPressed: () {
              // controller.addProduct(product);
            },
            color: AppColors.mainGreen,
            child: Text(
              "Add all to Cart",
              style: TextStyle(
                  fontSize: getFont(16),
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          )),
    );
  }
}
