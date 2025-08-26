import 'package:flutter/material.dart';

class MainColors {
  MainColors._();
  // Define the main colors used in the application

  static const primaryColor = MaterialColor(0xFFFFA451, {
    200: Color(0xFFcaf0f8),
    400: Color(0xFF90e0ef),
    600: Color(0xFF0077b6),
    800: Color(0xFFFFA451),
  });

  static const blackColor = MaterialColor(0xff000000, {
    800: Color(0xFF222222),
    600: Color(0xFF444444),
    400: Color(0xFF666666),
    200: Color(0xFF999999),
  });

  static const whiteColor = MaterialColor(0xffffffff, {
    400: Color(0xffF5F5F5),
    500: Color(0xffE0E0E0),
    600: Color(0xffCCCCCC),
    800: Color(0xffB8B8B8),
  });

  static const VioletColor = MaterialColor(0xFFb298dc, {
    200: Color(0xFFb9faf8),
    400: Color(0xFFb8d0eb),
    600: Color(0xFFa663cc),
    800: Color(0xFF6f2dbd),
  });
}