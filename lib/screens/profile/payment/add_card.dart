import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/profile/widgets/credit_card.dart';

import 'package:khetipati/widgets/app_bar.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool value = false;
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
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
                height: getHeight(17),
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
        // height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
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
            creditCard(),
            SizedBox(
              height: getHeight(40),
            ),
          ],
        ));
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
