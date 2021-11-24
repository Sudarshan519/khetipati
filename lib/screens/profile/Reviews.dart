import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/Bottomnav.dart';

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
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 815,
          decoration: BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  width: 378,
                  // height: 626,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(31, 18, 0, 13),
                        child: Text(
                          'Reviews (3)',
                          style: TextStyle(
                            fontSize: 16,
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
                            ReviewList(),
                            Divider(),
                            ReviewList(),
                            Divider(),
                            ReviewList(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
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
    );
  }

  Widget ReviewList() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 144 + 33,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 144,
          maxWidth: 340,
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/items/melons.png',
              height: 90,
            ),
            Positioned(
              top: 29,
              left: 117,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Watermelon',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rs.250',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGreen),
                  )
                ],
              ),
            ),
            Positioned(
              top: 31,
              left: 250,
              right: 6,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '23 hrs ago',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 65,
            //   left: 277,
            //   right: 6,
            //   child: Text(
            //     '23 hrs ago',
            //     style: TextStyle(
            //       fontSize: 12,
            //       fontWeight: FontWeight.w400,
            //       color: Color.fromRGBO(0, 0, 0, 0.8),
            //     ),
            //   ),
            // ),
            Positioned(
              top: 99,
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  //width: 334,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 237, 237, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.75,
                      // height: 42,
                      child: Text(
                        '“Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit Shankhaul Marga, Kathmandu 44600 Lorem Ipsum dolor sit ”',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
