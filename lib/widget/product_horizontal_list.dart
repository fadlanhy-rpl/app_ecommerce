import 'package:app_ecommerce/models/product_model.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/product/product_card.dart';
import 'package:flutter/material.dart';

class ProductHorizontalList extends StatelessWidget {
  final List<Product> products;
  final ScrollController? controller; // Opsional
  final bool showNextButton;         // Opsional

  const ProductHorizontalList({
    super.key,
    required this.products,
    this.controller,
    this.showNextButton = false, // Defaultnya tidak menampilkan tombol
  });

  @override
  Widget build(BuildContext context) {
    // Widget dasar kita adalah ListView
    Widget listView = ListView.builder(
      shrinkWrap: true,
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      // Beri padding kanan agar item terakhir tidak tertutup tombol jika ada
      padding: EdgeInsets.only(right: showNextButton ? 40.0 : 0),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );

    return SizedBox(
      height: 280, // Atur tinggi agar konsisten
      child: showNextButton && controller != null
          // JIKA `showNextButton` true, bungkus dengan Stack
          ? Stack(
              children: [
                listView,
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        const double itemWidth = 160.0;
                        const double margin = 16.0;
                        final double scrollPosition = controller!.offset + (itemWidth + margin);
                        controller!.animateTo(
                          scrollPosition,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: const Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ),
                  ),
                ),
              ],
            )
          // JIKA `showNextButton` false, tampilkan ListView saja
          : listView,
    );
  }
}