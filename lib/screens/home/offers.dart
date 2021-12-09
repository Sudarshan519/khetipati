import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/ad_banner.dart';
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
                    ...List.generate(10, (index) => const AdBanner()),
                    const SizedBox(
                      height: 20,
                    ),
                    // offersCard(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // offersCard(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // offersCard(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // offersCard(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // offersCard(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ))
          ],
        ),
      ),

      //sssbottomNavigationBar: BottomNav(),
    );
  }
}
