import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

class Vouchers extends StatelessWidget {
  const Vouchers({Key? key}) : super(key: key);

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
          'Vouchers',
          style: TextStyle(
              fontSize: getFont(22),
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //height: 815,
        decoration: const BoxDecoration(
          color: AppColors.mainGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: 20,
              right: MediaQuery.of(context).size.width * 0.04,
              left: MediaQuery.of(context).size.width * 0.04),
          child: Container(
            width: double.infinity,
            // height: 475,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: getWidth(115),
            child: Image.asset(
              voucherImg,
              fit: BoxFit.contain,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: SizedBox(
                width: SizeConfigs.screenWidth * 0.5,
                child: Text(
                  'Use code voucher and  get 10% off on apples',
                  style: TextStyle(
                      color: AppColors.textblack,
                      fontSize: getFont(14),
                      fontWeight: FontWeight.w800),
                ),
              ),
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
