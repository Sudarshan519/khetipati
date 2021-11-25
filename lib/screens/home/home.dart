import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/auth.dart';
import 'package:khetipati/controllers/cart_controller.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/cagetories.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/cart/cart_screens.dart';
import 'package:khetipati/screens/home/offers.dart';
import 'package:khetipati/screens/home/specialoffers.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/bottom_nav.dart';
import 'package:khetipati/widgets/items.dart';

import 'widgets/category_items.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
  final authController = Get.find<AuthController>();
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileContainer(),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppColors.mainGrey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 34, bottom: 42, right: 27, left: 27),
                      child: InkWell(
                        child: Container(
                          height: 144,
                          width: 356,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30% OFF",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[800]),
                                      ),
                                      Text(
                                        "on all veggies",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[800]),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Grab all the offer \nbefore its gone')
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  width: 193,
                                  height: 144,
                                  // decoration: BoxDecoration(
                                  //   color: Colors.red,
                                  //   borderRadius: BorderRadius.only(
                                  //       topLeft: Radius.circular(70),
                                  //       bottomLeft: Radius.circular(70)),
                                  // ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                            color: AppColors.mainGreen,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(70),
                                                bottomLeft: Radius.circular(65),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                      ),
                                      // Image.asset('assets/images/curve.png'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(70),
                                              bottomLeft: Radius.circular(60)),
                                          child: Image.asset(
                                            'assets/images/ad.png',
                                            fit: BoxFit.fill,
                                            height: 144,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Offers()),
                          );
                        },
                      ),
                    ),
                    buildCategories(),
                    buildPopularItem("Popular Items"),
                    buildPopularItem("Recommended Items"),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 20),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 31),
                    //             child: Text(
                    //               "Recomended items",
                    //               style: TextStyle(
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: AppColors.textGreen),
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(right: 31),
                    //             child: TextButton(
                    //               onPressed: () {
                    //                 Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => CategotyItems(
                    //                             category:
                    //                                 controller.categories[0],
                    //                           )),
                    //                 );
                    //               },
                    //               child: Text(
                    //                 "See All",
                    //                 style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.normal,
                    //                     color: Colors.green[900]),
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.symmetric(vertical: 20.0),
                    //       height: 250.0,
                    //       child: Obx(
                    //         () => ListView.builder(
                    //           scrollDirection: Axis.horizontal,
                    //           itemCount: controller.products.length,
                    //           itemBuilder: (_, int i) {
                    //             return Items(context, controller.products[i]);
                    //           },
                    //           // children: [
                    //           //   SizedBox(
                    //           //     width: 10,
                    //           //   ),
                    //           //   Items(context, 'Tomatoes',
                    //           //       'assets/images/items/melons.png'),
                    //           //   Items(context, 'Tomatoes',
                    //           //       'assets/images/items/grapes.png'),
                    //           //   Items(context, 'Tomatoes',
                    //           //       'assets/images/items/tomatoes.png'),
                    //           // ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 31),
                                child: Text(
                                  "Special Offers",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textGreen),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 31),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SpecialOffers()),
                                    );
                                  },
                                  child: Text(
                                    "See All",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.green[900]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpOffers(
                                context, 'assets/images/offers/offer1.png'),
                            SpOffers(
                                context, 'assets/images/offers/offer2.png'),
                            SpOffers(
                                context, 'assets/images/offers/offer1.png'),
                            SpOffers(
                                context, 'assets/images/offers/offer2.png'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //  bottomNavigationBar: TabNavigation(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
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
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Color.fromRGBO(0, 0, 0, 0.5),
              size: 30,
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
              'assets/icons/homeselected.png',
              color: AppColors.mainGreen,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            Image.asset('assets/icons/dot.png')
            // Text(
            //   'Home',
            //   style: TextStyle(
            //       color: Color.fromRGBO(0, 0, 0, 0.8),
            //       fontSize: 12,
            //       fontWeight: FontWeight.w400),
            // )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/navorder.png',
              color: Colors.grey[800],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            const Text(
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
              color: Colors.grey[800],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            const Text(
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
              'assets/icons/user.png',
              color: Colors.grey[800],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.009,
            ),
            const Text(
              'Profile',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  // Widget Items(BuildContext context, itemName) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 6, right: 6),
  //     child: InkWell(
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Fruits()),
  //         );
  //       },
  //       child: Container(
  //         width: 149,
  //         height: 191,
  //         decoration: BoxDecoration(
  //             color: Colors.white, borderRadius: BorderRadius.circular(20)),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             // Padding(
  //             //   padding: const EdgeInsets.all(20.0),
  //             //   child: Icon(Icons.thumb_up),
  //             // ),
  //             Container(
  //               height: 150,
  //               width: 150,
  //               //color: AppColors.mainGrey,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
  //               child: Column(
  //                 children: [
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Column(
  //                         children: [
  //                           Text(
  //                             itemName,
  //                             style: TextStyle(
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: AppColors.textblack),
  //                           ),
  //                           Text(
  //                             '100 kcal',
  //                             style: TextStyle(
  //                                 fontSize: 10, color: AppColors.textblack),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         children: [
  //                           Icon(
  //                             Icons.star,
  //                             color: Colors.amber,
  //                             size: 15,
  //                           ),
  //                           Text(
  //                             '4.5',
  //                             style: TextStyle(fontSize: 10),
  //                           )
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 10,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Text(
  //                         'Rs. 250',
  //                         style: TextStyle(
  //                             fontSize: 15,
  //                             fontWeight: FontWeight.bold,
  //                             color: AppColors.textGreen),
  //                       ),
  //                       Container(
  //                         height: 30,
  //                         width: 40,
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(4),
  //                           border: Border.all(
  //                               color: Color.fromRGBO(135, 194, 65, 1)),
  //                           color: Colors.white,
  //                         ),
  //                         child: Icon(
  //                           Icons.shopping_cart_outlined,
  //                           size: 20,
  //                           color: Color.fromRGBO(135, 194, 65, 0.8),
  //                         ),
  //                       )
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget Categories(BuildContext context, Category category, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryDetail(index: index)),
          );
        },
        child: Container(
          height: 62,
          width: 149,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  // color: AppColors.mainGrey,
                  child: Image.network(category.logoUrl),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textGreen),
                    ),
                    Text(
                      category.description,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textblack),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SpOffers(BuildContext context, offerPic) {
    return Padding(
      padding: EdgeInsets.only(
          top: 16,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 116,
              child: Image.asset(offerPic),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '10% off on apples',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '100 kcal',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Rs. 300',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rs. 250',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textGreen),
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                width: 62,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.lightGreen),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                      color: Color.fromRGBO(135, 194, 65, 0.8),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 18,
          ),
          child: InkWell(
            onTap: () {
              print(controller.categories.length);
            },
            child: const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textGreen),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          height: 100.0,
          child: Obx(
            () => controller.isloading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categories.length,
                    itemBuilder: (
                      _,
                      int i,
                    ) {
                      return Categories(context, controller.categories[i], i);
                    }

                    // Categories(
                    //     context, 'Fruits', 'assets/images/category/fruits.png'),
                    // Categories(context, 'Meat', 'assets/images/category/meat.png'),
                    // Categories(context, 'Dairy', 'assets/images/category/fruits.png'),

                    ),
          ),
        ),
      ],
    );
  }

  buildPopularItem(
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: InkWell(
                  onTap: () {
                    // print(controller.fetchProduct());
                    // print(controller.products.length);
                  },
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textGreen),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 31),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryDetail(
                                index: 0,
                              )),
                    );
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.green[900]),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18.0),
          height: 250.0,
          child: Obx(
            () => controller.isloading.value
                ? Center(child: const CircularProgressIndicator())
                : controller.products.isEmpty
                    ? const Center(child: Text("Empty"))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        itemCount: controller.products.length,
                        itemBuilder: (_, int i) {
                          print(controller.products.length);
                          return Items(context, controller.products[i]);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
          ),
        ),
      ],
    );
  }

  buildProfileContainer() {
    return Container(
      color: AppColors.mainGreen,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
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
                    "Sudarshan", // user.firstname!.capitalizeFirst.toString(),
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
    );
  }
}
