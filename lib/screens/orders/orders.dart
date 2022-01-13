// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:khetipati/constant/colors.dart';
// import 'package:khetipati/constant/size_config.dart';
// import 'package:khetipati/controllers/home_controller.dart';
// import 'package:khetipati/controllers/order_controller.dart';
// import 'package:khetipati/screens/orders/widgets/order_item_card.dart';
// import 'package:khetipati/screens/widgets/app_bar.dart';
// import 'package:khetipati/screens/widgets/recommended_items_card.dart';

// class Orders extends StatefulWidget {
//   const Orders({Key? key}) : super(key: key);

//   @override
//   _OrdersState createState() => _OrdersState();
// }

// class _OrdersState extends State<Orders> {
//   final controller = Get.put(OrderController());
//   final homecontroller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         backgroundColor: AppColors.mainGreen,
//         appBar: buildAppBar('Orders'),
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
//             //   height: getHeight(40),
//             child: TabBar(
//               tabs: [
//                 Tab(
//                   child: Text(
//                     'All orders',
//                     style: TextStyle(
//                         fontSize: getFont(14),
//                         color: Colors.green[900],
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Delivered',
//                     style: TextStyle(
//                         fontSize: getFont(14),
//                         color: Colors.green[900],
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Pending',
//                     style: TextStyle(
//                         fontSize: getFont(14),
//                         color: Colors.green[900],
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Tab(
//                   child: Text(
//                     'Process',
//                     style: TextStyle(
//                         fontSize: getFont(14),
//                         color: Colors.green[900],
//                         fontWeight: FontWeight.w500),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.zero,
//             height: 1000,
//             width: MediaQuery.of(context).size.width,
//             child: TabBarView(
//               children: [
//                 ListView(
//                   children: [buildOrderItems()],
//                 ),
//                 ListView(
//                   children: [buildOrderItems()],
//                 ),
//                 ListView(
//                   children: [buildOrderItems()],
//                 ),
//                 ListView(
//                   children: [buildOrderItems()],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   buildOrderItems() {
//     return Obx(() => controller.orderlist.isNotEmpty
//         ? const Center(child: Text("Empty"))
//         : Column(
//             children: List.generate(homecontroller.products.length,
//                 (i) => orderItemCard(homecontroller.products[i])),
//           ));
//   }
// }
