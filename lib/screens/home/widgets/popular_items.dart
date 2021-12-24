import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/screens/home/tabs/profile_tab.dart';

class PopularItems extends StatefulWidget {
  const PopularItems({
    Key? key,
    //  required this.index
  }) : super(key: key);

  /// final int index;
  @override
  _PopularItemsState createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  final controller = Get.find<HomeController>();
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
                      const SizedBox(width: 30),
                      InkWell(
                        child: SizedBox(
                          height: 70,
                          width: 60,
                          //color: Colors.black,
                          child: Image.asset('assets/images/pic.png'),
                        ),
                        onTap: () {
                          Get.to(const ProfileTab());
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
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
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //  height: 1300,
              decoration: const BoxDecoration(
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
                          fontSize: getFont(18),
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreen),
                    ),
                  ),
                  // Wrap(
                  //   children: [

                  //   ],
                  // ),

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
