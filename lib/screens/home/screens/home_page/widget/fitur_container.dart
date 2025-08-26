import 'package:app_ecommerce/preferences/color.dart';
import 'package:flutter/material.dart';

Widget buildFeature(String title, iconfitur) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 67,
      height: 34,
      decoration: BoxDecoration(
        color: MainColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(8, 0, 0, 0).withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(title), Icon(iconfitur)],
      ),
    );
  }