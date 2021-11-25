import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/notifications/notifications.dart';
import 'package:khetipati/screens/orders/orders.dart';
import 'package:khetipati/screens/profile/profile.dart';

@override
Widget BottomNav(BuildContext context, Widget HomeTab, Widget OrdersTab,
    Widget NotificationTab, Widget ProfileTab) {
  // PersistentTabController _controller;

  // _controller = PersistentTabController(initialIndex: 0);
  // List<Widget> _buildScreens() {
  //   return [Home(), Orders()];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.settings),
  //       title: ("Settings"),
  //       activeColorPrimary: CupertinoColors.activeBlue,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  return DefaultTabController(
    length: 5,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.09,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              child: HomeTab,
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/icons/home.png',
              //       color: HomeColor,
              //     ),
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.009,
              //     ),
              //     Text(
              //       'Home',
              //       style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 0.8),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     )
              //   ],
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: OrdersTab,
              //  Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/icons/navorder.png',
              //       color: OrdersColor,
              //     ),
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.009,
              //     ),
              //     Text(
              //       'Order',
              //       style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 0.8),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     )
              //   ],
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Orders()),
                );
              },
            ),
          ),
          // IconButton(
          //   icon: Icon(
          //   ,
          //     color: Color.fromRGBO(0, 0, 0, 0.5),
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Orders()),
          //     );
          //   },
          // ),
          Expanded(
            child: Container(
              width: 20,
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Cart()),
          //     );
          //   },
          //   child: Container(
          //     width: 68,
          //     height: 68,
          //     decoration: BoxDecoration(
          //         color: AppColors.mainGrey,
          //         border: Border.all(width: 5, color: AppColors.mainGreen),
          //         borderRadius: BorderRadius.circular(40)),
          //     child: Icon(
          //       Icons.shopping_cart_outlined,
          //       color: Color.fromRGBO(0, 0, 0, 0.5),
          //       size: 30,
          //     ),
          //   ),
          // ),
          Expanded(
            child: InkWell(
              child: NotificationTab,
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/icons/notification.png',
              //       color: NotificationColor,
              //     ),
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.009,
              //     ),
              //     Text(
              //       'Notification',
              //       style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 0.8),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     )
              //   ],
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => notifications()),
                );
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: ProfileTab,
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/icons/user.png',
              //       color: ProfileColor,
              //     ),
              //     SizedBox(
              //       height: MediaQuery.of(context).size.height * 0.009,
              //     ),
              //     Text(
              //       'Profile',
              //       style: TextStyle(
              //           color: Color.fromRGBO(0, 0, 0, 0.8),
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400),
              //     )
              //   ],
              // ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
  // floatingActionButton: InkWell(
  //   onTap: () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Cart()),
  //     );
  //   },
  //   child: Container(
  //     width: 68,
  //     height: 68,
  //     decoration: BoxDecoration(
  //         color: AppColors.mainGrey,
  //         border: Border.all(width: 5, color: AppColors.mainGreen),
  //         borderRadius: BorderRadius.circular(40)),
  //     child: Icon(
  //       Icons.shopping_cart_outlined,
  //       color: Color.fromRGBO(0, 0, 0, 0.5),
  //       size: 30,
  //     ),
  //   ),
  // ),

  // return PersistentTabView(
  //   context,
  //   controller: _controller,
  //   screens: _buildScreens(),
  //   items: _navBarsItems(),
  //   confineInSafeArea: true,
  //   backgroundColor: Colors.white, // Default is Colors.white.
  //   handleAndroidBackButtonPress: true, // Default is true.
  //   resizeToAvoidBottomInset:
  //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
  //   stateManagement: true, // Default is true.
  //   hideNavigationBarWhenKeyboardShows:
  //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
  //   decoration: NavBarDecoration(
  //     borderRadius: BorderRadius.circular(10.0),
  //     colorBehindNavBar: Colors.white,
  //   ),
  //   popAllScreensOnTapOfSelectedTab: true,
  //   popActionScreens: PopActionScreensType.all,
  //   itemAnimationProperties: ItemAnimationProperties(
  //     // Navigation Bar's items animation properties.
  //     duration: Duration(milliseconds: 200),
  //     curve: Curves.ease,
  //   ),
  //   screenTransitionAnimation: ScreenTransitionAnimation(
  //     // Screen transition animation on change of selected tab.
  //     animateTabTransition: true,
  //     curve: Curves.ease,
  //     duration: Duration(milliseconds: 200),
  //   ),
  //   navBarStyle:
  //       NavBarStyle.style1, // Choose the nav bar style with this property.
  // );
}




// BottomNavigationBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home,
//             color: Colors.grey,
//           ),
//           label: 'Home',
//           backgroundColor: Color(0xFFE0E0E0),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.add_circle_outline_outlined,
//             color: Colors.grey,
//           ),
//           label: 'Order',
//           backgroundColor: Color(0xFFE0E0E0),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.notifications_active_outlined,
//             color: Colors.grey,
//           ),
//           label: 'Notification',
//           backgroundColor: Color(0xFFE0E0E0),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.account_circle_outlined,
//             color: Colors.grey,
//           ),
//           label: 'Profile',
//           backgroundColor: Color(0xFFE0E0E0),
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: AppColors.textGreen,
//       onTap: _onItemTapped,
//     );