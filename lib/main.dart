import 'package:app_ecommerce/preferences/color.dart';
import 'package:app_ecommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        fontFamily: 'Josefin Sans',

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFA451),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF3F1F1),
          hintStyle: TextStyle(color: const Color(0xFFC2BDBD), fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),

        // appBarTheme: AppBarTheme(
        //   backgroundColor: MainColors.primaryColor,
        //   // centerTitle: true,
        //   toolbarHeight: 70,
        //   surfaceTintColor: MainColors.primaryColor
        // )
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding:const EdgeInsets.symmetric(vertical: 20, ) ,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            side: BorderSide(color: MainColors.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            foregroundColor: MainColors.primaryColor,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
