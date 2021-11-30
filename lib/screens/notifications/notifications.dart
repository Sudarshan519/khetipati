import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/notifications/widgets/notificationcard.dart';
import 'package:khetipati/widgets/app_bar.dart';
import 'package:khetipati/widgets/bottom_nav.dart';

class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  _notificationsState createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Notifications'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 815,
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildNotificationDate('Today'),
                  notificationCard(),
                  notificationCard(),
                  buildNotificationDate('Yesterday'),
                  notificationCard(),
                  notificationCard(),
                  notificationCard(),
                  SizedBox(
                    height: getHeight(30),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildNotificationDate(notificationDate) {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(31), top: getWidth(21), right: 0),
      child: Text(
        notificationDate,
        style: TextStyle(
            color: const Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: getFont(14),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
