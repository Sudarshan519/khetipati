import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/profile/AddShippingAddress.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/bottom_nav.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shipping Address',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: 815,
          decoration: BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 18, left: 18, bottom: 20),
                child: Container(
                  width: 378,
                  //  height: 650,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06,
                            bottom: 20),
                        child: Text(
                          'Default Shipping Address',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Address('Home'),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20,
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06),
                        child: Text(
                          'Work Addresses',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //EditShipping('Work'),
                      Address('Work'),
                      Address("Work 2"),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20,
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06),
                        child: Text(
                          'Other Addresses',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //  EditShipping('Home'),
                      Address('Home'),
                      Address('Home'),
                      Address('Home'),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 34, top: 30, bottom: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddShippingAddress()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 19,
                                width: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(2, 95, 51, 0.2),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: AppColors.textGreen,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add New Address',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textGreen,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      )
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

  // Widget EditShipping(ShippingAddress) {
  //   return Container(
  //     height: 115,
  //     width: 378,
  //     child: Stack(
  //       children: [
  //         // Positioned(
  //         //     top: 17,
  //         //     left: 32,
  //         //     child: Text(
  //         //       ShippingTitle,
  //         //       style: TextStyle(
  //         //           fontSize: 16,
  //         //           color: AppColors.textblack,
  //         //           fontWeight: FontWeight.w500),
  //         //     )),
  //         Positioned(
  //             top: 52,
  //             left: 32,
  //             child: Icon(
  //               Icons.home_outlined,
  //               size: 20,
  //               color: AppColors.mainGreen,
  //             )),
  //         Positioned(
  //           top: 49,
  //           left: 58,
  //           right: 26,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     ShippingAddress,
  //                     style: TextStyle(
  //                         fontSize: 15,
  //                         color: AppColors.textblack,
  //                         fontWeight: FontWeight.w400),
  //                   ),
  //                   Container(
  //                     width: 42,
  //                     height: 22,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(4),
  //                         color: Color.fromRGBO(135, 194, 65, 0.2)),
  //                     child: Center(
  //                       child: Text(
  //                         'Edit',
  //                         style: TextStyle(
  //                             color: AppColors.textGreen,
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.w400),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 8,
  //               ),
  //               Text(
  //                 'Shankhaul Marga,\nKathmandu 44600',
  //                 style: TextStyle(
  //                     fontSize: 14,
  //                     color: Color.fromRGBO(0, 0, 0, 0.5),
  //                     fontWeight: FontWeight.w700),
  //               )
  //             ],
  //           ),
  //         ),
  //         // Padding(
  //         //   padding: const EdgeInsets.only(top: 46, left: 310, right: 26),
  //         //   child: Container(
  //         //     width: 42,
  //         //     height: 22,
  //         //     decoration: BoxDecoration(
  //         //         borderRadius: BorderRadius.circular(4),
  //         //         color: Color.fromRGBO(135, 194, 65, 0.2)),
  //         //     child: Center(
  //         //       child: Text(
  //         //         'Edit',
  //         //         style: TextStyle(
  //         //             color: AppColors.textGreen,
  //         //             fontSize: 14,
  //         //             fontWeight: FontWeight.w400),
  //         //       ),
  //         //     ),
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  Widget Address(ShippingAddress) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.home_outlined,
                  size: 20,
                  color: AppColors.mainGreen,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ShippingAddress,
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textblack,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Shankhaul Marga,\nKathmandu 44600',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 42,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color.fromRGBO(135, 194, 65, 0.2)),
                  child: Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColors.textGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
