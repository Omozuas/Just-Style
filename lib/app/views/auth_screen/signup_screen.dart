import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/common/custom_textfield.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:juststyle/app/views/auth_screen/signup_screen2.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedCountry;
  String? selectedCode;
  void proceed() {
    if (_formKey.currentState?.validate() ?? false) {
      Get.to(
        () => SignupScreen2(),
        transition: Transition.cupertino,
        arguments: {
          "name": userNameController.text,
          "email": emailController.text,
          "address": adressController.text,
          "state": stateController.text,
          "country": selectedCountry,
          "code": selectedCode,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                left: 15.w,
                right: 15.w,
                bottom: 15.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: appStyle(32, black, FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Kindly enter your  details to continue",
                    textAlign: TextAlign.center,
                    style: appStyle(15, black, FontWeight.w400),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFields(
                    firstText: 'Username',
                    hintText: "User name",
                    controller: userNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFields(
                    firstText: 'Email',
                    hintText: "Email Address",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFields(
                    firstText: 'Address',
                    hintText: "Address",
                    controller: adressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Address';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
                        style: appStyle(15, black, FontWeight.w400),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: lightGray),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: CountryCodePicker(
                          padding: EdgeInsets.only(
                            top: 10.h,
                            bottom: 10.h,
                            right: 5.w,
                            left: 5.w,
                          ),
                          alignLeft: true,
                          flagWidth: 23.sp,
                          onChanged: (country) {
                            setState(() {
                              selectedCountry = country.name;
                              selectedCode = country.code;
                            });
                          },
                          initialSelection: 'US',
                          showCountryOnly: true,
                          showDropDownButton: true,
                          showOnlyCountryWhenClosed: true,
                          favorite: [
                            '+1',
                            '+234',
                            '+44',
                          ], // Example: US, Nigeria, UK
                          textStyle: TextStyle(
                            fontSize: 15.sp,
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFields(
                    firstText: 'State',
                    hintText: "State",
                    controller: stateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your State';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 35.h),
                  ButtonLarge(onTap: proceed, text: 'Proceed'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
