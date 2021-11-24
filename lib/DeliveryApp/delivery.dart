import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:khetipati/DeliveryApp/DeliveryOrders.dart';
import 'package:khetipati/DeliveryApp/MyEarnings.dart';
import 'package:khetipati/DeliveryApp/deliveryEditProfile.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/orders/orders.dart';
import 'package:khetipati/screens/profile/Reviews.dart';
import 'package:khetipati/screens/profile/ShippingAddress.dart';
import 'package:khetipati/screens/profile/editprofile.dart';
import 'package:khetipati/screens/profile/payment.dart';
import 'package:khetipati/screens/profile/vouchers.dart';
import 'package:khetipati/screens/profile/wishlist.dart';
import 'package:khetipati/widgets/Bottomnav.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'KhetiPati',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              //  Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 283,
              width: 414,
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
                    "Howard Wollowitz",
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
                        MaterialPageRoute(
                            builder: (context) => DeliveryEditProfile()),
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
              width: 414,
              height: 815,
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
                          width: 353,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 21, left: 14),
                                    child: InkWell(
                                      mouseCursor: SystemMouseCursors.click,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyEarnings()),
                                        );
                                      },
                                      child: profileOptions(
                                          'assets/icons/myearnings.png',
                                          'My Earnings',
                                          'Rs',
                                          '150.55'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 21, left: 14),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeliveryOrders()),
                                        );
                                      },
                                      child: profileOptions(
                                          'assets/icons/orderscomp1.png',
                                          'Orders Completed',
                                          '',
                                          '50'),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 14, left: 14),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeliveryOrders()),
                                        );
                                      },
                                      child: profileOptions(
                                          'assets/icons/ordersPen.png',
                                          'Orders Pending',
                                          '',
                                          '10'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 14, left: 14),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyEarnings()),
                                        );
                                      },
                                      child: profileOptions(
                                          'assets/icons/myearnings.png',
                                          'Amount Withdrawn',
                                          'Rs',
                                          '100'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: FittedBox(
                        child: Container(
                          width: 353,
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
                              PersonalInfo('Name', 'Howard Wollowitz'),
                              SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Adress', 'Sankhamul, Kathmandu'),
                              SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Phone No.', '98123115315'),
                              SizedBox(
                                height: 20,
                              ),
                              PersonalInfo('Email', 'info@gmail.com'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Container(
                        width: 353,
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
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 13, 18, 0),
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
                            )
                          ],
                        ),
                      ),
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
      //bottomNavigationBar: BottomNav(),
    );
  }

  Widget profileOptions(optionIcon, optionName, curr, price) {
    return Container(
      width: 152,
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(191, 191, 191, 0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 10,
          ),
          Image.asset(
            optionIcon,
            color: AppColors.mainGreen,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    curr,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGreen),
                  )
                ],
              ),
              // RichText(
              //   text: TextSpan(
              //     text: 'Rs ',
              //     style: TextStyle(
              //         fontSize: 11,
              //         fontWeight: FontWeight.w400,
              //         color: AppColors.textGreen),
              //     children: const <TextSpan>[
              //       TextSpan(
              //           text: price,
              //           style: TextStyle(
              //               fontSize: 15, fontWeight: FontWeight.w400)),
              //     ],
              //   ),
              // ),
              Text(
                optionName,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.6)),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
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
