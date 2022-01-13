import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/offersitems.dart';
import 'package:khetipati/screens/widgets/recommended_items_card.dart';

import '../../theme.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Special Offers'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 815,
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: getWidth(18),
                              vertical: getHeight(20)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white)),
                      buildSpecialOffers(),
                      recommendedItemsCard()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSpecialOffers() {
    return Obx(
      () => controller.products.isEmpty
          ? SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    "Empty",
                    style: archivosubtitleStyle,
                  ),
                ),
              ),
            )
          : Column(
              children: List.generate(controller.products.length,
                  (i) => offerProductCard(controller.products[i]))),
    );
  }
}
