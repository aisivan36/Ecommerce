import 'package:ecommerce/constants.dart';
import 'package:ecommerce/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
        ),
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 14,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
