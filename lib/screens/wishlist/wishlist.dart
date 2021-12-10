// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';
import 'package:khetipati/screens/widgets/title_text.dart';
import 'package:khetipati/theme.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Wishlist'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: 815,
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
                    Text(
                      '3 items',
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(18),
                          color: AppColors.textGreen,
                          fontWeight: FontWeight.w700),
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
                  titleText(context),
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
      width: MediaQuery.of(context).size.width,

      //  height: 475,
      decoration: BoxDecoration(
        boxShadow: [boxShadow()],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ...List.generate(
              3,
              (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: getWidth(7)),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: index == 9
                            ? null
                            : const Border(
                                bottom: BorderSide(
                                    width: 0.5, color: Colors.grey))),
                    child: wishlistItemCard(
                        'assets/images/items/grapes.png', 'Cherry'),
                  )),
          // wishlistItemCard('assets/images/items/grapes.png', 'Cherry'),
          // wishlistItemCard('assets/images/items/melons.png', 'Water Melon'),
          // wishlistItemCard('assets/images/items/grapes.png', 'Cherry'),
          addToCartButton(context)
        ],
      ),
    );
  }

  wishlistItemCard(wishlistItemImg, itemName) {
    return Container(
      padding: EdgeInsets.only(
        left: getWidth(5),
        right: getWidth(25),
      ),
      height: getHeight(130),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: getFont(18),
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: getWidth(140),
                    height: getHeight(100),
                    child: Image.asset(
                      wishlistItemImg,
                      // fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
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
                    'Rs. 250',
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
                    '4.5',
                    style: TextStyle(fontSize: getFont(10)),
                  )
                ],
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Container(
                height: getHeight(30),
                width: getWidth(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.lightGreen),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: getFont(20),
                  color: const Color.fromRGBO(135, 194, 65, 0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  addToCartButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getWidth(30), getHeight(30), getWidth(30), getHeight(30)),
      child: SizedBox(
          width: getWidth(310),
          height: getHeight(41),
          child: RaisedButton(
            onPressed: () {},
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
