import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/profile/AddCard.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/Bottomnav.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

enum SingingCharacter { card, cash, phonepay, moblebanking }

class _PaymentState extends State<Payment> {
  SingingCharacter? _character = SingingCharacter.card;
  bool value = false;
  int val = -1;
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
          'Payment',
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
          height: 815,
          decoration: BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            //scrollDirection: Axis.vertical,
            children: [
              Creditcard(),
              SizedBox(
                height: 20,
              ),
              PaymentOptions('Cash on Delivery'),
              PaymentOptions('FonePay'),
              PaymentOptions('Mobilebanking'),
              // Padding(
              //   padding: const EdgeInsets.only(right: 18, left: 18, bottom: 20),
              //   child: Container(
              //     width: 378,
              //     height: 67,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 17, left: 36),
              //       child: Row(
              //         children: [
              //           Container(
              //             height: 19,
              //             width: 19,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(20),
              //               color: Color.fromRGBO(2, 95, 51, 0.2),
              //             ),
              //             child: IconButton(
              //               padding: EdgeInsets.zero,
              //               icon: Icon(
              //                 Icons.add,
              //                 size: 18,
              //                 color: AppColors.textGreen,
              //               ),
              //               onPressed: () {},
              //             ),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             'Add New Payment Method',
              //             style: TextStyle(
              //                 fontSize: 16,
              //                 color: AppColors.textGreen,
              //                 fontWeight: FontWeight.w400),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.04,
                    left: MediaQuery.of(context).size.width * 0.04),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: RaisedButton(
                    color: AppColors.mainGreen,
                    onPressed: () {},
                    child: Text(
                      'Place the Order',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
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
    );
  }

  Widget Creditcard() {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //  height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Radio(value: value, groupValue: null, onChanged: null),
                  Text(
                    'Credit/Debit Card',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 25, left: 63),
                  //   child: Text(
                  //     'Credit/Debit Card',
                  //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                          top: 30),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: 238 + 22 + 22,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(58, 58, 58, 0.61),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09,
                          right: MediaQuery.of(context).size.width * 0.09,
                          top: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color.fromRGBO(36, 36, 36, 1),
                              Color.fromRGBO(67, 67, 67, 1),
                              Color.fromRGBO(92, 92, 92, 1)
                            ],
                            stops: const [0, 0.5, 1],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Credit Card',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  // Stack(
                                  //   children: [
                                  //     Container(
                                  //       height: 30,
                                  //       width: 30,
                                  //       decoration: BoxDecoration(
                                  //           color: Colors.red.withOpacity(0.9),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20)),
                                  //     ),
                                  //     Container(
                                  //       height: 30,
                                  //       width: 30,
                                  //       decoration: BoxDecoration(
                                  //           color:
                                  //               Colors.orange.withOpacity(0.9),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20)),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                            Text(
                              '000 0101 1010',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Card Holder\n Barney Stayye',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                ),
                                Text(
                                  'Expires\n12/24',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCard()),
                  );
                },
                child: Text(
                  'Add new Card',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGreen),
                ))
          ],
        ),
      ),
    );
  }

  Widget PaymentOptions(OptionName) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 20,
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 67,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Radio(value: value, groupValue: null, onChanged: null),
          Text(
            OptionName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
