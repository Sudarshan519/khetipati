import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/constant.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/utils/snackbar.dart';

Widget productCard(Product item) {
  final CartController controller = Get.find();
  return InkWell(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Fruits(product: item)),
      // );
    },
    child: Container(
      width: getWidth(170),
      height: getHeight(226),
      margin: EdgeInsets.only(left: margin),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                item.featureImage!.originalImage.toString(),
                // fit: BoxFit.fill,
                width: getWidth(169),
                height: getHeight(120),
              ),
            ),
            Positioned(
              top: getHeight(10),
              left: getWidth(10),
              child: InkWell(
                child: Container(
                  height: getHeight(25),
                  width: getWidth(25),
                  decoration: BoxDecoration(
                      color: AppColors.mainGreen,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: getFont(17),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ]),
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
                          item.title!,
                          style: TextStyle(
                              fontSize: getFont(16),
                              fontWeight: FontWeight.bold,
                              color: AppColors.textblack),
                        ),
                        Text(
                          '100 kcal',
                          style: TextStyle(
                              fontSize: getFont(12),
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
                    Text(
                      'Rs. ${item.productPrice}',
                      style: TextStyle(
                          fontSize: getFont(16),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreen),
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
