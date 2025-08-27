import 'package:app_ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';

class ProductListHomePage extends StatelessWidget {
  const ProductListHomePage({
    super.key,
    required this.dealProducts,
  });

  final List<Map<String, dynamic>> dealProducts;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProduct()));
      },
      child: SizedBox(
        height: 280,
        // Tinggi untuk menampung satu kartu produk
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: dealProducts.length,
          itemBuilder: (context, index) {
            final product = dealProducts[index];
            return Container(
              width: 160, // Lebar setiap kartu produk
              margin: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar Produk
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
                  // Judul Produk
                  Text(
                    product['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Deskripsi singkat
                  const Text(
                    'Neque porro quisquam est qui dolorem ipsum quia',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Harga
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
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  // Rating Bintang (Contoh sederhana)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product['reviews']}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
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
    );
  }
}