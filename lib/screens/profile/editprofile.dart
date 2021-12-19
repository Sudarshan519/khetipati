// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khetipati/constant/colors.dart';
import 'package:khetipati/constant/size_config.dart';
import 'package:khetipati/screens/widgets/text_field.dart';
import 'package:khetipati/theme.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainGreen,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: archivotitleStyle.copyWith(
              fontSize: getFont(22),
              color: AppColors.textGreen,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: AppColors.textGreen)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getHeight(228),
              width: MediaQuery.of(context).size.width,
              color: AppColors.mainGreen,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: getHeight(33), bottom: getHeight(15)),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: getHeight(135),
                      width: getWidth(135),
                    ),
                  ),
                  Text(
                    "Change Profile Picture",
                    style: archivotitleStyle.copyWith(
                        fontSize: getFont(16), fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                //height: 815,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: buildEditProfileForm())
          ],
        ),
      ),
    );
  }

  changePasswordButton() {
    return InkWell(
      onTap: () {
        // buildBottomsheet(context);
        _settingModalBottomSheet(context);
      },
      child: Container(
        height: 45,
        //  width: getWidth(352),
        decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: const Color.fromRGBO(0, 0, 0, 0.1)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: getWidth(16)),
              child: Text(
                'Change Password',
                style: robotosubtitleStyle.copyWith(
                    fontSize: getFont(16), fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: getWidth(15)),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: getFont(15),
                color: const Color.fromRGBO(147, 147, 147, 0.8),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildEditProfileForm() {
    return Container(
      margin: EdgeInsets.only(left: getWidth(30), right: getWidth(30)),
      child: Form(
          child: Column(
        children: [
          SizedBox(
            height: getHeight(50),
          ),
          const MyInputField(
            hint: 'Full Name',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Address',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Phone Number',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Email',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Date of Birth',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          const MyInputField(
            hint: 'Gender',
          ),
          SizedBox(
            height: getHeight(30),
          ),
          changePasswordButton(),
          SizedBox(
            height: getHeight(30),
          ),
          ButtonTheme(
            minWidth: getWidth(352),
            height: getHeight(48),
            child: RaisedButton(
              color: AppColors.mainGreen,
              onPressed: () {},
              child: Text(
                'Save Changes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: getFont(15),
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(40),
          ),
        ],
      )),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: getWidth(30), vertical: getWidth(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: getHeight(8)),
                    Text(
                      'New Password must be different from current password.',
                      style: archivotitleStyle.copyWith(
                          color: Colors.black,
                          fontSize: getFont(16),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: getHeight(15)),
                    const MyInputField(hint: 'Current Password'),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    const MyInputField(hint: 'New Password'),
                    SizedBox(height: getHeight(8)),
                    Text(
                      'Must be 8 characters long.',
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(15),
                    ),
                    const MyInputField(hint: 'Confirm Password'),
                    Text(
                      'Must be 8 characters long.',
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: getFont(12),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    ButtonTheme(
                      minWidth: getWidth(200),
                      height: getHeight(48),
                      child: RaisedButton(
                        color: AppColors.mainGreen,
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Save Changes',
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
          ),
        );
      });
}
