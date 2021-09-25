import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'helper/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => ScreenUtilInit(
            designSize: orientation == Orientation.portrait
                ? const Size(375, 812)
                : const Size(812, 375),
            builder: () => GetMaterialApp(
                  initialBinding: Binding(),
                  theme: ThemeData(
                    fontFamily: 'MesloLGS GF',
                  ),
                  home: ControlView(),
                  debugShowCheckedModeBanner: false,
                  title: 'Ecommerce',
                )));
  }
}
