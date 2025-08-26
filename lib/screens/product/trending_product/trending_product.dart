
import 'package:app_ecommerce/widget/header/filter_header.dart';
import 'package:app_ecommerce/widget/header/header.dart';
import 'package:app_ecommerce/widget/header/search_bar.dart';
import 'package:flutter/material.dart';

class TrendingProduct extends StatelessWidget {
  const TrendingProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHeader(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSearchBar(),
              const SizedBox(height: 20),
            buildFilter('52,082+ Iteams'),
          
        ]
        ),
      ),
    );
  }
}
