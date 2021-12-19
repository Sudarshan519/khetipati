import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

import '../../../theme.dart';

Widget notificationCard() {
  return Container(
    margin: EdgeInsets.only(
        top: getHeight(13), left: getWidth(25), right: getWidth(25)),
    padding: const EdgeInsets.all(18),
    // width: getWidth(356),
    // height: getHeight(142),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: const Color.fromRGBO(135, 194, 65, 0.5),
          child: Image.asset(
            'assets/icons/notification.png',
            color: AppColors.textGreen,
            height: getHeight(22),
          ),
          // child: Icon(
          //   Icons.notifications_none,
          //   color: AppColors.textGreen,
          //   size: 18,
          // ),
        ),
        SizedBox(
          width: getWidth(12),
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // SizedBox(
            //   height: getHeight(20),
            // ),
            SizedBox(
              width: getWidth(240),
              child: Text(
                '30% off on all Veggies with extra lorem ipum dolor sit.',
                style: robototitleStyle.copyWith(
                    color: AppColors.textGreen,
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: getHeight(9),
            ),
            SizedBox(
              width: getWidth(240),
              child: Text(
                'Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
                style: archivotitleStyle.copyWith(
                    color: AppColors.textblack,
                    fontSize: getFont(12),
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: getHeight(9),
            ),
            SizedBox(
              width: getWidth(240),
              child: Text(
                '10 minutes ago',
                style: archivotitleStyle.copyWith(
                    color: AppColors.textblack,
                    fontSize: getFont(11),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        )
      ],
    ),
  );
}
