import 'package:app_ecommerce/preferences/color.dart';
import 'package:flutter/material.dart';

Container buildNotif(bgcolor, String notiftitle, notificon, String time) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notiftitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    notificon,
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: MainColors.whiteColor,
              side: BorderSide(color: MainColors.whiteColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Row(
                children: [
                  Text('View all'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }