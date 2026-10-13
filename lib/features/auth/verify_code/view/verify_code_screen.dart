import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/router/app_routes.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/features/auth/verify_code/view/widgets/otp_code_fields.dart';
import 'package:juststyle/features/auth/verify_code/view/widgets/verify_code_header.dart';
import 'package:juststyle/features/auth/verify_code/view/widgets/verify_code_mark.dart';
import 'package:juststyle/shared/widgets/app_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({
    super.key,
    required this.email,
    this.buttonLabel = 'Verify',
    this.onVerified,
  });

  final String email;
  final String buttonLabel;
  final VoidCallback? onVerified;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  static const _resendDelay = 90;

  String _code = '';
  int _remainingTime = 0;
  Timer? _timer;

  bool get _canVerify => _code.length == 4;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resend() {
    _timer?.cancel();
    setState(() => _remainingTime = _resendDelay);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingTime == 0) {
        timer.cancel();
        return;
      }
      setState(() => _remainingTime -= 1);
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.email.isEmpty ? 'your email' : widget.email;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: paddingSymmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              gapH(36),
              const VerifyCodeMark(),
              gapH(36),
              VerifyCodeHeader(email: email),
              gapH(36),
              OtpCodeFields(onChanged: (code) => setState(() => _code = code)),
              gapH(24),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: AppTextStyle.paragraphMedium(
                    textColor: AppColors.black2,
                  ),
                  children: [
                    const TextSpan(text: 'I did not receive an OTP, '),
                    if (_remainingTime > 0)
                      TextSpan(
                        text: 'Resend in ${_formatTime(_remainingTime)}',
                        style: AppTextStyle.paragraphMedium(
                          textColor: blue,
                          strong: true,
                        ),
                      )
                    else
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: _resend,
                          child: Text(
                            'Resend',
                            style: AppTextStyle.paragraphMedium(textColor: blue),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              gapH(36),
              AppButton(
                text: widget.buttonLabel,
                radius: 24,
                height: 46,
                vertical: 0,
                variant: _canVerify
                    ? ButtonVariant.primary
                    : ButtonVariant.disabled,
                onPressed: _canVerify
                    ? (widget.onVerified ?? () => context.go(AppRoutes.login))
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
