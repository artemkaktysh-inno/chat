import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? disabled;
  final String? errorText;
  final double? width;

  const AppTextField({
    required this.controller,
    required this.hintText,
    this.width,
    this.disabled,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.of(context).gray,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 40,
      width: width ?? 250,
      child: TextField(
        enabled: disabled != null ? !disabled! : null,
        decoration: InputDecoration(
          hintText: hintText, errorText: errorText,
          //contentPadding: EdgeInsets.symmetric(horizontal: 9),
        ),
        controller: controller,
      ),
    );
  }
}
