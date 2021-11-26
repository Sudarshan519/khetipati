import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/home_controller.dart';
import 'package:khetipati/models/product.dart';
import 'package:khetipati/widgets/items.dart';
import '../home/home.dart';

class Fruits extends StatefulWidget {
  const Fruits({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainGreen,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.mainGreen,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.product.title!,
            style: const TextStyle(
                fontSize: 22,
                color: AppColors.textGreen,
                fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: AppColors.textGreen)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 19, right: 19),
                        child: Container(
                          height: 382,
                          width: 378,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(48, 15, 48, 49),
                                child: Container(
                                  height: 219,
                                  width: 282,
                                  // color: AppColors.mainGrey,
                                  child: Image.network(
                                    widget.product.featureImage!.originalImage!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.product.title!,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rs. ${widget.product.productPrice}/kg',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textGreen),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text('4.5',
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('100 kcal',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.add),
                                        Container(
                                            height: 30,
                                            width: 30,
                                            color: Colors.grey[300],
                                            child: Center(child: Text('1'))),
                                        Icon(Icons.remove),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 19,
                          right: 19,
                          top: 20,
                        ),
                        child: Container(
                          height: 266,
                          width: 378,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                width: 378,
                                height: 55,
                                child: TabBar(
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'Details',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Reviews',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // Flexible(
                              //   child: SizedBox(
                              //     height: 25,
                              //   ),
                              // ),
                              SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.zero,
                                  height: 158,
                                  width: 350,
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, left: 19, right: 19),
                                        child: Text(
                                          // 'The fruit is very rich in vitamin and it lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. lorem dolor.Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. lorem dolor.Lorem Ipsum dolor sit ame...Lorem Ipsum dolor sit amet. Lorem Ipsum dolor sit amet. \n\n* lorem dolor.Lorem Ipsum dolor sit amet. \n* Lorem Ipsum dolor sit amet. lorem dolor.\n* Lorem Ipsum dolor sit ame... ',
                                          widget.product.description.toString(),
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      ListView(
                                        children: [
                                          _Reviews(),
                                          Divider(),
                                          _Reviews()
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                            Text(
                              "See All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.green[900]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        height: 250.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Items(homeController.products[0]),
                            Items(homeController.products[1]),
                            Items(homeController.products[2])
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 94,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Rs. 250',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGreen),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 150,
                  height: 49,
                  child: RaisedButton(
                    onPressed: () {},
                    color: AppColors.mainGreen,
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
      ),
    );
  }

  Widget _Reviews() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 24, right: 13),
                child: Container(
                  width: 35,
                  height: 35,
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 72),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anne'),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 213),
                child: Text(
                  '21st Aug. 2021',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.4)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Container(
            width: 325,
            height: 39,
            child: Text(
              'The frui is very rich in vitamin.Grab the offer before its gone. Grab the offer before its gone. Grab the offer before its gone.',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
          )
        ],
      ),
    );
  }
}
