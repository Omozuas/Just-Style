import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:juststyle/app/common/app_style.dart';
import 'package:juststyle/app/common/button_large.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class VerfyOtpScreen extends StatefulWidget {
  const VerfyOtpScreen({super.key});

  @override
  State<VerfyOtpScreen> createState() => _VerfyOtpScreenState();
}

class _VerfyOtpScreenState extends State<VerfyOtpScreen> {
  int _remainingTime = 0; // Countdown timer in seconds
  Timer? _timer;

  void _startResendTimer() {
    setState(() {
      _remainingTime = 90; // 1 minute 30 seconds (90 seconds)
    });

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }

  void _resendOTP() {
    log("Resend OTP clicked");
    _startResendTimer(); // Start the countdown
    // Call your resend OTP function here
  }

  /// Formats time in "1:30" format
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    String formattedTime = "$minutes:${secs.toString().padLeft(2, '0')}";
    return formattedTime;
  }

  @override
  void dispose() {
    _timer?.cancel(); // Ensure timer is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15.h,
                left: 15.w,
                right: 15.w,
                bottom: 15.h,
              ),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  SvgPicture.asset("assets/icon/dashicons_email-alt2.svg"),
                  SizedBox(height: 40.h),
                  Text(
                    "Verify Code",
                    textAlign: TextAlign.center,
                    style: appStyle(32, black, FontWeight.w700),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    text: TextSpan(
                      text:
                          "Please enter the code we sent to your email address",
                      style: appStyle(15, black, FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                          text: " example@gmail.com",
                          style: appStyle(15, blue, FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 58.w,
                    spaceBetween: 10,
                    style: appStyle(28, black, FontWeight.w700),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: lightGray,
                      focusBorderColor: green,
                      enabledBorderColor: lightGray,
                    ),
                    onChanged: (value) {
                      log("value: $value");
                    }, // Add this line
                    onCompleted: (pin) {
                      log("Completed: $pin");
                    },
                  ),
                  SizedBox(height: 30.h),
                  RichText(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    text: TextSpan(
                      text: "I did not receive an OTP,",
                      style: appStyle(15, black, FontWeight.w400),
                      children: <TextSpan>[
                        _remainingTime > 0
                            ? TextSpan(
                              text:
                                  "   Resend in ${_formatTime(_remainingTime)}",
                              style: appStyle(14, blue, FontWeight.w700),
                            )
                            : TextSpan(
                              text: "Resend",
                              style: appStyle(15, blue, FontWeight.w400),
                              recognizer:
                                  TapGestureRecognizer()..onTap = _resendOTP,
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonLarge(onTap: () {}, text: 'verify'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
