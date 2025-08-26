import 'package:app_ecommerce/preferences/customicon_icons.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/fitur_container.dart';
import 'package:flutter/material.dart';

Widget buildFilter(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),

      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildFeature("Short", CustomIcon.short),
            SizedBox(width: 12),
            buildFeature("Filter", CustomIcon.filter),
          ],
        ),
      ),
    ],
  );
}
