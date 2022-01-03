import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/constant.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/screens/detail/detail.dart';
import 'package:khetipati/utils/snackbar.dart';

Widget productCard(Product item) {
  final CartController controller = Get.find();
  return InkWell(
    onTap: () {
      Get.to(() => DetailsScreen(product: item));
    },
    child: Container(
      width: getWidth(141),
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Center(
                  child: Image.network(
                    item.featureImage.originalImage.toString(),
                    width: getWidth(141),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: getHeight(8),
                left: getWidth(8),
                child: InkWell(
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.mainGreen,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: getFont(15),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                getWidth(10), getHeight(10), getWidth(10), getHeight(15)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontSize: getFont(14),
                              color: AppColors.textblack),
                        ),
                        Text(
                          '100 kcal',
                          style: TextStyle(
                              fontSize: getFont(10),
                              fontWeight: FontWeight.w400,
                              color: AppColors.textblack),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: getFont(15),
                        ),
                        Text(
                          item.averagerating.toString(),
                          style: TextStyle(fontSize: getFont(12)),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: getHeight(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Color.fromRGBO(2, 95, 51, 1)),
                              children: [
                            TextSpan(
                                text: "Rs. ",
                                style: TextStyle(fontSize: getFont(12))),
                            TextSpan(
                                text: item.productPrice.toString(),
                                style: TextStyle(fontSize: getFont(15)))
                          ])),
                    ),
                    InkWell(
                      onTap: () {
                        controller.addProduct(item);
                        getSnackbar(
                            message: "1 Item added to Cart. Go to Cart.");
                      },
                      child: Container(
                        height: getHeight(30),
                        width: getWidth(40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: const Color.fromRGBO(135, 194, 65, 1)),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: getFont(20),
                          color: const Color.fromRGBO(135, 194, 65, 0.8),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
