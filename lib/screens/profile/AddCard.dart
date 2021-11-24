import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/screens/profile/payment.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool value = false;
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
          'Payment',
          style: TextStyle(
              fontSize: 22,
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 815,
          decoration: BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Creditcard(),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04,
                    top: 20),
                child: Container(
                  // width: 378,
                  height: 319,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardDetails('Card Number'),
                      CardDetails('Name on card'),
                      CardDetails('Expiration Date'),
                      MergeSemantics(
                        child: ListTile(
                          title: const Text('Save this card'),
                          leading: CupertinoSwitch(
                            value: value,
                            onChanged: (v) => setState(() => value = v),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 30,
                    right: MediaQuery.of(context).size.width * 0.04,
                    left: MediaQuery.of(context).size.width * 0.04),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: RaisedButton(
                    color: AppColors.mainGreen,
                    onPressed: () {},
                    child: Text(
                      'Add Card',
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
    );
  }

  Widget Creditcard() {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          right: MediaQuery.of(context).size.width * 0.04,
          left: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 63),
              child: Text(
                'Credit/Debit Card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 73, left: 50),
            //   child: Container(
            //     height: 97,
            //     width: 238 + 22 + 22,
            //     decoration: BoxDecoration(
            //         color: Color.fromRGBO(58, 58, 58, 0.61),
            //         borderRadius: BorderRadius.circular(10)),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 25, left: 63),
                  //   child: Text(
                  //     'Credit/Debit Card',
                  //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //         left: MediaQuery.of(context).size.width * 0.08,
                  //         right: MediaQuery.of(context).size.width * 0.08,
                  //         top: 30),
                  //     child: Container(
                  //       height: MediaQuery.of(context).size.height * 0.1,
                  //       width: 238 + 22 + 22,
                  //       decoration: BoxDecoration(
                  //           color: Color.fromRGBO(58, 58, 58, 0.61),
                  //           borderRadius: BorderRadius.circular(10)),
                  //     ),
                  //   ),
                  // ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09,
                          right: MediaQuery.of(context).size.width * 0.09,
                          top: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color.fromRGBO(36, 36, 36, 1),
                              Color.fromRGBO(67, 67, 67, 1),
                              Color.fromRGBO(92, 92, 92, 1)
                            ],
                            stops: const [0, 0.5, 1],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Credit Card',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  // Stack(
                                  //   children: [
                                  //     Container(
                                  //       height: 30,
                                  //       width: 30,
                                  //       decoration: BoxDecoration(
                                  //           color: Colors.red.withOpacity(0.9),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20)),
                                  //     ),
                                  //     Container(
                                  //       height: 30,
                                  //       width: 30,
                                  //       decoration: BoxDecoration(
                                  //           color:
                                  //               Colors.orange.withOpacity(0.9),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20)),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                            Text(
                              '000 0101 1010',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Card Holder\n Barney Stayye',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Expires\n12/24',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardDetails(DetailName) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DetailName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
