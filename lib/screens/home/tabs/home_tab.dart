import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/screens/home/offers.dart';
import 'package:khetipati/screens/home/specialoffers.dart';

import 'package:khetipati/screens/home/widgets/carousel.dart';
import 'package:khetipati/theme.dart';
import 'package:khetipati/widgets/offersitems.dart';
import 'package:khetipati/widgets/product_card.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        buildProfileCard(),
        Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(234, 238, 238, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InkWell(
                child: const Carousel(),
                onTap: () {
                  Get.to(const Offers());
                },
              ),
              buildTitleText('Categories'),
              buildCategoriesCard(),
              SizedBox(
                height: getHeight(22),
              ),
              buildTitleText('Popular Items'),
              buildPopularItemsCard(),
              SizedBox(
                height: getHeight(22),
              ),
              buildTitleText(
                'Recommended Items',
              ),
              buildPopularItemsCard(),
              SizedBox(
                height: getHeight(22),
              ),
              buildTitleText(
                'Special Offers',
              ),
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
        ),
        height: SizeConfigs.screenHeight * 0.2,
        child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset(
              'assets/images/pic.png',
              height: getHeight(69),
              width: getWidth(61),
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
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Howard ",
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.textGreen,
                      fontWeight: FontWeight.w700),
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
    return Obx(() => !controller.isloading.value
        ? const Center(
            child: CircularProgressIndicator(
            backgroundColor: AppColors.mainGreen,
          ))
        : controller.categories.isEmpty
            ? SizedBox(
                height: getHeight(62),
                width: getWidth(149),
                child: Padding(
                  padding: EdgeInsets.only(left: getWidth(20)),
                  child: Center(
                    child: Text(
                      "No data",
                      style: archivosubtitleStyle,
                    ),
                  ),
                ))
            : SizedBox(
                height: getHeight(62),
                child: ListView.builder(
                    padding: EdgeInsets.only(left: getWidth(10)),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (_, int i) {
                      Category categories = controller.categories[i];
                      return Container(
                        height: getHeight(62),
                        width: getWidth(149),
                        margin: EdgeInsets.only(left: getWidth(10)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: getWidth(8), right: getWidth(8)),
                              child: Image.network(
                                categories.logoUrl.toString(),
                                height: getHeight(62),
                                width: getHeight(62),
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
                                        fontWeight: FontWeight.w400,
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
    return Obx(() => controller.isproductloading.value
        ? const Center(
            child: CircularProgressIndicator(
            backgroundColor: AppColors.mainGreen,
          ))
        : controller.products.isEmpty
            ? SizedBox(
                height: 191,
                child: Padding(
                  padding: EdgeInsets.only(left: getWidth(20)),
                  child: const Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                  ),
                ))
            : SizedBox(
                height: 191,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 8),
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
          left: getWidth(20),
          right: getWidth(20),
          top: getWidth(18),
          bottom: getWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: robototitleStyle.copyWith(
                fontSize: getFont(18),
                fontWeight: FontWeight.bold,
                color: AppColors.textGreen),
          ),
          InkWell(
            onTap: () {
              Get.to(const SpecialOffers());
            },
            child: Text(
              'See All',
              style: archivotitleStyle.copyWith(
                  fontSize: getFont(12),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGreen),
            ),
          ),
        ],
      ),
    );
  }

  buildSpecialOffers() {
    return Obx(
      () => controller.products.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "Empty",
                  style: archivosubtitleStyle,
                ),
              ),
            )
          : Column(
              children: List.generate(controller.products.length,
                  (i) => offerProductCard(controller.products[i]))),
    );
  }
}
