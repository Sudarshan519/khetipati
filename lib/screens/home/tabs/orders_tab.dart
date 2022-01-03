import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/order_controller.dart';
import 'package:khetipati/widgets/app_bar.dart';
// class OrdersTab extends StatefulWidget {
//   const OrdersTab({Key? key}) : super(key: key);

//   @override
//   _OrdersTabState createState() => _OrdersTabState();
// }

// class _OrdersTabState extends State<OrdersTab>
//     with AutomaticKeepAliveClientMixin {
//   final controller = Get.put(HomeController());
//   final innerScrollcontroller = ScrollController();
//   final outerScrolLController = ScrollController();
//   bool innerBoxIsScrolled = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     outerScrolLController.addListener(() {
//       if (outerScrolLController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         setState(() {
//           innerBoxIsScrolled = true;
//         });
//         print(innerBoxIsScrolled);
//         print("state changed");
//         // innerBoxIsScrolled = false;
//       }
//     });
//     innerScrollcontroller.addListener(() {
//       print("listen scroll");
//       if (innerScrollcontroller.offset >=
//           innerScrollcontroller.position.maxScrollExtent) {
//         setState(() {
//           print(innerScrollcontroller.offset);
//           print(innerScrollcontroller.position.maxScrollExtent);
//           innerBoxIsScrolled = false;
//           print("state changed");
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: AppColors.mainGreen,
//         appBar: buildAppBar(context, 'Orders'),
//         body: SingleChildScrollView(
//           controller: outerScrolLController,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(30),
//                 topLeft: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               children: [
//                 orderContainer(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [recommendedItemsCard()],
//                 ),
//                 SizedBox(
//                   height: getHeight(40),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   orderContainer() {
//     return Container(
//       width: getWidth(378),
//       margin: EdgeInsets.fromLTRB(getWidth(20), getHeight(26), getWidth(20), 0),
//       // height: 558,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             // child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //     children: [
//             //       Text("All Orders"),
//             //       Text("All Orders"),
//             //       Text("All Orders"),
//             //       Text("All Orders"),
//             //     ])
//             // height: getHeight(40),
//             child: TabBar(
//               indicatorPadding: EdgeInsets.only(top: getHeight(10)),
//               indicatorSize: TabBarIndicatorSize.label,
//               isScrollable: false,
//               unselectedLabelColor: Colors.black,
//               labelColor: AppColors.textGreen,
//               labelStyle: archivotitleStyle.copyWith(fontSize: getFont(14)),
//               labelPadding: EdgeInsets.zero,
//               tabs: const [
//                 Tab(
//                   text: 'All orders',
//                 ),
//                 Tab(
//                   text: 'Delivered',
//                 ),
//                 Tab(
//                   text: 'Pending',
//                 ),
//                 Tab(
//                   text: 'Process',
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.zero,
//             height: MediaQuery.of(context).size.height * .6,
//             width: MediaQuery.of(context).size.width,
//             child: TabBarView(
//               children: [
//                 buildOrderItems(),
//                 buildOrderItems(),
//                 buildOrderItems(),
//                 buildOrderItems()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   buildOrderItems() {
//     return Obx(() => controller.products.isEmpty
//         ? const Center(child: Text("Empty"))
//         : SingleChildScrollView(
//             physics: innerBoxIsScrolled
//                 ? BouncingScrollPhysics()
//                 : NeverScrollableScrollPhysics(),
//             controller: innerScrollcontroller,
//             child: Column(
//               children: List.generate(
//                   10, (i) => orderItemCard(controller.products[0])),
//             ),
//           ));
//   }

//   @override
//   bool get wantKeepAlive => true;
// }

class Orders extends StatelessWidget {
  Orders({Key? key}) : super(key: key);
  final controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromRGBO(234, 238, 238, 1),
      color: AppColors.mainGreen,
      child: Column(
        children: [
          buildAppBar(context, 'Orders'),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(234, 238, 238, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                                children: List.generate(
                              tabs.length,
                              (index) => Expanded(
                                  child: InkWell(
                                onTap: () {
                                  controller.updateIndex(index);
                                },
                                child: Obx(
                                  () => Column(
                                    children: [
                                      Text(
                                        tabs[index],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 1,
                                          color: index ==
                                                  controller.selectedTab.value
                                              ? Colors.green
                                              : Colors.white)
                                    ],
                                  ),
                                ),
                              )),
                            )),
                          ),
                          ...List.generate(
                            10,
                            (index) => TabItem(islast: index == 9),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 43,
                    ),
                    RecommendedItems(),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({Key? key, this.islast = false}) : super(key: key);
  final bool islast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: islast
              ? null
              : Border(bottom: BorderSide(color: Colors.grey, width: 1))),
      child: Row(children: [
        Container(
            color: Colors.green, width: 139, height: 99, child: FlutterLogo()),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Cherry",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rs. 250",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Processing",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "23 hrs ago",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            )
          ],
        ),
      ]),
    );
  }
}

class RecommendedItems extends StatelessWidget {
  const RecommendedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Text(
                  "Recommended Items",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Spacer(),
                Text(
                  "See All",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            height: 191,
            // margin: const EdgeInsets.only(left: 30),
            child: ListView.builder(
                // padding: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 149,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 149,
                          child: Stack(
                            children: const [
                              Positioned(
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 14,
                                  child: Icon(Icons.favorite,
                                      color: Colors.white, size: 14),
                                ),
                                left: 12,
                                top: 12,
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: FlutterLogo()),
                            ],
                          ),
                        ),
                        Container(
                            height: 90,
                            width: 149,
                            padding: const EdgeInsets.only(
                                left: 12.0, bottom: 16, right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Tomatore",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Spacer(),
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text("4.5")
                                  ],
                                ),
                                const Text(
                                  "100 kcal",
                                  style: TextStyle(fontSize: 10),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text("Rs. 250"),
                                    const Spacer(),
                                    Container(
                                      height: 30,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.green.withOpacity(.5)),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    )
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

final tabs = ["All Orders", "Delivering", "Pending", "Processing"];
