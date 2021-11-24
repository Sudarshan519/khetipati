import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/widgets/Bottomnav.dart';
import 'package:khetipati/widgets/items.dart';
import 'package:khetipati/widgets/offersitems.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
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
          'Special Offers',
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
              width: MediaQuery.of(context).size.width,
              //height: 815,
              decoration: BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  OfferItems(context, 'assets/images/offers/offer1.png'),
                  OfferItems(context, 'assets/images/offers/offer2.png'),
                  OfferItems(context, 'assets/images/offers/offer1.png'),
                  OfferItems(context, 'assets/images/offers/offer2.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 31),
                        child: Text(
                          "Recommended items",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textGreen),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 250.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            // Items(context, 'Cherry',
                            //     'assets/images/items/melons.png'),
                            // Items(context, 'Tomatoes',
                            //     'assets/images/items/grapes.png'),
                            // Items(context, 'Cherry',
                            //     'assets/images/items/tomatoes.png')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Cart()),
      //     );
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 20.0),
      //     child: Container(
      //       // padding: EdgeInsets.only(top: 20),
      //       width: 68,
      //       height: 68,
      //       decoration: BoxDecoration(
      //           color: AppColors.mainGrey,
      //           border: Border.all(width: 5, color: AppColors.mainGreen),
      //           borderRadius: BorderRadius.circular(40)),
      //       child: Icon(
      //         Icons.shopping_cart_outlined,
      //         color: Color.fromRGBO(0, 0, 0, 0.5),
      //         size: 30,
      //       ),
      //     ),
      //   ),
      // ),
      //bottomNavigationBar: BottomNav(context,  Color.fromRGBO(0, 0, 0, 0.9), OrdersColor, NotificationColor, ProfileColor)
    );
  }
}
