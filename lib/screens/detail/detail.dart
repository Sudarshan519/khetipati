import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/detail/widgets/details_carousel.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/divider.dart';
import 'package:khetipati/screens/widgets/product_card.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';

import 'package:khetipati/theme.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.product}) : super(key: key);
  final Product product;

  final homeController = Get.find<HomeController>();
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: AppColors.mainGreen,
          appBar: buildAppBar(context, product.title),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        buildItemDetails(),
                        buildReviewsAndDetailsTab(),
                        const SizedBox(
                          height: 20,
                        ),
                        recommendedItemsCard()
                      ],
                    ))
              ],
            ),
          ),
          bottomNavigationBar: buildTotalAmt()),
    );
  }

  reviewsTab() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(10), vertical: getHeight(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Anne',
                          style: archivotitleStyle.copyWith(
                            color: Colors.black,
                            fontSize: getFont(15),
                            fontWeight: FontWeight.w400,
                          )),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Text(
                            '4.5',
                            style: TextStyle(fontSize: getFont(12)),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '21st Aug. 2021',
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(11),
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(0, 0, 0, 0.4)),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(10),
          ),
          SizedBox(
            width: getWidth(325),
            child: Text(
              'The frui is very rich in vitamin.Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
              style: archivotitleStyle.copyWith(
                  fontSize: getFont(12),
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(0, 0, 0, 0.5)),
            ),
          )
        ],
      ),
    );
  }

  buildItemDetails() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getWidth(19), vertical: getHeight(26)),
      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
      // height: 382,
      // width: getWidth(378),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            DetailsCarousel(
              product: product,
            ),
            Positioned(
              top: getHeight(15),
              //left: getWidth(8),
              child: InkWell(
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.mainGreen,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: getFont(20),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ]),
          SizedBox(
            height: getHeight(30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.title,
                  style: archivotitleStyle.copyWith(
                      fontSize: getFont(25),
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Rs.",
                    style: robototitleStyle.copyWith(
                        fontSize: getFont(15), fontWeight: FontWeight.w500)),
                TextSpan(
                    text: '${product.productPrice}/kg',
                    style: robototitleStyle.copyWith(
                        fontSize: getFont(22), fontWeight: FontWeight.w500))
              ])),
            ],
          ),
          SizedBox(
            height: getHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                  Text(product.averagerating.toString(),
                      style: TextStyle(
                        fontSize: getFont(15),
                      )),
                  SizedBox(
                    width: getWidth(19),
                  ),
                  Text('100 kcal',
                      style: TextStyle(
                        fontSize: getFont(15),
                      ))
                ],
              ),
              Row(children: [
                Container(
                  width: getWidth(42),
                  height: getHeight(32),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(135, 194, 65, 0.3)),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                      onPressed: () {
                        homeController.increment();
                        print(controller.count);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: getWidth(10),
                ),
                Obx(
                  () => Container(
                    width: getWidth(42),
                    height: getHeight(32),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.mainGreen),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(homeController.count.toString()),
                    ),
                  ),
                ),
                SizedBox(
                  width: getWidth(10),
                ),
                Container(
                  width: getWidth(42),
                  height: getHeight(32),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromRGBO(135, 194, 65, 0.3)),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                      onPressed: () {
                        homeController.decrement();
                        print(controller.count);
                      },
                    ),
                  ),
                ),
              ])
            ],
          ),
          SizedBox(
            height: getHeight(33),
          )
        ],
      ),
    );
  }

  buildReviewsAndDetailsTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(19)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: archivotitleStyle.copyWith(
                  fontSize: getFont(18), fontWeight: FontWeight.w600),
              labelColor: AppColors.textGreen,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Details',
                ),
                Tab(
                  text: 'Reviews',
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.zero,
              height: 158,
              width: 350,
              child: TabBarView(
                children: [
                  Text(
                      // 'The fruit is very rich in vitamin and it lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. lorem dolor.Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. lorem dolor.Lorem Ipsum dolor sit ame...Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. \n\n* lorem dolor.Lorem Ipsum dolor sit amet. \n* Lorem Ipsum dolor sit amet. lorem dolor.\n* Lorem Ipsum dolor sit ame... ',
                      product.description.toString(),
                      style: archivotitleStyle.copyWith(
                          fontSize: getFont(13),
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  ListView(
                    children: [reviewsTab(), divider(), reviewsTab()],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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

  buildTotalAmt() {
    return Container(
      height: getHeight(94),
      // width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Amount',
                    style: archivotitleStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: getFont(15),
                        color: Colors.black)),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Rs.",
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(15), fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '${product.productPrice}',
                      style: robototitleStyle.copyWith(
                          fontSize: getFont(22), fontWeight: FontWeight.w500))
                ])),
              ],
            ),
            SizedBox(width: getWidth(50)),
            SizedBox(
              //width: 150,
              height: 50,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {},
                color: AppColors.mainGreen,
                child: Text('Add To Cart',
                    style: robotosubtitleStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
