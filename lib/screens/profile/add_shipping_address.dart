import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/cart/cart.dart';
import 'package:khetipati/screens/profile/shipping_address.dart';
import 'package:khetipati/screens/profile/profile.dart';
import 'package:khetipati/widgets/bottom_nav.dart';

class AddShippingAddress extends StatefulWidget {
  const AddShippingAddress({Key? key}) : super(key: key);

  @override
  _AddShippingAddressState createState() => _AddShippingAddressState();
}

class _AddShippingAddressState extends State<AddShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGrey,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'Add Shipping Address',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShippingAddress()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    color: AppColors.mainGrey,
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Container(
                        child: Column(
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
                            stylishTextFormField('Address'),
                            const SizedBox(
                              height: 10,
                            ),
                            stylishTextFormField(
                                'Select or insert a label for this address'),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 30, right: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  labels('Work'),
                                  labels('Home'),
                                  labels('Hospital'),
                                  labels('Education')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30),
                              child: Container(
                                height: 96,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(135, 194, 65, 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                          height: 58,
                                          width: 58,
                                          child: Image.asset(
                                            'assets/images/profile.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Howard Wollowitz",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "9810101010",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const Flexible(
                                        child: SizedBox(
                                      width: 80,
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                _buildPopupDialog(context),
                                          );
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Icon(
                                            Icons.edit,
                                            color: AppColors.textGreen,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                children: [
                                  const Checkbox(value: false, onChanged: null),
                                  const Text('Make Default Address')
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 30, left: 30),
                              child: SizedBox(
                                width: 378,
                                height: 48,
                                child: RaisedButton(
                                  color: AppColors.mainGreen,
                                  onPressed: () {},
                                  child: const Text(
                                    'Save Address',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget stylishTextFormField(Labels) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: Labels,
            //hintText: "Full Name",
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              // borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(0),
            )),
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

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      title: const Text(
        'Edit shipping information',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          stylishTextFormField('Full Name'),
          const SizedBox(
            height: 15,
          ),
          stylishTextFormField('Phone Number'),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ButtonTheme(
              minWidth: 200,
              height: 48,
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: AppColors.mainGreen,
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'Change',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
    // Container(width: 414, height: 416, color: Colors.white);
  }
}
