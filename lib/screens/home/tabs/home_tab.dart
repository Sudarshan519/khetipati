import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/constant.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';

import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/screens/cart/cart_screen.dart';

import 'package:khetipati/screens/home/widgets/carousel.dart';
import 'package:khetipati/screens/home/widgets/navbar.dart';
import 'package:khetipati/screens/notifications/notifications.dart';
import 'package:khetipati/screens/orders/orders.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/offersitems.dart';
import 'package:khetipati/widgets/product_card.dart';

List<Widget> tabs = [
  HomeTab(),
  const Orders(),
  const notifications(),
  const Profile(),
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainGreen,
      bottomNavigationBar: CustomNav(),
      body: buildTab(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      //floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(() => CartScreen());
        },
        child: Container(
          margin: EdgeInsets.only(top: getHeight(20)),
          width: 68,
          height: 68,
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

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var item;
    return SingleChildScrollView(
      child: Column(children: [
        buildProfileCard(),
        Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(234, 238, 238, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Carousel(),
              buildTitleText('Categories'),
              buildCategoriesCard(),
              buildTitleText('Popular Items'),
              buildPopularItemsCard(),
              buildTitleText('Recommended Items'),
              buildPopularItemsCard(),
              buildTitleText('Special Offers'),
              buildSpecialOffers(),
              SizedBox(height: getHeight(40))
            ])),
      ]),
    );
  }

  buildProfileCard() {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          // vertical: 10,
        ),
        height: SizeConfigs.screenHeight * 0.2,
        // decoration: const BoxDecoration(
        //   color: AppColors.mainGreen,
        // ),
        child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              'assets/images/pic.png',
              height: 70,
              width: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Hello!",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textGreen,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sudarshan", // user.firstname!.capitalizeFirst.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.textGreen,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.green[900],
              ),
            ),
          ]),
        ));
  }

  buildCategoriesCard() {
    return Obx(() => controller.categories.isEmpty
        ? const Center(child: Text("Empty"))
        : SizedBox(
            height: getHeight(62),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (_, int i) {
                  Category categories = controller.categories[i];
                  return Container(
                    height: getHeight(62),
                    width: getWidth(149),
                    margin: EdgeInsets.only(left: getWidth(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(12), right: getWidth(10)),
                          child: SizedBox(
                            height: getHeight(40),
                            width: getWidth(40),
                            // color: AppColors.mainGrey,
                            child: Image.network(categories.logoUrl.toString()),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categories.title.toString(),
                                style: TextStyle(
                                    fontSize: getFont(15),
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textGreen),
                              ),
                              Text(
                                "120 items",
                                style: TextStyle(
                                    fontSize: getFont(10),
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.textblack),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ));
  }

  buildPopularItemsCard() {
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

  buildTitleText(title) {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(20), top: getWidth(20), bottom: getWidth(20)),
      child: Text(
        title,
        style: TextStyle(
            fontSize: getFont(18),
            fontWeight: FontWeight.bold,
            color: AppColors.textGreen),
      ),
    );
  }

  buildSpecialOffers() {
    return Obx(
      () => controller.products.isEmpty
          ? const Center(child: Text("Empty"))
          : Column(
              children: List.generate(controller.products.length,
                  (i) => offerProductCard(controller.products[i]))),
    );
  }
}