import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/shipping/add_shipping_address.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/screens/widgets/divider.dart';

import '../../theme.dart';

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
      appBar: buildAppBar(context, 'Shipping Address'),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 815,
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Container(
                // width: 378,
                margin: EdgeInsets.symmetric(
                    horizontal: getWidth(18), vertical: getHeight(26)),
                padding: EdgeInsets.symmetric(
                    horizontal: getWidth(25), vertical: getHeight(17)),
                //  height: 650,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [boxShadow()],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Default Shipping Address',
                      style: archivotitleStyle.copyWith(
                          fontSize: getFont(16),
                          color: AppColors.textblack,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),

                    buildAddress('Home'),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    Text(
                      'Work Addresses',
                      style: TextStyle(
                          fontSize: getFont(16),
                          color: AppColors.textblack,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    //EditShipping('Work'),
                    buildAddress('Work'),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    buildAddress("Work 2"),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    divider(),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    Text(
                      'Other Addresses',
                      style: TextStyle(
                          fontSize: getFont(16),
                          color: AppColors.textblack,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    //  EditShipping('Home'),
                    buildAddress('Home'),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    buildAddress('Home'),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    buildAddress('Home'),
                    SizedBox(
                      height: getHeight(30),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddShippingAddress()),
                        );
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(2, 95, 51, 0.2),
                            radius: 10,
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
                            style: archivotitleStyle.copyWith(
                                fontSize: getWidth(16),
                                color: AppColors.textGreen,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )
                  ],
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

  Widget buildAddress(shippingAddress) {
    return SizedBox(
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
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(15),
                        color: AppColors.textblack,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: getHeight(8),
                  ),
                  Text(
                    'Shankhaul Marga,\nKathmandu 44600',
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(14),
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
          Container(
            width: getWidth(42),
            height: getHeight(22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromRGBO(135, 194, 65, 0.2)),
            child: Center(
              child: Text(
                'Edit',
                style: archivotitleStyle.copyWith(
                    color: AppColors.textGreen,
                    fontSize: getFont(14),
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
