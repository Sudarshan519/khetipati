// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:khetipati/constant/colors.dart';
// import 'package:khetipati/constant/constant.dart';
// import 'package:khetipati/constant/size_config.dart';
// import 'package:khetipati/controllers/home_controller.dart';
// import 'package:khetipati/models/product.dart';
// import 'package:khetipati/screens/orders/widgets/order_item_card.dart';
// import 'package:khetipati/widgets/app_bar.dart';
// import 'package:khetipati/widgets/product_card.dart';
// import 'package:khetipati/widgets/recommended_items_card.dart';

// class Orders extends StatefulWidget {
//   const Orders({Key? key}) : super(key: key);

//   @override
//   _OrdersState createState() => _OrdersState();
// }

// class _OrdersState extends State<Orders> {
//   final controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: AppColors.mainGreen,
//         appBar: buildAppBar(context, 'Orders'),
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             //height: MediaQuery.of(context).size.height,
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
//                 recommendedItemsCard(),
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
//     return Column(
//       children: [
//         Row(children: [
//           Text("All Orders"),
//           Text("All Orders"),
//           Text("All Orders"),
//         ])
//       ],
//     );
//     //   return Container(
//     //     width: getWidth(378),
//     //     margin: EdgeInsets.fromLTRB(getWidth(20), getHeight(26), getWidth(20), 0),
//     //     // height: 558,
//     //     decoration: BoxDecoration(
//     //         color: Colors.white, borderRadius: BorderRadius.circular(10)),
//     //     child: Column(
//     //       children: [
//     //         SizedBox(
//     //           width: MediaQuery.of(context).size.width,
//     //           //   height: getHeight(40),
//     //           child: TabBar(
//     //             tabs: [
//     //               Tab(
//     //                 child: Text(
//     //                   'All orders',
//     //                   style: TextStyle(
//     //                       fontSize: getFont(14),
//     //                       color: Colors.green[900],
//     //                       fontWeight: FontWeight.w500),
//     //                 ),
//     //               ),
//     //               Tab(
//     //                 child: Text(
//     //                   'Delivered',
//     //                   style: TextStyle(
//     //                       fontSize: getFont(14),
//     //                       color: Colors.green[900],
//     //                       fontWeight: FontWeight.w500),
//     //                 ),
//     //               ),
//     //               Tab(
//     //                 child: Text(
//     //                   'Pending',
//     //                   style: TextStyle(
//     //                       fontSize: getFont(14),
//     //                       color: Colors.green[900],
//     //                       fontWeight: FontWeight.w500),
//     //                 ),
//     //               ),
//     //               Tab(
//     //                 child: Text(
//     //                   'Process',
//     //                   style: TextStyle(
//     //                       fontSize: getFont(14),
//     //                       color: Colors.green[900],
//     //                       fontWeight: FontWeight.w500),
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //         ),
//     //         Container(
//     //           margin: EdgeInsets.zero,
//     //           height: 1000,
//     //           width: MediaQuery.of(context).size.width,
//     //           child: TabBarView(
//     //             children: [
//     //               buildOrderItems(),
//     //               ListView(
//     //                 children: [buildOrderItems()],
//     //               ),
//     //               ListView(
//     //                 children: [buildOrderItems()],
//     //               ),
//     //               ListView(
//     //                 children: [buildOrderItems()],
//     //               )
//     //             ],
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   );
//   }

//   buildOrderItems() {
//     return Obx(() => controller.products.isEmpty
//         ? const Center(child: Text("Empty"))
//         : SingleChildScrollView(
//             child: Column(
//               children: List.generate(controller.products.length,
//                   (i) => orderItemCard(controller.products[i])),
//             ),
//           ));
//   }
// }

import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
