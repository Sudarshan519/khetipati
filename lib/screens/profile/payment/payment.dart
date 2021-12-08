import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/profile/payment/add_card.dart';
import 'package:khetipati/widgets/app_bar.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

enum SingingCharacter { card, cash, phonepay, moblebanking }

class _PaymentState extends State<Payment> {
  final SingingCharacter? _character = SingingCharacter.card;
  bool value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Payment'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(18), vertical: getHeight(26)),
          height: 815,
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            //scrollDirection: Axis.vertical,
            children: [
              buildCreditCard(),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions('Cash on Delivery'),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions('FonePay'),
              SizedBox(
                height: getHeight(17),
              ),
              paymentOptions('Mobilebanking'),
              SizedBox(
                height: getHeight(17),
              ),
              buildPlacetheOrderButton()
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
                  style: TextStyle(
                      fontSize: getFont(16), fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: getHeight(15)),
                child: Center(
                  child: Container(
                    height: getHeight(97),
                    width: getWidth(238 + 22 + 22),
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
                  padding: EdgeInsets.only(left: getWidth(20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color.fromRGBO(36, 36, 36, 1),
                        Color.fromRGBO(67, 67, 67, 1),
                        Color.fromRGBO(92, 92, 92, 1)
                      ],
                      stops: [0, 0.5, 1],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Row(
                        children: [
                          Text(
                            'Credit Card',
                            style: TextStyle(
                                fontSize: getFont(12),
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                      Text(
                        '000 0101 1010',
                        style: TextStyle(
                            fontSize: getFont(12),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getHeight(25),
                      ),
                      Row(
                        children: [
                          Text(
                            'Card Holder\nBarney Stayye',
                            style: TextStyle(
                                fontSize: getFont(12),
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: getWidth(30),
                          ),
                          Text(
                            'Expires\n12/24',
                            style: TextStyle(
                                fontSize: getFont(12),
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getHeight(15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCard()),
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
      ),
    );
  }

  paymentOptions(optionName) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 67,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Radio(value: value, groupValue: null, onChanged: null),
        Text(
          optionName,
          style: TextStyle(fontSize: getFont(16), fontWeight: FontWeight.w500),
        ),
      ]),
    );
  }

  buildPlacetheOrderButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: getHeight(48),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: AppColors.mainGreen,
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
}
