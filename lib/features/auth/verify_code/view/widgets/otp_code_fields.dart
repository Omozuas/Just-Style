import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juststyle/app/core/sizing/screen_size_extension.dart';
import 'package:juststyle/app/core/text/app_text.dart';
import 'package:juststyle/app/theme/app_colors.dart';
import 'package:juststyle/app/theme/global_colors.dart';

class OtpCodeFields extends StatefulWidget {
  const OtpCodeFields({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<OtpCodeFields> createState() => _OtpCodeFieldsState();
}

class _OtpCodeFieldsState extends State<OtpCodeFields> {
  static const _length = 4;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final digits = _controller.text.replaceAll(RegExp(r'\D'), '');
    final code = digits.length > _length ? digits.substring(0, _length) : digits;
    if (code != _controller.text) {
      _controller.value = TextEditingValue(
        text: code,
        selection: TextSelection.collapsed(offset: code.length),
      );
      return;
    }
    setState(() {});
    widget.onChanged(code);
  }

  @override
  Widget build(BuildContext context) {
    final code = _controller.text;
    final cursor = code.length.clamp(0, _length - 1);
    final width = 60.w * _length + 16.w * (_length - 1);

    return SizedBox(
      width: width,
      height: 68.h,
      child: Stack(
        children: [
          IgnorePointer(
            child: Row(
              children: [
                for (var i = 0; i < _length; i++) ...[
                  if (i > 0) gapW(16),
                  _box(
                    digit: i < code.length ? code[i] : '',
                    active:
                        i < code.length ||
                        (_focusNode.hasFocus && i == cursor),
                  ),
                ],
              ],
            ),
          ),
          Positioned.fill(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              autofocus: true,
              showCursor: false,
              style: const TextStyle(color: Colors.transparent),
              cursorColor: Colors.transparent,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(_length),
              ],
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _box({required String digit, required bool active}) {
    return Container(
      width: 60.w,
      height: 68.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadiusAll(8),
        border: Border.all(color: active ? green : lightGray, width: 1.4),
      ),
      child: Text(
        digit,
        style: AppTextStyle.headingSmall(textColor: AppColors.black2),
      ),
    );
  }
}
