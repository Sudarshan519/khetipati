import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/Bottomnav.dart';

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
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Vouchers',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //height: 815,
        decoration: BoxDecoration(
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
                VoucherItems('assets/images/offers/offer1.png'),
                SizedBox(
                  height: 7,
                ),
                VoucherItems('assets/images/offers/offer2.png'),
                SizedBox(
                  height: 7,
                ),
                VoucherItems('assets/images/offers/offer1.png'),
                SizedBox(
                  height: 7,
                ),
                VoucherItems('assets/images/offers/offer2.png')
              ],
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

  Widget VoucherItems(VoucherImg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            width: 115,
            child: Image.asset(
              VoucherImg,
              fit: BoxFit.contain,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'Use code voucher and  get 10% off on apples',
                  style: TextStyle(
                      color: AppColors.textblack,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Container(
              width: 61,
              height: 31,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(135, 194, 65, 0.2)),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                      color: AppColors.textGreen,
                      fontSize: 14,
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
