import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class TermsAgreement extends StatelessWidget {
  const TermsAgreement({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Checkbox(
            value: value,
            onChanged: (checked) => onChanged(checked ?? false),
            side: BorderSide(color: AppColors.textMuted),
            activeColor: AppColors.black2,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        gapW(8),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: AppTextStyle.paragraphMedium(textColor: AppColors.black2),
              children: [
                const TextSpan(text: 'Agree with '),
                TextSpan(
                  text: 'terms and condition',
                  style: AppTextStyle.paragraphMedium(textColor: blue),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
