import 'package:flutter/material.dart';
import 'package:khetipati/constant/size_config.dart';

creditCard() {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(top: getHeight(15)),
        child: Center(
          child: Container(
            height: getHeight(97),
            width: getWidth(238 + 22 + 22),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(58, 58, 58, 0.61),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      Center(
        child: Container(
          width: getWidth(244),
          // height: getHeight(130),
          padding: EdgeInsets.only(left: getWidth(20)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromRGBO(36, 36, 36, 1),
                Color.fromRGBO(67, 67, 67, 1),
                Color.fromRGBO(92, 92, 92, 1)
              ],
              stops: [0, 0.5, 1],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(15),
              ),
              Row(
                children: [
                  Text(
                    'Credit Card',
                    style: TextStyle(
                        fontSize: getFont(12),
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
              Text(
                '000 0101 1010',
                style: TextStyle(
                    fontSize: getFont(12),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getHeight(25),
              ),
              Row(
                children: [
                  Text(
                    'Card Holder\nBarney Stayye',
                    style: TextStyle(
                        fontSize: getFont(12),
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: getWidth(30),
                  ),
                  Text(
                    'Expires\n12/24',
                    style: TextStyle(
                        fontSize: getFont(12),
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(15),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
