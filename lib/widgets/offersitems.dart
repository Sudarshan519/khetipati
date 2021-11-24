import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';

Widget OfferItems(BuildContext context, offerPic) {
  return Padding(
    padding: EdgeInsets.only(
        top: 20,
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05),
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 116,
            child: Image.asset(
              offerPic,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '10% off on apples',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                '100 kcal',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Rs. 300',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Rs. 250',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGreen),
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: SizedBox(
              width: 62,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                SizedBox(
                  height: 31,
                ),
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.lightGreen),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: Color.fromRGBO(135, 194, 65, 0.8),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
