import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/home/category_items.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/widgets/Bottomnav.dart';
import 'package:khetipati/widgets/items.dart';

import 'cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            'Checkout',
            style: TextStyle(
                fontSize: 22,
                color: AppColors.textGreen,
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: AppColors.textGreen)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.mainGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //height: 953,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          child: ShippingInfo(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Text(
                                  'Items',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              CheckoutItems(),
                              CheckoutItems()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 15,
                        ),
                        OrderSummary(),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 94,
                          //width: 414,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Total Amount',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        'Rs. 1000',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textGreen),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 52,
                                  ),
                                ),
                                SizedBox(
                                  width: 174,
                                  height: 41,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    color: AppColors.mainGreen,
                                    child: Text(
                                      'Proceed To Pay',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                // ElevatedButton(
                                //     style: ButtonStyle(
                                //       backgroundColor:
                                //           MaterialStateProperty.all(Colors.lightGreen),
                                //       padding: MaterialStateProperty.all(
                                //           EdgeInsets.fromLTRB(33, 25, 33, 25)),
                                //     ),
                                //     onPressed: null,
                                //     child: Text(
                                //       'Add To Cart',
                                //       style: TextStyle(color: Colors.white, fontSize: 20),
                                //     ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                color: Colors.grey[700],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              //Image.asset('assets/icons/dot.png')
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
                color: Colors.grey[800],
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
                color: Colors.grey[800],
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
                'assets/icons/user.png',
                color: Colors.grey[800],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              Text(
                'Profile',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ));
  }

  Widget ShippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 18),
          child: Text(
            'Shipping Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home,
                    size: 20,
                    color: AppColors.mainGreen,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Default Address',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Shankhaul Marga,\nKathmandu 44600',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SizedBox(
                  width: 150,
                ),
              ),
              Container(
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
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.phone,
                    size: 20,
                    color: AppColors.mainGreen,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '98012432545',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SizedBox(
                  width: 150,
                ),
              ),
              Container(
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
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email,
                    size: 20,
                    color: AppColors.mainGreen,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Jtoarjao@gmail.com',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SizedBox(
                  width: 150,
                ),
              ),
              Container(
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
            ],
          ),
        )
      ],
    );
  }

  Widget CheckoutItems() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 83,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2, color: Color.fromRGBO(193, 193, 193, 0.3))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 79,
                    height: 56,
                    child: Image.asset('assets/images/items/grapes.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cherry',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '10 kcal',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Rs. 250',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGreen),
                      )
                    ],
                  ),
                ],
              ),
              Flexible(
                  child: SizedBox(
                width: 100,
              )),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10),
                  child: Text('Quantity: 1'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget OrderSummary() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Rs. 500',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rs. 100',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Total Rs. 100',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Offers',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Container(
                  width: 135,
                  height: 31,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color.fromRGBO(135, 194, 65, 0.2)),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'Promo Code Applied',
                        style: TextStyle(
                            color: AppColors.textGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
