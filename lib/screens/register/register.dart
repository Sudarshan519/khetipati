import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/registercontroller.dart';
import 'package:khetipati/screens/login/login.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/app_button.dart';
import 'package:khetipati/screens/widgets/box_shadow.dart';
import 'package:khetipati/constant/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Get.put(RegisterController());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Registration'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.mainGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Form(
            key: _formkey,
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
                      InputTextFormField(
                        labels: 'Enter your email',
                        textfieldicon: const Icon(
                          Icons.email_sharp,
                          size: 20,
                        ),
                        controller: controller.email,
                        // validator: (value) {
                        //   validateEmail(string: value);
                        // }
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      InputTextFormField(
                        labels: 'Create new password',
                        textfieldicon: const Icon(
                          Icons.vpn_key,
                          size: 20,
                        ),
                        controller: controller.password,
                        // validator: (v) {
                        //   validatePassword(string: v);
                        // }
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      InputTextFormField(
                        labels: 'Confirm password',
                        textfieldicon: const Icon(
                          Icons.vpn_key,
                          size: 20,
                        ),
                        controller: controller.passwordConfirm,
                        // validator: (v) {
                        //   validatePassword(string: v);
                        // }
                      ),
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
                      InputTextFormField(
                        labels: 'Firstname',
                        textfieldicon: const Icon(
                          Icons.person,
                          size: 20,
                        ),
                        controller: controller.firstname,
                        // validator: (v) {
                        //   validateIsEmpty(string: v);
                        // }
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      InputTextFormField(
                        labels: 'Lastname',
                        textfieldicon: const Icon(
                          Icons.person,
                          size: 20,
                        ),
                        controller: controller.lastname,
                        // validator: (v) {
                        //   validateIsEmpty(string: v);
                        // }
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      InputTextFormField(
                        labels: 'Phone Number',
                        textfieldicon: const Icon(
                          Icons.phone_in_talk_rounded,
                          size: 20,
                        ),
                        controller: controller.phone,
                        // validator: (v) {
                        //   validateMinLength(string: v, length: 10);
                        // },
                      ),
                      SizedBox(
                        height: getHeight(20),
                      ),
                      //  const   InputTextFormField(
                      //       labels: 'City',
                      //       textfieldicon:  Icon(
                      //         Icons.location_city,
                      //         size: 20,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: getHeight(20),
                      //     ),
                      //  const   InputTextFormField(
                      //       labels: 'District',
                      //       textfieldicon:  Icon(
                      //         Icons.location_on,
                      //         size: 20,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: getHeight(20),
                      //     ),
                      //   const  InputTextFormField(
                      //       labels: 'State',
                      //       textfieldicon:  Icon(
                      //         Icons.home,
                      //         size: 20,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: getHeight(20),
                      //     ),
                      //    const InputTextFormField(
                      //       labels: 'Country',
                      //       textfieldicon:  Icon(
                      //         Icons.location_city,
                      //         size: 20,
                      //       ),
                      //     ),
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
                        // if (_formkey.currentState!.validate()) {
                        //   controller.register();
                        // }
                        // return;

                        controller.register();
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
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
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
      ),
    );
  }

  // inputTextFormField(labels, Icon textfieldicon, controller, validator) {
  //   return SizedBox(
  //     height: getFont(45),
  //     width: getFont(352),
  //     child: TextFormField(
  //       controller: controller,
  //       validator: validator,
  //       decoration: InputDecoration(
  //           prefixIcon: textfieldicon,
  //           labelText: labels,
  //           //hintText: "Full Name",
  //           enabledBorder: const OutlineInputBorder(
  //             borderSide:
  //                 BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
  //             // borderRadius: BorderRadius.circular(15),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide:
  //                 const BorderSide(width: 2, color: AppColors.mainGreen),
  //             borderRadius: BorderRadius.circular(5),
  //           )),
  //     ),
  //   );
  // }
}

class InputTextFormField extends StatelessWidget {
  const InputTextFormField({
    Key? key,
    this.labels,
    this.textfieldicon,
    this.controller,
    // this.validator
  }) : super(key: key);
  final String? labels;
  final Icon? textfieldicon;
  final TextEditingController? controller;
  // final validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getFont(45),
      width: getFont(352),
      child: TextFormField(
        controller: controller,
        // validator: validator,
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
