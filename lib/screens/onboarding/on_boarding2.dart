import 'package:app_ecommerce/preferences/color.dart';
import 'package:flutter/material.dart';

class SecOnBoarding extends StatefulWidget {
  const SecOnBoarding({super.key});

  @override
  State<SecOnBoarding> createState() => _SecOnBoardingState();
}

  final _nameController = TextEditingController();

class _SecOnBoardingState extends State<SecOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 60,
            child: Container(
              decoration: BoxDecoration(
                color: MainColors.primaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/image/onboarding2.png'),
                  alignment: Alignment(0, 0.6),
                  scale: 1.0,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              decoration: BoxDecoration(color: const Color(0xFFFFFFFF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What is your firstname?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF27214D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your first name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 42),
                  ElevatedButton(
                    onPressed: () {
                      String nameController = _nameController.text;
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(name: nameController,)), (route) => false);
                    },
                    child: Text('Start Ordering'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      
    );
  }
}
