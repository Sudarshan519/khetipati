import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/profile/profile.dart';

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
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Reviews',
          style: TextStyle(
              fontSize: getFont(22),
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: getFont(20), color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 815,
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: getWidth(378),
                margin: EdgeInsets.only(
                    top: getHeight(20),
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05),
                // height: 626,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Reviews (3)',
                        style: TextStyle(
                          fontSize: getFont(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          reviewCard(),
                          const Divider(),
                          reviewCard(),
                          const Divider(),
                          reviewCard(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reviewCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: getHeight(177),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/items/melons.png',
                height: getHeight(90),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Watermelon',
                    style: TextStyle(
                      fontSize: getFont(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  Text(
                    'Rs.250',
                    style: TextStyle(
                        fontSize: getFont(20),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  )
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
                        style: TextStyle(fontSize: getFont(12)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: getHeight(20),
                  ),
                  Text(
                    '23 hrs ago',
                    style: TextStyle(
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
            height: 65,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 237, 237, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.75,
                // height: 42,
                child: const Text(
                  '“Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit ”',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
