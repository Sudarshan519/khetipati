import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final ScrollController controller = ScrollController();
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
            title: const Text(
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
                icon: const Icon(Icons.arrow_back_ios_rounded,
                    size: 20, color: AppColors.textGreen)),
          ),
          body: SingleChildScrollView(
            controller: controller,
            child: Container(
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
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
                            height: SizeConfigs.screenHeight * .5,
                            width: MediaQuery.of(context).size.width,
                            child: TabBarView(
                              children: [
                                ListView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  controller: controller,
                                  children: [
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Processing',
                                        Color.fromRGBO(135, 194, 65, 0.2)),
                                    const Divider(),
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Cancelled',
                                        Color.fromRGBO(227, 53, 53, 0.2)),
                                    const Divider(),
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Cancelled',
                                        const Color.fromRGBO(227, 53, 53, 0.2)),
                                  ],
                                ),
                                ListView(
                                  controller: controller,
                                  children: [
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Delivered',
                                        const Color.fromRGBO(
                                            135, 194, 65, 0.2)),
                                    const Divider(),
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Delivered',
                                        const Color.fromRGBO(135, 194, 65, 0.2))
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
                                        const Color.fromRGBO(
                                            135, 194, 65, 0.2)),
                                    Divider(),
                                    OrderItems(
                                        'assets/images/items/grapes.png',
                                        'Cherry',
                                        'Processing',
                                        const Color.fromRGBO(135, 194, 65, 0.2))
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
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 31),
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
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SizedBox(
                              width: 20,
                            ),
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
        ));
  }

  Widget OrderItems(WishlistItemImg, itemName, title, LabelColor) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
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
              const SizedBox(
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
