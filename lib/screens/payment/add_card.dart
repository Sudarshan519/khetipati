import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool value = false;
  bool dropdown = false;
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 815,
          padding: EdgeInsets.symmetric(
              horizontal: getWidth(18), vertical: getHeight(26)),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              buildCreditcard(),
              SizedBox(
                height: getHeight(17),
              ),
              Container(
                // width: 378,
                // height: 319,
                padding: EdgeInsets.symmetric(vertical: getHeight(25)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [boxShadow()]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    carddetails('Card Number'),
                    carddetails('Name on card'),
                    carddetails('Expiration Date'),
                    MergeSemantics(
                      child: ListTile(
                        title: const Text('Save this card'),
                        leading: CupertinoSwitch(
                          value: value,
                          onChanged: (v) => setState(() => value = v),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(30),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: getHeight(48),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  color: AppColors.mainGreen,
                  onPressed: () {},
                  child: Text(
                    'Add Card',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getFont(16),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCreditcard() {
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
                  'Credit/Debit Card',
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
          dropdown == true ? Image.asset('assets/images/card.png') : Container()
        ],
      ),
    );
    //  Container(
    //     width: MediaQuery.of(context).size.width,
    //     // height: 230,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             Radio(value: value, groupValue: null, onChanged: null),
    //             Text(
    //               'Credit/Debit Card',
    //               style: TextStyle(
    //                   fontSize: getFont(16), fontWeight: FontWeight.w500),
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //             width: getWidth(224),
    //             child: Image.asset('assets/images/card.png')),
    //         //  creditCard(),
    //         SizedBox(
    //           height: getHeight(40),
    //         ),
    //       ],
    //     ));
  }

  Widget carddetails(detailName) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: getWidth(30), vertical: getHeight(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailName,
            style:
                TextStyle(fontSize: getFont(16), fontWeight: FontWeight.w400),
          ),
          const TextField(),
        ],
      ),
    );
  }
}
