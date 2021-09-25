import 'package:ecommerce/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/auth_viewmodel.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final _formKey = GlobalKey<FormState>();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 16.w,
                    left: 16.w,
                    top: 126.h,
                    bottom: 42.h,
                  ),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.h),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                   const CustomText(
                                      text: 'Welcome',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    GestureDetector(onTap: () {Get.to(page)},)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
