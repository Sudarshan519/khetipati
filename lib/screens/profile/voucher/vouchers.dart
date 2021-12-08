import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/widgets/app_bar.dart';

class Vouchers extends StatefulWidget {
  const Vouchers({Key? key}) : super(key: key);

  @override
  _VouchersState createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Vouchers'),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 815,
        decoration: const BoxDecoration(
          color: AppColors.mainGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getWidth(20), vertical: getHeight(20)),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            // height: 475,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                voucherItemCard('assets/images/offers/offer1.png'),
                SizedBox(
                  height: getHeight(7),
                ),
                voucherItemCard('assets/images/offers/offer2.png'),
                SizedBox(
                  height: getHeight(7),
                ),
                voucherItemCard('assets/images/offers/offer1.png'),
                SizedBox(
                  height: getHeight(7),
                ),
                voucherItemCard('assets/images/offers/offer2.png')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget voucherItemCard(voucherImg) {
    return Row(
      mainAxisAlignment: MediaQuery.of(context).size.width > 500
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        SizedBox(
            width: getWidth(100),
            child: Image.asset(
              voucherImg,
              fit: BoxFit.contain,
            )),
        SizedBox(
          width: getWidth(10),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: getWidth(180),
              child: Text(
                'Use code voucher and  get 10% off on apples',
                style: TextStyle(
                    color: AppColors.textblack,
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: getWidth(61),
              height: getHeight(31),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(135, 194, 65, 0.2)),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                      color: AppColors.textGreen,
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
