import 'package:flutter/material.dart';

import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/home/widgets/popular_items.dart';

titleText(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        right: getWidth(20),
        left: getWidth(20),
        top: getWidth(40),
        bottom: getWidth(20)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommended Items',
          style: TextStyle(
              fontSize: getFont(18),
              fontWeight: FontWeight.bold,
              color: AppColors.textGreen),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PopularItems()),
            );
          },
          child: Text(
            'See All',
            style: TextStyle(
                fontSize: getFont(12),
                fontWeight: FontWeight.w500,
                color: AppColors.textGreen),
          ),
        ),
      ],
    ),
  );
}
