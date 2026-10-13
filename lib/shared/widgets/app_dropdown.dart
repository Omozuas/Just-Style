import 'package:flutter/material.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/shared/widgets/app_field_decoration.dart';

class AppDropdown extends StatefulWidget {
  const AppDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  static const _radius = 12.0;
  bool _isOpen = false;

  void _toggle() => setState(() => _isOpen = !_isOpen);

  void _select(String value) {
    setState(() => _isOpen = false);
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.value != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppFieldLabel(widget.label),
        gapH(8),
        GestureDetector(
          onTap: _toggle,
          child: Container(
            width: double.infinity,
            padding: paddingSymmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: _isOpen ? AppColors.black2 : appFieldBorder,
                width: _isOpen ? 1.5 : 1,
              ),
              borderRadius: _isOpen
                  ? BorderRadius.only(
                      topLeft: _radius.radiusCircular,
                      topRight: _radius.radiusCircular,
                    )
                  : borderRadiusAll(_radius),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.value ?? widget.hint,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.paragraphMedium(
                      textColor: hasValue
                          ? AppColors.black2
                          : AppColors.textMuted,
                    ),
                  ),
                ),
                AnimatedRotation(
                  turns: _isOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                    size: 22.ic,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isOpen)
          Container(
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: 150.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                left: BorderSide(color: appFieldBorder),
                right: BorderSide(color: appFieldBorder),
                bottom: BorderSide(color: appFieldBorder),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: _radius.radiusCircular,
                bottomRight: _radius.radiusCircular,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: _radius.radiusCircular,
                bottomRight: _radius.radiusCircular,
              ),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: widget.items.length,
                separatorBuilder: (_, _) => Divider(
                  height: 1,
                  thickness: 1,
                  color: appFieldBorder,
                ),
                itemBuilder: (context, index) {
                  final option = widget.items[index];
                  final isSelected = widget.value == option;
                  return GestureDetector(
                    onTap: () => _select(option),
                    child: Container(
                      width: double.infinity,
                      padding: paddingSymmetric(horizontal: 16, vertical: 14),
                      color: isSelected
                          ? AppColors.black2.withValues(alpha: 0.06)
                          : AppColors.white,
                      child: Text(
                        option,
                        style: AppTextStyle.paragraphMedium(
                          textColor: AppColors.black2,
                          strong: isSelected,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
