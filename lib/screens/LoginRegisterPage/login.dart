import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/auth.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/utils/validators.dart';
import 'package:khetipati/widgets/clipper.dart';
import 'register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final password = TextEditingController();
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: AppColors.mainGreen,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Image.asset(
                        "assets/images/applogo.png",
                        height: 200,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainGreen),
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      email: email,
                      icon: Icons.email,
                      validator: (email) => validateEmail(string: email),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    InputField(
                      icon: Icons.password,
                      email: password,
                      validator: (pass) => validatePassword(string: pass),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 0.5)),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.to(Home());
                          // if (_formKey.currentState!.validate()) {
                          print("loggin in");
                          authController.loginWithEmail();
                          if (authController.authState.value ==
                              AuthState.Authenticated) {
                            print("navigating to home");
                            Get.to(Home());
                          } else {}
                          // }
                          // if (formKey.currentState!.validate()) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => Home()),
                          //   );
                          // }
                        },
                        child: Obx(
                          () => authController.authState.value ==
                                  AuthState.Authenticating
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(135, 194, 65, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member yet?',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainGreen,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.email,
    required this.validator,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  final TextEditingController email;
  final validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: email,
      validator: validator,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 20),
          labelText: "Enter your email or phone number",
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1))),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
