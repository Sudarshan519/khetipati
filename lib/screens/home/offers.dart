import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Offers'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.mainGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    offersCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    offersCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    offersCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    offersCard(),
                    const SizedBox(
                      height: 20,
                    ),
                    offersCard(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
        ),
      ),

      //sssbottomNavigationBar: BottomNav(),
    );
  }

  Widget offersCard() {
    return SizedBox(
      height: getHeight(145),
      width: getWidth(355),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getWidth(30)),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green[800])),
                            children: [
                          TextSpan(
                              text: "30% ",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green[800]))),
                          TextSpan(
                            text: "off",
                          )
                        ])),
                    // Text(
                    //   "30% OFF",
                    //   style: GoogleFonts.roboto(
                    //       textStyle: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.w700,
                    //           color: Colors.green[800])),
                    // ),
                    Text(
                      "on all veggies",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.green[800])),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      'Grab all the offer\nbefore its gone',
                      style: GoogleFonts.archivo(
                          textStyle: TextStyle(
                              fontSize: getFont(12),
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700)),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColors.mainGreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            bottomLeft: Radius.circular(65),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              bottomLeft: Radius.circular(60)),
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/ad.png",
                              ),
                              fit: BoxFit.fill))),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
