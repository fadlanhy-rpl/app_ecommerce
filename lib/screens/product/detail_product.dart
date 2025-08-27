import 'package:app_ecommerce/models/product_model.dart';
import 'package:app_ecommerce/preferences/preferences.dart';
import 'package:app_ecommerce/screens/shop/checkout_screen.dart';
import 'package:app_ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final List<String> productImages = [
    MainAssets.detailSepatu1,
    MainAssets.detailSepatu2,
    MainAssets.detailSepatu3,
  ];

  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> availableSizes = ['6 UK', '7 UK', '8 UK', '9 UK', '10 UK'];
  int _selectedSizeIndex = 1;

  bool _isDescriptionExpanded = false;
  final String productDescription =
      'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the...';

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }

  final List<Product> similarProducts = const [
    Product(
      image: MainAssets.detailSepatu1,
      title: 'Nike Air Jordan Retro',
      price: 1900,
      originalPrice: 3000,
      discount: '37% OFF',
    ),
    Product(
      image: MainAssets.detailSepatu2,
      title: 'Nike Pink Mocha Shoes',
      price: 1900,
      originalPrice: 3200,
      discount: '40% OFF',
    ),
    Product(
      image: MainAssets.detailSepatu3,
      title: 'Nike Black Dress',
      price: 2000,
      originalPrice: 3500,
      discount: '42% OFF',
    ),
    Product(
      image: MainAssets.detailSepatu1,
      title: 'Nike Air Jordan Retro',
      price: 1900,
      originalPrice: 3000,
      discount: '37% OFF',
    ),
    Product(
      image: MainAssets.detailSepatu2,
      title: 'Nike Pink Mocha Shoes',
      price: 1900,
      originalPrice: 3200,
      discount: '40% OFF',
    ),
    Product(
      image: MainAssets.detailSepatu3,
      title: 'Nike Black Dress',
      price: 2000,
      originalPrice: 3500,
      discount: '42% OFF',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MainColors.whiteColor[400],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: MainColors.blackColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300, // Tentukan tinggi area galeri gambar
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: productImages.length,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Image.asset(
                            productImages[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(productImages.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.pink
                                : Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        );
                      }),
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul "Size"
                  Text(
                    'Size: ${availableSizes[_selectedSizeIndex]}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: availableSizes.length,
                      itemBuilder: (context, index) {
                        final bool isSelected = _selectedSizeIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSizeIndex = index;
                            });
                          },
                          child: Container(
                            width: 60,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.pink : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.pink
                                    : Colors.pink.shade300,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                availableSizes[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nike Sneakers',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Vision Alta Men’s Shoes Size (All Colours)",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 2),
                          Text(
                            '(56,890)',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '₹2,999',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            '₹1,500',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 12),

                          Text(
                            '50% Off',
                            style: TextStyle(
                              color: Colors.pink[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Deskripsi yang bisa diperluas
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: _isDescriptionExpanded
                              ? productDescription
                              : '${productDescription.substring(0, 150)}...',
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isDescriptionExpanded =
                                    !_isDescriptionExpanded;
                              });
                            },
                            child: Text(
                              _isDescriptionExpanded ? " Less" : " More",
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Ikon Informasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoChip(Icons.store_outlined, 'Nearest Store'),
                      _buildInfoChip(Icons.verified_outlined, 'VIP'),
                      _buildInfoChip(Icons.replay_outlined, 'Return Policy'),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Similar To",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // SOLUSI: Ganti Container dengan GridView.builder
                  GridView.builder(
                    // Perintah agar GridView menyesuaikan ukurannya
                    shrinkWrap: true,
                    // Mencegah GridView di-scroll sendiri
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: similarProducts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 kolom
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65, // Sesuaikan rasio
                    ),
                    itemBuilder: (context, index) {
                      // Gunakan kembali ProductCard yang sudah ada!
                      return ProductCard(product: similarProducts[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
          // Hanya beri lengkungan di sudut atas
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            // Tombol "Go to cart"
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text('Go to cart'),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.pink),
                  foregroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Tombol "Buy Now"
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_bag_outlined),
                label: const Text('Buy Now'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
