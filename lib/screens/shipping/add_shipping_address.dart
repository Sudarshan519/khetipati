import 'dart:async';

import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:khetipati/theme.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  _AddShippingAddressState createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: buildAppBar(context, 'Add Shipping Address'),
      body: SingleChildScrollView(
        child: buildMap(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: getWidth(30)),
        //height: ,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 2,
              width: 58,
              color: Colors.grey[600],
            ),
            const SizedBox(
              height: 10,
            ),
            const MyInputField(hint: 'address'),
            const SizedBox(
              height: 10,
            ),
            const MyInputField(
                hint: 'Select or insert a label for this address'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                labels('Work'),
                labels('Home'),
                labels('Hospital'),
                labels('Education')
              ],
            ),
            SizedBox(
              height: getHeight(30),
            ),
            buildEditShippingInfoCard(),
            buildRadioButton(),
            buildSaveAddressButton(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget labels(title) {
    return Flexible(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            //width: 50,
            height: 22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromRGBO(135, 194, 65, 0.2)),
            child: Center(
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
    );
  }

  buildEditShippingInfoCard() {
    return Container(
      height: getHeight(96),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(135, 194, 65, 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
                height: getHeight(58),
                width: getWidth(58),
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.contain,
                )),
          ),
          SizedBox(
            width: getWidth(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Howard Wollowitz",
                style: robototitleStyle.copyWith(
                    fontSize: getFont(16),
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "9810101010",
                style: archivotitleStyle.copyWith(
                    fontSize: getFont(14),
                    color: Colors.green[900],
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            width: getWidth(80),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                _settingModalBottomSheet(context);
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                child: Icon(
                  Icons.edit,
                  color: AppColors.textGreen,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildMap() {
    return SizedBox(
        height: getHeight(500),
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.hybrid,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )

        // Image.asset(
        //   'assets/images/map.png',
        //   fit: BoxFit.fitHeight,
        // ),
        );
  }

  buildRadioButton() {
    return Row(
      children: [
        const Checkbox(value: false, onChanged: null),
        Text(
          'Make Default Address',
          style: archivotitleStyle.copyWith(
              fontSize: getFont(15), color: const Color.fromRGBO(0, 0, 0, 0.5)),
        )
      ],
    );
  }

  buildSaveAddressButton() {
    return SizedBox(
      width: double.infinity,
      height: getHeight(48),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: AppColors.mainGreen,
        onPressed: () {},
        child: Text(
          'Save Address',
          style: robototitleStyle.copyWith(
              color: Colors.white,
              fontSize: getFont(16),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      builder: (BuildContext bc) {
        return Container(
          margin: EdgeInsets.symmetric(
              horizontal: getWidth(30), vertical: getWidth(30)),
          child: Wrap(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Edit shipping information.',
                    style: archivotitleStyle.copyWith(
                        color: Colors.black,
                        fontSize: getFont(18),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: getHeight(15)),
                  const MyInputField(hint: 'Full Name'),
                  SizedBox(
                    height: getHeight(15),
                  ),
                  const MyInputField(hint: 'Phone Number'),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  ButtonTheme(
                    minWidth: getWidth(200),
                    height: getHeight(48),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: AppColors.mainGreen,
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Change',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getFont(15),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      });
}
