import 'package:app_ecommerce/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the next screen after the splash screen
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OnboardingScreen()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image/logo_app.png'),
            SizedBox(width:9 ,),
            Text('Stylish',
            style: TextStyle(
              fontSize: 40,
              color: Color(0xffF83758),
              fontWeight: FontWeight.bold,
              fontFamily: 'Libre Caslon'
            ),)
          ],
        ),
      ),
    );
  }
}