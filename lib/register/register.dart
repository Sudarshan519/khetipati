import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/app_button.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import '../screens/login/login.dart';
import 'package:khetipati/constant/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar(context, 'Registration'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [boxShadow()],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      'Login Details',
                      style: TextStyle(
                          fontSize: getFont(20),
                          color: AppColors.mainGreen,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Enter your email or phone number ',
                        const Icon(
                          Icons.email_sharp,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Create new password',
                        const Icon(
                          Icons.vpn_key,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Confirm password',
                        const Icon(
                          Icons.vpn_key,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(30),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [boxShadow()],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: getHeight(20),
                    ),
                    Text(
                      'Profile Details',
                      style: TextStyle(
                          fontSize: getFont(20),
                          color: AppColors.mainGreen,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Username',
                        const Icon(
                          Icons.person,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Phone Number',
                        const Icon(
                          Icons.phone_in_talk_rounded,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'City',
                        const Icon(
                          Icons.location_city,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'District',
                        const Icon(
                          Icons.location_on,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'State',
                        const Icon(
                          Icons.home,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    inputTextFormField(
                        'Country',
                        const Icon(
                          Icons.location_city,
                          size: 20,
                        )),
                    SizedBox(
                      height: getHeight(20),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: getFont(45),
                width: getFont(352),
                child: MyButton(
                    onTap: () {
                      Get.to(() => HomeScreen());
                    },
                    label: "Submit"),
              ),
              SizedBox(
                height: getHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(
                        fontSize: getFont(12),
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(0, 0, 0, 0.5)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: getFont(12),
                            fontWeight: FontWeight.w400,
                            color: AppColors.mainGreen,
                            decoration: TextDecoration.underline),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  inputTextFormField(labels, Icon textfieldicon) {
    return Container(
      height: getFont(45),
      width: getFont(352),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: textfieldicon,
            labelText: labels,
            //hintText: "Full Name",
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              // borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 2, color: AppColors.mainGreen),
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
