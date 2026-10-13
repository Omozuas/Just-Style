import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';
import 'package:juststyle/app/theme/hex_color.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hint = 'Search here',
    this.controller,
    this.onChanged,
    this.onFilter,
    this.showFilter = true,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilter;
  final bool showFilter;

  static final _border = '#E6E6E6'.toColor;
  static final _hint = '#A3A3A3'.toColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.center,
              style: AppTextStyle.paragraphMedium(textColor: AppColors.black2),
              decoration: InputDecoration(
                isDense: true,
                hintText: hint,
                hintStyle: AppTextStyle.paragraphMedium(textColor: _hint),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: paddingOnly(left: 16),
                suffixIcon: Icon(Icons.search, color: deemYellow, size: 22.ic),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 40.w,
                  minHeight: 48.h,
                ),
                enabledBorder: _outline,
                focusedBorder: _outline,
                border: _outline,
              ),
            ),
          ),
        ),
        if (showFilter) ...[
          gapW(10),
          GestureDetector(
            onTap: onFilter,
            child: Container(
              width: 48.w,
              height: 48.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: deemYellow,
                borderRadius: borderRadiusAll(8),
              ),
              child: Icon(Icons.menu, color: AppColors.white, size: 22.ic),
            ),
          ),
        ],
      ],
    );
  }

  OutlineInputBorder get _outline => OutlineInputBorder(
    borderRadius: borderRadiusAll(10),
    borderSide: BorderSide(color: _border),
  );
}
