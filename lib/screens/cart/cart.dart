import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/cart.dart';
import 'package:khetipati/screens/cart/Checkout.dart';
import 'package:khetipati/widgets/bottom_nav.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 815,
              decoration: BoxDecoration(
                color: AppColors.mainGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCartItems(),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Container(
                        // width: 378,
                        // height: 525,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            // OrderItems(
                            //   'assets/images/items/tomatoes.png',
                            //   'Tomatoes',
                            // ),
                            // Divider(),
                            // OrderItems(
                            //     'assets/images/items/melons.png', 'Melons'),
                            // OrderItems(
                            //   'assets/images/items/tomatoes.png',
                            //   'Tomatoes',
                            // ),
                            Divider(),
                            Container(
                              height: 73,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: FittedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Total Amount',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              controller.getTotalPrice(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.textGreen),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        width: 52,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 41,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Checkout()),
                                          );
                                        },
                                        color: AppColors.mainGreen,
                                        child: FittedBox(
                                          child: Text(
                                            'Proceed To Checkout',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //     style: ButtonStyle(
                                    //       backgroundColor:
                                    //           MaterialStateProperty.all(Colors.lightGreen),
                                    //       padding: MaterialStateProperty.all(
                                    //           EdgeInsets.fromLTRB(33, 25, 33, 25)),
                                    //     ),
                                    //     onPressed: null,
                                    //     child: Text(
                                    //       'Add To Cart',
                                    //       style: TextStyle(color: Colors.white, fontSize: 20),
                                    //     ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Text(
                              "Recommended items",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[900]),
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.green[900]),
                            ),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => CategotyItems()),
                              // );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 20),
                          // Items(context, 'Cherry',
                          //     'assets/images/items/grapes.png'),
                          // Items(context, 'Tomatoes',
                          //     'assets/images/items/melons.png'),
                          // Items(context, 'Cherry',
                          //     'assets/images/items/tomatoes.png'),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
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
      // bottomNavigationBar: BottomNav(
      //   context,
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset('assets/icons/home.png', color: Colors.grey[700]),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.009,
      //       ),
      //       // Image.asset('assets/icons/dot.png')
      //       Text(
      //         'Home',
      //         style: TextStyle(
      //             color: Color.fromRGBO(0, 0, 0, 0.8),
      //             fontSize: 12,
      //             fontWeight: FontWeight.w400),
      //       )
      //     ],
      //   ),
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/icons/navorder.png',
      //         color: Colors.grey[800],
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.009,
      //       ),
      //       Text(
      //         'Order',
      //         style: TextStyle(
      //             color: Color.fromRGBO(0, 0, 0, 0.8),
      //             fontSize: 12,
      //             fontWeight: FontWeight.w400),
      //       )
      //     ],
      //   ),
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/icons/notification.png',
      //         color: Colors.grey[800],
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.009,
      //       ),
      //       Text(
      //         'Notification',
      //         style: TextStyle(
      //             color: Color.fromRGBO(0, 0, 0, 0.8),
      //             fontSize: 12,
      //             fontWeight: FontWeight.w400),
      //       )
      //     ],
      //   ),
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         'assets/icons/user.png',
      //         color: Colors.grey[800],
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.009,
      //       ),
      //       Text(
      //         'Profile',
      //         style: TextStyle(
      //             color: Color.fromRGBO(0, 0, 0, 0.8),
      //             fontSize: 12,
      //             fontWeight: FontWeight.w400),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Widget OrderItems(
    CartModel item,
  ) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print("working on remove");
                  controller.removeFromCart(item);
                },
                child: Icon(
                  Icons.close_rounded,
                  size: 18,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
              Container(
                width: 130,
                height: 88,
                child: Image.asset(
                  'assets/images/items/tomatoes.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.productName.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textblack),
              ),
              Text(
                '100 kcal',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textblack),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                item.price.toString(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Container(
                  width: 42,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.mainGrey),
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                      onTap: () {
                        print("add to cart");
                        controller.addToCart(item);
                      },
                      child: const Icon(Icons.add)),
                ),
              ),
              FittedBox(
                child: Container(
                    width: 42,
                    height: 32,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColors.mainGreen),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ))),
              ),
              FittedBox(
                child: Container(
                  width: 42,
                  height: 32,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.mainGrey),
                      borderRadius: BorderRadius.circular(4)),
                  child: InkWell(
                      onTap: () {
                        print("remove");
                        controller.removeFromCart(item);
                      },
                      child: const Icon(Icons.remove)),
                ),
              ),
            ],
          )
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

  _buildCartItems() {
    return Obx(() => Column(
          children: List.generate(
            controller.cart.length,
            (index) => SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print("working on remove");
                          controller.removeFromCart(controller.cart[index]);
                        },
                        child: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        height: 88,
                        child: Image.network(
                          controller.cart[index].image.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.cart[index].productName.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textblack),
                      ),
                      const Text(
                        '100 kcal',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textblack),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        controller.cart[index].price.toString(),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Container(
                          width: 42,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: AppColors.mainGrey),
                              borderRadius: BorderRadius.circular(4)),
                          child: InkWell(
                              onTap: () {
                                print("add to cart");
                                controller.addToCart(controller.cart[index]);
                              },
                              child: const Icon(Icons.add)),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                            width: 42,
                            height: 32,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.mainGreen),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: InkWell(
                              onTap: () {
                                print(controller.cart[index].quantity);
                              },
                              child: Obx(
                                () => Text(
                                  controller.cart[index].quantity.toString(),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ))),
                      ),
                      FittedBox(
                        child: Container(
                          width: 42,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: AppColors.mainGrey),
                              borderRadius: BorderRadius.circular(4)),
                          child: InkWell(
                              onTap: () {
                                print("remove");
                                controller
                                    .removeFromCart(controller.cart[index]);
                              },
                              child: const Icon(Icons.remove)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
