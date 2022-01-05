import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/payment/add_card.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/theme.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

enum SingingCharacter { card, cash, phonepay, moblebanking }

class _PaymentState extends State<Payment> {
  bool dropdown = false;
  bool dropdowncard = false;
  bool value = false;
  int val = -1;

  void isDropdownCard() {
    setState(() {
      dropdowncard = !dropdowncard;
    });
  }

  void isDropdown() {
    setState(() {
      dropdown = !dropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Payment'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            horizontal: getWidth(18), vertical: getHeight(4)),
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: AppColors.mainGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            //scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: getHeight(26),
              ),
              buildCreditCard(),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions(
                  'Cash on Delivery',
                  dropdown == true
                      ? Container(
                          padding: EdgeInsets.only(bottom: getHeight(25)),
                          width: getWidth(259),
                          child: Text(
                              'You can pay with cash to the delivery person once you receive your goods.',
                              style: archivotitleStyle.copyWith(
                                  color: Colors.black,
                                  fontSize: getFont(14),
                                  fontWeight: FontWeight.w400)))
                      : Container()),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions('FonePay', Container()),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions('Mobilebanking', Container()),
              SizedBox(
                height: getHeight(17),
              ),
              buildAddNewPayment(),
              SizedBox(
                height: getHeight(17),
              ),
              buildPlacetheOrderButton(),
              SizedBox(
                height: getHeight(26),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCreditCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //  height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [boxShadow()],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getHeight(10), horizontal: getWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio(value: value, groupValue: null, onChanged: null),
                    Text(
                      'Credit/Debit Card',
                      style: TextStyle(
                          fontSize: getFont(16), fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      isDropdownCard();
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_outlined)),
              ],
            ),
          ),
          dropdowncard == true
              ? Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: getHeight(15)),
                          child: Center(
                            child: Container(
                              height: getHeight(97),
                              width: getWidth(238 + 22),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(58, 58, 58, 0.61),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                              width: getWidth(244),
                              // height: getHeight(130),
                              //   padding: EdgeInsets.only(left: getWidth(20)),
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(8),
                              //   gradient: const LinearGradient(
                              //     begin: Alignment.centerLeft,
                              //     end: Alignment.centerRight,
                              //     colors: <Color>[
                              //       Color.fromRGBO(36, 36, 36, 1),
                              //       Color.fromRGBO(67, 67, 67, 1),
                              //       Color.fromRGBO(92, 92, 92, 1)
                              //     ],
                              //     stops: [0, 0.5, 1],
                              //   ),
                              // ),
                              child: Center(
                                  child: Image.asset('assets/images/card.png'))
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     SizedBox(
                              //       height: getHeight(15),
                              //     ),
                              //     Row(
                              //       children: [
                              //         Text(
                              //           'Credit Card',
                              //           style: TextStyle(
                              //               fontSize: getFont(12),
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w800),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: getHeight(15),
                              //     ),
                              //     Text(
                              //       '000 0101 1010',
                              //       style: TextStyle(
                              //           fontSize: getFont(12),
                              //           color: Colors.white,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //     SizedBox(
                              //       height: getHeight(25),
                              //     ),
                              //     Row(
                              //       children: [
                              //         Text(
                              //           'Card Holder\nBarney Stayye',
                              //           style: TextStyle(
                              //               fontSize: getFont(12),
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w300),
                              //         ),
                              //         SizedBox(
                              //           width: getWidth(30),
                              //         ),
                              //         Text(
                              //           'Expires\n12/24',
                              //           style: TextStyle(
                              //               fontSize: getFont(12),
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.w300),
                              //         ),
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: getHeight(15),
                              //     ),
                              //   ],
                              // ),
                              ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddCard()),
                          );
                        },
                        child: Text(
                          'Add new Card',
                          style: TextStyle(
                              fontSize: getFont(15),
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGreen),
                        ))
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  paymentOptions(optionName, Widget? dropmenu) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 67,

      padding: EdgeInsets.symmetric(
          horizontal: getWidth(10), vertical: getHeight(10)),
      decoration: BoxDecoration(
          boxShadow: [boxShadow()],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Radio(value: value, groupValue: null, onChanged: null),
                Text(
                  optionName,
                  style: TextStyle(
                      fontSize: getFont(16), fontWeight: FontWeight.w500),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  isDropdown();
                },
                icon: const Icon(Icons.keyboard_arrow_down_outlined)),
          ]),
          dropmenu!
        ],
      ),
    );
  }

  buildPlacetheOrderButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: getHeight(48),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: AppColors.mainGreen,
        elevation: 5,
        onPressed: () {},
        child: Text(
          'Place the Order',
          style: TextStyle(
              color: Colors.white,
              fontSize: getFont(16),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  buildAddNewPayment() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(20), vertical: getHeight(22)),
      decoration: BoxDecoration(
          boxShadow: [boxShadow()],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            child: Icon(Icons.add, color: AppColors.textGreen, size: 20),
          ),
          SizedBox(
            width: getWidth(14),
          ),
          Text(
            'Add New Payment Method',
            style: archivotitleStyle.copyWith(
                fontSize: getFont(16), fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
