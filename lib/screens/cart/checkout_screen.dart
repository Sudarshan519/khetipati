import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/theme.dart';
import 'package:khetipati/widgets/app_bar.dart';
import 'package:khetipati/widgets/divider.dart';

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
      appBar: buildAppBar(context, 'Checkout'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: getWidth(15), vertical: getHeight(20)),
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(15), vertical: getHeight(20)),
                //height: 953,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      child: buildShippinInfo(),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                              fontSize: getFont(16),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: getHeight(15),
                        ),
                        buildCheckoutItems(),
                        SizedBox(
                          height: getHeight(10),
                        ),
                        buildCheckoutItems()
                      ],
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    buildOrderSummary(),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Container(
                      height: 94,
                      //width: 414,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total Amount',
                                    style: robototitleStyle.copyWith(
                                        fontSize: getFont(15),
                                        color: Colors.black)),
                                Text('Rs. 1000',
                                    style: robototitleStyle.copyWith(
                                      fontSize: getFont(20),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getHeight(41),
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {},
                              color: AppColors.mainGreen,
                              child: Text(
                                'Proceed To Pay',
                                style: robototitleStyle.copyWith(
                                    fontSize: getFont(16), color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildShippinInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Information',
          style: TextStyle(fontSize: getFont(16), fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: getHeight(15),
        ),
        buildShippingDetails(
            Icons.home, 'Default Address', 'Shankhaul Marga,\nKathmandu 44600'),
        SizedBox(
          height: getHeight(20),
        ),
        buildShippingDetails(Icons.home, 'Phone', '98012432545'),
        SizedBox(
          height: getHeight(20),
        ),
        buildShippingDetails(Icons.phone, 'Email', 'SSS@gmai.com'),
        SizedBox(
          height: getHeight(20),
        ),
      ],
    );
  }

  Widget buildCheckoutItems() {
    return Container(
      height: getHeight(83),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2, color: const Color.fromRGBO(193, 193, 193, 0.3))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: getWidth(79),
                  height: getHeight(56),
                  child: Image.asset('assets/images/items/grapes.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cherry',
                      style: TextStyle(
                          fontSize: getFont(14), fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '10 kcal',
                      style: TextStyle(
                          fontSize: getFont(10), fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Rs. 250',
                      style: TextStyle(
                          fontSize: getFont(15),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreen),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 10),
              child: Text(
                'Quantity: 1',
                style: TextStyle(
                    fontSize: getFont(12),
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: TextStyle(fontSize: getFont(16), fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: getHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style:
                  TextStyle(fontSize: getFont(15), fontWeight: FontWeight.w400),
            ),
            Text(
              'Rs. 500',
              style:
                  TextStyle(fontSize: getFont(15), fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style:
                  TextStyle(fontSize: getFont(15), fontWeight: FontWeight.w400),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rs. 100',
                  style: TextStyle(
                      fontSize: getFont(15), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getHeight(15),
                ),
                Text(
                  'Total Rs. 100',
                  style: TextStyle(
                      fontSize: getFont(15), fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Offers',
              style:
                  TextStyle(fontSize: getFont(15), fontWeight: FontWeight.w400),
            ),
            Container(
              height: getHeight(31),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(135, 194, 65, 0.2)),
              child: Center(
                child: Text(
                  'Promo Code Applied',
                  style: TextStyle(
                      color: AppColors.textGreen,
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  buildShippingDetails(IconData icon, title, subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 20,
              color: AppColors.mainGreen,
            ),
            SizedBox(
              width: getWidth(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  //'Default Address',
                  style: TextStyle(
                      fontSize: getFont(16), fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getFont(8),
                ),
                Text(
                  subtitle,
                  //'Shankhaul Marga,\nKathmandu 44600',
                  style: robotosubtitleStyle.copyWith(
                      color: const Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
        Container(
          width: getWidth(42),
          height: getHeight(22),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color.fromRGBO(135, 194, 65, 0.2)),
          child: Center(
            child: Text(
              'Edit',
              style: robototitleStyle.copyWith(
                  color: AppColors.textGreen,
                  fontSize: getFont(14),
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
