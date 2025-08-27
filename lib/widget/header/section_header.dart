import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll; // Dibuat opsional

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Tombol "View all" hanya akan tampil jika fungsinya diberikan
        if (onViewAll != null)
          TextButton(
            onPressed: onViewAll,
            child: const Text('View all'),
          ),
      ],
    );
  }
}