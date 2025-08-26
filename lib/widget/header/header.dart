import 'package:flutter/material.dart';

AppBar buildHeader() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      // Properti titleSpacing: 0 agar tidak ada jarak default
      titleSpacing: 0,

      
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.black87),
            onPressed: () {
              // Aksi saat tombol menu ditekan
            },
          ),
        ),
      ),

      // 2. Bagian Tengah (title)
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Pusatkan Row
        // mainAxisSize: MainAxisSize.min agar Row tidak makan semua tempat
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ganti dengan path logo aplikasimu
          Image.asset(
            'assets/image/logo_app.png',
            height: 32, // Sesuaikan ukuran logo
          ),
          const SizedBox(width: 8),
          const Text(
            'Stylish',
            style: TextStyle(
              color: Colors.blue, // Warna teks logo
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),

      // 3. Bagian Kanan (actions)
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/image/pp.jpg'),
          ),
        ),
      ],
    );
  }