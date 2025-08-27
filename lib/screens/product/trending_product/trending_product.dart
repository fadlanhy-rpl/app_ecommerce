import 'package:app_ecommerce/models/product_model.dart';
import 'package:app_ecommerce/preferences/preferences.dart';
import 'package:app_ecommerce/widget/widget.dart';
import 'package:flutter/material.dart';

class TrendingProduct extends StatefulWidget {
  const TrendingProduct({super.key});

  @override
  State<TrendingProduct> createState() => _TrendingProductState();
}

class _TrendingProductState extends State<TrendingProduct> {
  final List<Product> trendingProducts = const [
    Product(
      image: MainAssets.produkGrid1,
      title: 'Black Winter...',
      price: 2399,
      originalPrice: 4000,
      discount: '40% OFF',
    ),
    Product(
      image: MainAssets.produkGrid2,
      title: 'Mens Starry',
      price: 2149,
      originalPrice: 3000,
      discount: '28% OFF',
    ),
    Product(
      image: MainAssets.produkGrid3,
      title: 'Black Dress',
      price: 2000,
      originalPrice: 3500,
      discount: '42% OFF',
    ),
    Product(
      image: MainAssets.produkGrid4,
      title: 'Pink Embroide...',
      price: 1300,
      originalPrice: 2000,
      discount: '35% OFF',
    ),
    Product(
      image: MainAssets.produkGrid5,
      title: 'Flare Dress',
      price: 1990,
      originalPrice: 3000,
      discount: '34% OFF',
    ),
    Product(
      image: MainAssets.produkGrid6,
      title: 'denim dress',
      price: 1500,
      originalPrice: 2500,
      discount: '40% OFF',
    ),
    Product(
      image: MainAssets.produkGrid1,
      title: 'Black Winter...',
      price: 2399,
      originalPrice: 4000,
      discount: '40% OFF',
    ),
    Product(
      image: MainAssets.produkGrid2,
      title: 'Mens Starry',
      price: 2149,
      originalPrice: 3000,
      discount: '28% OFF',
    ),
    Product(
      image: MainAssets.produkGrid3,
      title: 'Black Dress',
      price: 2000,
      originalPrice: 3500,
      discount: '42% OFF',
    ),
    Product(
      image: MainAssets.produkGrid4,
      title: 'Pink Embroide...',
      price: 1300,
      originalPrice: 2000,
      discount: '35% OFF',
    ),
    Product(
      image: MainAssets.produkGrid5,
      title: 'Flare Dress',
      price: 1990,
      originalPrice: 3000,
      discount: '34% OFF',
    ),
    Product(
      image: MainAssets.produkGrid6,
      title: 'denim dress',
      price: 1500,
      originalPrice: 2500,
      discount: '40% OFF',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black87),
              onPressed: () {},
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/image/logo_app.png', height: 32),
            const SizedBox(width: 8),
            const Text(
              'Stylish',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/image/pp.jpg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSearchBar(),
            const SizedBox(height: 20),
            buildFilter('52,082+ Iteams'),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: trendingProducts[index]);
                },
                itemCount: trendingProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
