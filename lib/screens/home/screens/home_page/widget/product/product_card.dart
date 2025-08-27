import 'package:app_ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Hapus Container pembungkus luar dan biarkan Column menjadi widget teratas
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '₹${product.price}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(width: 8),
            Text(
              '₹${product.originalPrice}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              product.discount,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (product.rating != null &&
            product.reviews != null) // Tampilkan hanya jika data tidak null
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                '${product.rating}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(${product.reviews})',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
      ],
    );
  }
}
