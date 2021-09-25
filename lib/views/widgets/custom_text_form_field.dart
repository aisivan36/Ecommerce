import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.validatorFn,
    required this.onSavedFn,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontSize: 14.sp,
          color: Colors.grey.shade800,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 18.sp,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText,
          initialValue: initialValue,
          validator: validatorFn,
          onSaved: onSavedFn,
        ),
      ],
    );
  }
}
