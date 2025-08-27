import 'package:app_ecommerce/preferences/color.dart';
import 'package:app_ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';

class TrendingProductHompage extends StatelessWidget {
  const TrendingProductHompage({
    super.key,
    required ScrollController trendingScrollController,
    required this.trendingProducts,
  }) : _trendingScrollController = trendingScrollController;

  final ScrollController _trendingScrollController;
  final List<Map<String, dynamic>> trendingProducts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct()));
      },
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Text(
          //       'Trending Fashion',
          //       style: TextStyle(
          //         fontSize: 18,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     Spacer(),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text(
          //         'View all',
          //         style: TextStyle(
          //           fontSize: 14,
          //           fontWeight: FontWeight.w500,
          //           color: MainColors.blackColor,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
      
          const SizedBox(height: 16),
      
          Stack(
            children: [
              SizedBox(
                height: 260,
                child: ListView.builder(
                  controller: _trendingScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingProducts.length,
                  padding: const EdgeInsets.only(right: 20.0),
                  itemBuilder: (context, index) {
                    final product = trendingProducts[index];
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product['image'],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '₹${product['price']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '₹${product['originalPrice']}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  decoration:
                                      TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                product['discount'],
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      const double itemWidth = 160.0;
                      const double itemSpacing = 16.0;
                      final double scrollPosition =
                          _trendingScrollController.offset +
                          (itemWidth + itemSpacing);
      
                      _trendingScrollController.animateTo(
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
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ),
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