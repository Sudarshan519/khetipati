import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';

import '../../theme.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'My Reviews'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: buildReviewList(),
        ),
      ),
    );
  }

  totalReviews() {
    return Text(
      'Reviews (3)',
      style: archivotitleStyle.copyWith(
          fontSize: getFont(16),
          fontWeight: FontWeight.w500,
          color: Colors.black),
    );
  }

  buildReviewList() {
    return Container(
      width: getWidth(378),

      margin: EdgeInsets.only(
          top: getHeight(20), right: getWidth(20), left: getWidth(20)),
      padding: EdgeInsets.only(
          top: getHeight(20), right: getWidth(20), left: getWidth(20)),
      // height: 626,
      decoration: BoxDecoration(
        boxShadow: [boxShadow()],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          totalReviews(),
          ...List.generate(
              10,
              (index) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: index == 9
                          ? null
                          : const Border(
                              bottom: BorderSide(color: Colors.grey))),
                  child: reviewTile()))
        ],
      ),
    );
  }

  Widget reviewTile() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: getHeight(177),
      margin: EdgeInsets.symmetric(vertical: getHeight(13)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/items/melons.png',
                    height: getHeight(90),
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Watermelon',
                        style: archivotitleStyle.copyWith(
                            fontSize: getFont(18),
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: getHeight(10),
                      ),
                      Text(
                        'Rs.250',
                        style: robototitleStyle.copyWith(
                            fontSize: getFont(20),
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGreen),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Text(
                        '4.5',
                        style: archivotitleStyle.copyWith(
                            color: const Color.fromRGBO(0, 0, 0, 0.7),
                            fontSize: getFont(12)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  Text(
                    '23 hrs ago',
                    style: archivotitleStyle.copyWith(
                      fontSize: getFont(12),
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            //width: 334,
            height: 65, padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 237, 237, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              '“Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit ”',
              style: archivosubtitleStyle.copyWith(
                fontSize: getFont(13),
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
