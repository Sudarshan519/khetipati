import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/models/product.dart';

Widget offerProductCard(Product item) {
  return Container(
    margin: EdgeInsets.only(
        left: getWidth(20), right: getWidth(20), bottom: getWidth(20)),
    height: getHeight(100),
    width: getWidth(356),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: getHeight(100),
          width: getWidth(116),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
              item.featureImage!.originalImage.toString(),
              // fit: BoxFit.fill,
              width: getWidth(116),
              height: getHeight(100),
              // fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: getWidth(8),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '10% off on apples',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: getFont(14)),
            ),
            Text(
              '100 kcal',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: getFont(10)),
            ),
            SizedBox(height: getHeight(10)),
            Row(
              children: [
                Text(
                  'Rs. 300',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: getFont(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Rs. 250',
                  style: TextStyle(
                      fontSize: getFont(15),
                      fontWeight: FontWeight.bold,
                      color: AppColors.textGreen),
                ),
              ],
            ),
          ],
        ),
        // SizedBox(
        //   width: getWidth(62),
        // ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: getWidth(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                height: getHeight(31),
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
              )
            ],
          ),
        ),
      ],
    ),
  );
}
