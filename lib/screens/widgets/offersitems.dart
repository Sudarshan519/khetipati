import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/models/product.dart';

Widget offerProductCard(Product item) {
  return Container(
    margin: EdgeInsets.only(
        left: getWidth(20), right: getWidth(20), bottom: getWidth(20)),
    height: 100,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            height: 100,
            width: getWidth(116),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Image.network(
                    item.featureImage.originalImage.toString(),
                    // fit: BoxFit.fill,
                    width: getWidth(116),
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                if (item.stockQty == 0)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.grey.shade800.withOpacity(.8),
                    ),
                    height: getHeight(100),
                    width: getWidth(116),
                    alignment: Alignment.center,
                    child: const Text("Out of Stock",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  )
              ],
            )),
        SizedBox(
          width: getWidth(8),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '10% off on apples',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: getFont(14)),
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
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
              right: getWidth(12), left: 12, top: 12, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
