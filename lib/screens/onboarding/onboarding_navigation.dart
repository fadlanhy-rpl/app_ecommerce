import 'package:flutter/material.dart';

class OnboardingNavigation extends StatelessWidget {
  final double pageOffset;
  // final int currentPage;
  final VoidCallback onNext;
  final VoidCallback? onPrev; // Nullable karena halaman 1 tidak punya 'Prev'
  final String nextButtonText;

  const OnboardingNavigation({
    Key? key,
    required this.pageOffset,
    // required this.currentPage,
    required this.onNext,
    this.onPrev,
    this.nextButtonText = 'Next', // Nilai default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 19),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (onPrev != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onPrev,
                  child: const Text(
                    'Prev',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFC4C4C4),
                    ),
                  ),
                ),
              ],
            ),

          // Page Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {

              double difference = (pageOffset - index).abs();

              double width = 40 - (30 * difference.clamp(0.0, 1.0));

              Color color = Color.lerp(
                const Color(0xff17223B), // Warna aktif
                const Color.fromARGB(40, 23, 34, 59), // Warna non-aktif
                difference.clamp(0.0, 1.0),
              )!;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 100), // Durasi pendek untuk responsivitas
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 8,
                width: width, // Gunakan lebar yang sudah dihitung
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color, // Gunakan warna yang sudah dihitung
                ),
              );
            }),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onNext,
                child: Text(
                  nextButtonText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
