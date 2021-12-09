import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/LoginRegisterPage/login.dart';
import 'package:khetipati/screens/home/tabs/orders_tab.dart';
import 'package:khetipati/screens/payment/payment.dart';

import 'package:khetipati/screens/profile/editprofile.dart';

import 'package:khetipati/screens/reviews/reviews.dart';
import 'package:khetipati/screens/shipping/shipping_address.dart';
import 'package:khetipati/screens/voucher/vouchers.dart';
import 'package:khetipati/screens/wishlist/wishlist.dart';

import '../../../theme.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    // User? user = User.fromJson(AuthStorage.currentUser);
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 283,
              width: MediaQuery.of(context).size.width,
              color: AppColors.mainGreen,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: getHeight(33), bottom: getHeight(10)),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: getHeight(135),
                      width: getWidth(135),
                    ),
                  ),
                  Text(
                    "Sudarshan ",
                    style: robototitleStyle.copyWith(
                        fontSize: getFont(23),
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Mangalbazar, Lalitpur",
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(14),
                        color: Colors.green[900],
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: getHeight(22),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 255, 255, 0.5),
                        textStyle: TextStyle(
                            fontSize: getFont(15),
                            color: const Color.fromRGBO(2, 95, 51, 1))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()),
                      );
                    },
                    child: Text(
                      'Edit',
                      style: archivotitleStyle.copyWith(
                          fontSize: getFont(15),
                          color: const Color.fromRGBO(2, 95, 51, 1)),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(16),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 815,
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(right: getWidth(20), left: getWidth(20)),
                child: Column(
                  children: [
                    profileMenuCard(),
                    personalInfoCard(),
                    logoutAndSwitchAccCard(),
                    SizedBox(
                      height: getHeight(30),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  profileMenuCard() {
    return Container(
      margin: EdgeInsets.only(top: getHeight(22)),
      width: MediaQuery.of(context).size.width,
      height: getHeight(239),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Wishlist()),
                  );
                },
                child:
                    profileOptionsMenu('My Wishlist', 'assets/icons/heart.png'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrdersTab()),
                  );
                },
                child:
                    profileOptionsMenu('My Orders', 'assets/icons/order.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Vouchers()),
                  );
                },
                child:
                    profileOptionsMenu('Vouchers', 'assets/icons/voucher.png'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Payment()),
                  );
                },
                child:
                    profileOptionsMenu('Payment', 'assets/icons/payment.png'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShippingAddress()),
                  );
                },
                child: profileOptionsMenu(
                    'Shipping\nAddress', 'assets/icons/shipping.png'),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Reviews()),
                  );
                },
                child:
                    profileOptionsMenu('My Reviews', 'assets/icons/review.png'),
              ),
            ],
          )
        ],
      ),
    );
  }

  personalInfoCard() {
    return Container(
      margin: EdgeInsets.only(top: getHeight(22)),
      padding: EdgeInsets.only(top: getHeight(18)),
      width: MediaQuery.of(context).size.width,
      //height: getHeight(271),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Personal Information',
            style: archivotitleStyle.copyWith(
                color: Colors.black,
                fontSize: getFont(18),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          const Divider(
            color: Color.fromRGBO(186, 186, 186, 0.5),
          ),
          SizedBox(
            height: getHeight(10),
          ),
          buildPersonalInfo('Name', "Sudarshan"),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Adress', 'Sankhamul, Kathmandu'),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Phone No.', "981284882"),
          SizedBox(
            height: getHeight(29),
          ),
          buildPersonalInfo('Email', "sudarshan@gmail.com"),
          SizedBox(
            height: getHeight(20),
          ),
        ],
      ),
    );
  }

  profileOptionsMenu(optionName, optionIcon) {
    return Container(
      width: getWidth(152),
      height: getHeight(57),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: getWidth(15),
          ),
          Image.asset(
            optionIcon,
            height: getHeight(25),
            width: getWidth(25),
          ),
          SizedBox(
            width: getWidth(10),
          ),
          Text(
            optionName,
            style:
                TextStyle(fontSize: getFont(14), fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  buildPersonalInfo(options, answers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(
              left: getWidth(26),
            ),
            child: Text(options,
                style: archivotitleStyle.copyWith(
                    color: Colors.black,
                    fontSize: getFont(16),
                    fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: getWidth(30)),
        Expanded(
          flex: 3,
          child: Text(
            answers,
            style: archivotitleStyle.copyWith(
                color: Colors.black,
                fontSize: getFont(16),
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  logoutAndSwitchAccCard() {
    return Container(
      margin: EdgeInsets.only(top: getHeight(22)),
      width: MediaQuery.of(context).size.width,
      // height: getHeight(111),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getHeight(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: getWidth(20),
              ),
              Image.asset(
                'assets/icons/switchacc.png',
                height: 17,
              ),
              SizedBox(
                width: getWidth(20),
              ),
              Text(
                'Switch to other account',
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w400,
                    color: AppColors.textblack),
              )
            ],
          ),
          SizedBox(height: getHeight(10)),
          const Divider(),
          SizedBox(height: getHeight(10)),
          InkWell(
            onTap: () {
              Get.to(() => LoginPage());
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(20),
                ),
                const Icon(
                  Icons.logout_outlined,
                  size: 20,
                  color: Color.fromRGBO(216, 47, 47, 1),
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                Text(
                  'Log Out',
                  style: archivotitleStyle.copyWith(
                      color: AppColors.textblack,
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(height: getHeight(10)),
        ],
      ),
    );
  }
}
