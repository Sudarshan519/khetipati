import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/controllers/forgetpassword_controller.dart';
import 'package:khetipati/screens/widgets/app_bar.dart';
import 'package:khetipati/screens/widgets/app_button.dart';
import 'package:khetipati/screens/widgets/text_field.dart';
import 'package:khetipati/theme.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  ForgetPasswordController controller = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: buildAppBar('Forget Password'),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.mainGrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please insert your email\n',
              style: robototitleStyle.copyWith(fontSize: 15),
            ),
            MyInputField(
              hint: 'Email',
              controller: controller.email,
            ),
            const SizedBox(height: 20),
            Center(
                child: SizedBox(
                    height: 40,
                    child: MyButton(
                        label: 'Send',
                        onTap: () {
                          controller.forgetPassword();
                        })))
          ],
        ),
      ),
    );
  }
}
