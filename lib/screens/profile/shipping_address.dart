import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/profile/add_shipping_address.dart';
import 'package:khetipati/screens/profile/profile.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shipping Address',
          style: TextStyle(
              fontSize: getFont(22),
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: 815,
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 18, left: 18, bottom: 20),
                child: Container(
                  width: 378,
                  //  height: 650,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06,
                            bottom: 20),
                        child: Text(
                          'Default Shipping Address',
                          style: TextStyle(
                              fontSize: getFont(16),
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      address('Home'),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20,
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06),
                        child: Text(
                          'Work Addresses',
                          style: TextStyle(
                              fontSize: getFont(16),
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //EditShipping('Work'),
                      address('Work'),
                      SizedBox(
                        height: getHeight(12),
                      ),
                      address("Work 2"),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20,
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.06),
                        child: Text(
                          'Other Addresses',
                          style: TextStyle(
                              fontSize: getFont(16),
                              color: AppColors.textblack,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //  EditShipping('Home'),
                      address('Home'),
                      SizedBox(
                        height: getHeight(12),
                      ),
                      address('Home'),
                      SizedBox(
                        height: getHeight(12),
                      ),
                      address('Home'),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 34, top: 30, bottom: 30),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddShippingAddress()),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 19,
                                width: 19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(2, 95, 51, 0.2),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: AppColors.textGreen,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: getWidth(10),
                              ),
                              Text(
                                'Add New Address',
                                style: TextStyle(
                                    fontSize: getWidth(16),
                                    color: AppColors.textGreen,
                                    fontWeight: FontWeight.w400),
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
                height: getHeight(30),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget address(shippingAddress) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SizedBox(
        //height: getHeight(80),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.home_outlined,
                  size: 20,
                  color: AppColors.mainGreen,
                ),
                SizedBox(
                  width: getWidth(15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shippingAddress,
                      style: TextStyle(
                          fontSize: getFont(15),
                          color: AppColors.textblack,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(8),
                    ),
                    Text(
                      'Shankhaul Marga,\nKathmandu 44600',
                      style: TextStyle(
                          fontSize: getFont(14),
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 42,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color.fromRGBO(135, 194, 65, 0.2)),
                  child: Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          color: AppColors.textGreen,
                          fontSize: getFont(14),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
