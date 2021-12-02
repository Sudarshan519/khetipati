import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

orderItemCard() {
  return Column(
    children: [
      SizedBox(height: getHeight(10)),
      SizedBox(
        height: getHeight(100),
        width: getWidth(340),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(139),
              height: getHeight(99),
              child: Image.network(
                " item.featureImage.originalImage.toString()",
                // fit: BoxFit.fill,
                width: getWidth(139),
                height: getHeight(99),
              ),
            ),
            SizedBox(
              width: getWidth(3),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "item.title",
                  style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.w500,
                      color: AppColors.textblack),
                ),
                SizedBox(
                  height: getHeight(5),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Rs.',
                    style: TextStyle(
                        fontSize: getFont(15),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  ),
                  TextSpan(
                    text: "item.productPrice.toString()",
                    style: TextStyle(
                        fontSize: getFont(20),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  )
                ]))
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: getWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  labels(),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  FittedBox(
                    child: Text(
                      '23 hrs ago',
                      style: TextStyle(
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: getHeight(10),
      ),
      const Divider(
        color: Color.fromRGBO(0, 0, 0, 0.3),
      )
    ],
  );
}

Widget labels() {
  return Container(
    margin: EdgeInsets.only(left: getWidth(20), right: getWidth(10)),
    //width: 50,
    // height: 22,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(135, 194, 65, 0.2)),
    child: Center(
      child: Text(
        'Processing',
        style: TextStyle(
            color: AppColors.textGreen,
            fontSize: getFont(14),
            fontWeight: FontWeight.w400),
      ),
    ),
  );
}
