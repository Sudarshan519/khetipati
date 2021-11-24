import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/Bottomnav.dart';
import 'package:khetipati/widgets/items.dart';

class CategotyItems extends StatefulWidget {
  CategotyItems({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  _CategotyItemsState createState() => _CategotyItemsState();
}

class _CategotyItemsState extends State<CategotyItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.mainGreen,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 30),
                      InkWell(
                        child: Container(
                          height: 70,
                          width: 60,
                          //color: Colors.black,
                          child: Image.asset('assets/images/pic.png'),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textGreen,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Howard",
                            style: TextStyle(
                                fontSize: 22,
                                color: AppColors.textGreen,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.green[900],
                    ),
                  ),
                  //SizedBox(width: 10),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //  height: 1300,
              decoration: BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 31),
                    child: Text(
                      "Popular items",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreen),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Flexible(
                          child: Column(
                            children: [
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // Items(context, 'Tomatoes',
                              //     'assets/images/items/melons.png'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNav(),
    );
  }
}
