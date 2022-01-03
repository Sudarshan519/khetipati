import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/controllers/auth_controller.dart';
import 'package:khetipati/screens/home/home.dart';
import 'package:khetipati/utils/validators.dart';
import 'package:khetipati/widgets/clipper.dart';
import 'register.dart';
import 'dart:ui' as ui;

class LoginPage extends GetView<AuthController> {
  LoginPage({Key? key}) : super(key: key);
  final password = TextEditingController();
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TopLogo(),
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
            SizedBox(
              height: getHeight(20),
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
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.mainGreen),
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      hintText: "Enter your email",
                      controller: email,
                      icon: Icons.email,
                      validator: (email) => validateEmail(string: email),
                    ),
                    SizedBox(height: getHeight(30)),
                    InputField(
                      icon: Icons.lock,
                      controller: password,
                      obscureText: true,
                      hintText: "Enter your  Password",
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
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate())
                          {
                            controller.loginWithEmail(
                                email: "admin@gmail.com",
                                password: "testing1234");
                          }
                        },
                        child: Obx(
                          () => controller.authState.value ==
                                  AuthState.Authenticated
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: getFont(20),
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
                            child: const Text(
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
  const InputField(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.icon,
      this.obscureText = false,
      this.hintText = ""})
      : super(key: key);
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 20),
          labelText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1))),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.mainGreen),
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}

class TopLogo extends StatelessWidget {
  const TopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: screenSize.height * .3,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(double.infinity, screenSize.height * .35),
              painter: TopDesign(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  "assets/logo.png",
                  height: getHeight(96),
                  width: getHeight(96),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ));
  }
}

class TopDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.146813, size.height * 0.1555934);
    path_0.cubicTo(
        size.width * 1.146813,
        size.height * 0.4824561,
        size.width * 0.9689903,
        size.height,
        size.width * 0.4914842,
        size.height);
    path_0.cubicTo(
        size.width * -0.1411192,
        size.height,
        size.width * -0.4574209,
        size.height * -0.04385925,
        size.width * 0.1265207,
        size.height * -0.8245614);
    path_0.cubicTo(
        size.width * 0.2189781,
        size.height * -0.9481711,
        size.width * 0.3600973,
        size.height * -0.9035088,
        size.width * 0.3600973,
        size.height * -0.9035088);
    path_0.cubicTo(
        size.width * 0.6825985,
        size.height * -0.9035088,
        size.width * 1.146813,
        size.height * -0.4257588,
        size.width * 1.146813,
        size.height * 0.1555934);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.4817518, size.height * 0.1929825),
        Offset(size.width * 0.4817518, size.height * 0.6578947), [
      const Color(0xffB41D26).withOpacity(1),
      const Color(0xff86151C).withOpacity(1)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
