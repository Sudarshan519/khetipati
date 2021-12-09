import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/notifications/widgets/notificationcard.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  _NotificationsTabState createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Notifications'),
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
