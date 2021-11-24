import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/notifications/notifications.dart';
import 'package:khetipati/screens/orders/orders.dart';
import 'package:khetipati/screens/profile/profile.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({Key? key}) : super(key: key);

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
            children: [Home(), Orders(), notifications(), Profile()]),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          color: Colors.white,
          child: TabBar(
            indicatorColor: AppColors.mainGreen,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: false,
            onTap: (i) {},
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/home.png',
                      color: Color.fromRGBO(0, 0, 0, 5),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.009,
                    // ),
                    // Text(
                    //   'Home',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(0, 0, 0, 0.8),
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/navorder.png',
                      color: Color.fromRGBO(0, 0, 0, 5),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.009,
                    // ),
                    // Text(
                    //   'Order',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(0, 0, 0, 0.8),
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/notification.png',
                      color: Color.fromRGBO(0, 0, 0, 5),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.009,
                    // ),
                    // Text(
                    //   'Notification',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(0, 0, 0, 0.8),
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/user.png',
                      color: Color.fromRGBO(0, 0, 0, 5),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.009,
                    // ),
                    // Text(
                    //   'Profile',
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(0, 0, 0, 0.8),
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
          child: Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
                color: AppColors.mainGrey,
                border: Border.all(width: 5, color: AppColors.mainGreen),
                borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
