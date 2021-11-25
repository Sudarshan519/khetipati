import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/widgets/bottom_nav.dart';
import 'package:khetipati/widgets/items.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: AppColors.mainGreen,
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.mainGreen,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Orders',
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
            body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: 558,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 34,
                              child: TabBar(
                                tabs: [
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        'All orders',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        'Delivered',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        'Pending',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: FittedBox(
                                      child: Text(
                                        'Process',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.zero,
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              child: TabBarView(
                                children: [
                                  ListView(
                                    children: [
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Processing',
                                          Color.fromRGBO(135, 194, 65, 0.2)),
                                      Divider(),
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Cancelled',
                                          Color.fromRGBO(227, 53, 53, 0.2)),
                                      Divider(),
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Cancelled',
                                          Color.fromRGBO(227, 53, 53, 0.2)),
                                    ],
                                  ),
                                  ListView(
                                    children: [
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Delivered',
                                          Color.fromRGBO(135, 194, 65, 0.2)),
                                      Divider(),
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Delivered',
                                          Color.fromRGBO(135, 194, 65, 0.2))
                                    ],
                                  ),
                                  ListView(
                                    children: [
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Pending',
                                          Color.fromRGBO(135, 194, 65, 0.2)),
                                      Divider(),
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Pending',
                                          Color.fromRGBO(135, 194, 65, 0.2))
                                    ],
                                  ),
                                  ListView(
                                    children: [
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Processing',
                                          Color.fromRGBO(135, 194, 65, 0.2)),
                                      Divider(),
                                      OrderItems(
                                          'assets/images/items/grapes.png',
                                          'Cherry',
                                          'Processing',
                                          Color.fromRGBO(135, 194, 65, 0.2))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
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
                  //Image.asset('assets/icons/dot.png')
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
                    'assets/icons/orderselected.png',
                    color: AppColors.mainGreen,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
                  Image.asset('assets/icons/dot.png')
                  // Text(
                  //   'Order',
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
                    'assets/icons/notification.png',
                    color: Colors.grey[800],
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
                    'assets/icons/user.png',
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )));
  }

  Widget OrderItems(WishlistItemImg, itemName, title, LabelColor) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 130,
            height: 88,
            child: Image.asset(
              WishlistItemImg,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                itemName,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 26,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textblack),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Rs. 250',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGreen),
              ),
            ],
          ),
          // Flexible(
          //   child: SizedBox(
          //     width: 309,
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              labels(title, LabelColor),
              SizedBox(
                height: 30,
              ),
              FittedBox(
                child: Text(
                  '23 hrs ago',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget labels(title, LabelColor) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: Container(
          //width: 50,
          // height: 22,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: LabelColor),
          child: Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColors.textGreen,
                      fontSize: MediaQuery.of(context).size.width / 30,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
