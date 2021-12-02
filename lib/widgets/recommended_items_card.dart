import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/widgets/product_card.dart';

final controller = Get.put(HomeController());

recommendedItemsCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(
            left: getWidth(20), top: getWidth(20), bottom: getWidth(20)),
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
        height: getWidth(
          40,
        ),
      )
    ],
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