import 'package:app_ecommerce/screens/home/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import 'onboarding_navigation.dart';
import 'onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  double _pageOffset = 0.0;

  // Daftar konten untuk setiap halaman
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/image/onboarding1.png",
      "title": "Choose Products",
      "desc":
          "Amet minim mollit non deserunt ullamco est\nsit aliqua dolor do amet sint.",
    },
    {
      "image": "assets/image/onboarding2.png",
      "title": "Get Your Order",
      "desc":
          "Velit offician consequat duis enim velit mollit\nexercitation veniam consequat sunt.",
    },
    {
      "image": "assets/image/onboarding3.png",
      "title": "Make Payment",
      "desc": "Nostrud ad ad nostrud consequat sunt\ncommodo veniam sint sunt.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_currentPage + 1}/3'), // Judul AppBar dinamis
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        // Callback ini terpanggil setiap kali halaman selesai digeser
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingPageContent(
            imagePath: onboardingData[index]['image']!,
            title: onboardingData[index]['title']!,
            description: onboardingData[index]['desc']!,
          );
        },
      ),
      bottomNavigationBar: OnboardingNavigation(
        // currentPage: _currentPage,
        pageOffset: _pageOffset,
        nextButtonText: _currentPage == 2 ? 'Get Started' : 'Next',
        onNext: () {
          if (_currentPage < 2) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        onPrev: _currentPage > 0
            ? () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            : null, // Sembunyikan tombol 'Prev' di halaman pertama
      ),
    );
  }
}
