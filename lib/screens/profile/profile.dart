import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/models/user.dart';
import 'package:khetipati/screens/LoginRegisterPage/login.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/orders/orders.dart';
import 'package:khetipati/screens/profile/Reviews.dart';
import 'package:khetipati/screens/profile/ShippingAddress.dart';
import 'package:khetipati/screens/profile/editprofile.dart';
import 'package:khetipati/screens/profile/payment.dart';
import 'package:khetipati/screens/profile/vouchers.dart';
import 'package:khetipati/screens/profile/wishlist.dart';
import 'package:khetipati/utils/storage/auth_storage.dart';
import 'package:khetipati/widgets/bottom_nav.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 33,
                      bottom: 10,
                    ),
                    child: Container(
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 135,
                        width: 135,
                      ),
                    ),
                  ),
                  Text(
                    "Sudarshan ",
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.green[900],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Mangalbazar, Lalitpur",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[900],
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 255, 255, 0.5),
                        textStyle: const TextStyle(
                            fontSize: 15, color: Color.fromRGBO(2, 95, 51, 1))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromRGBO(2, 95, 51, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 815,
              decoration: BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: FittedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 239,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    mouseCursor: SystemMouseCursors.click,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Wishlist()),
                                      );
                                    },
                                    child: profileOptions('My Wishlist',
                                        'assets/icons/heart.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Orders()),
                                      );
                                    },
                                    child: profileOptions(
                                        'My Orders', 'assets/icons/order.png'),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Vouchers()),
                                      );
                                    },
                                    child: profileOptions(
                                        'Vouchers', 'assets/icons/voucher.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Payment()),
                                      );
                                    },
                                    child: profileOptions(
                                        'Payment', 'assets/icons/payment.png'),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShippingAddress()),
                                      );
                                    },
                                    child: profileOptions('Shipping\nAddress',
                                        'assets/icons/shipping.png'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Reviews()),
                                      );
                                    },
                                    child: profileOptions('My Reviews',
                                        'assets/icons/review.png'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: FittedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 271,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 18, bottom: 18),
                                child: Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Divider(),
                              PersonalInfo('Name', "Sudarshan"),
                              SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Adress', 'Sankhamul, Kathmandu'),
                              const SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Phone No.', "981284882"),
                              const SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Email', "sudarshan@gmail.com"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 111,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 13, 18, 0),
                                  child:
                                      Image.asset('assets/icons/switchacc.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Switch to other account',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack),
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            InkWell(
                              onTap: () {
                                AuthStorage.reset();
                                Get.to(() => LoginPage());
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 13, 18, 0),
                                    child: Icon(
                                      Icons.logout_outlined,
                                      color: Color.fromRGBO(216, 47, 47, 1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            // padding: EdgeInsets.only(top: 20),
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
      bottomNavigationBar: BottomNav(
        context,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/home.png',
              color: AppColors.darkgrey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Text(
              'Home',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/navorder.png',
              color: AppColors.darkgrey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Text(
              'Order',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/notification.png',
              color: AppColors.darkgrey,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Text(
              'Notification',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/userselected.png',
              color: AppColors.mainGreen,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Image.asset('assets/icons/dot.png')
            // Text(
            //   'Profile',
            //   style: TextStyle(
            //       color: Color.fromRGBO(0, 0, 0, 0.8),
            //       fontSize: 12,
            //       fontWeight: FontWeight.w400),
            // )
          ],
        ),
      ),
    );
  }

  Widget profileOptions(optionName, optionIcon) {
    return Container(
      width: 152,
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(optionIcon),
          SizedBox(
            width: 10,
          ),
          Text(
            optionName,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget PersonalInfo(options, answers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.090,
            ),
            child: Text(options,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: Text(
            answers,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
