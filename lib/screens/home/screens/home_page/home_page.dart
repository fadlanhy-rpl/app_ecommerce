
import 'package:app_ecommerce/preferences/assets.dart';
import 'package:app_ecommerce/preferences/color.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/banner/banner_heels_homepage.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/banner/last_banner_homepage.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/banner/special_offers_homepage.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/feature_homepage.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/item_notif.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/product/Product_homepage.dart';
import 'package:app_ecommerce/screens/home/screens/home_page/widget/product/product_trending_homepage.dart';
import 'package:app_ecommerce/widget/header/filter_header.dart';
import 'package:app_ecommerce/widget/header/header.dart';
import 'package:app_ecommerce/widget/header/search_bar.dart';
import 'package:flutter/material.dart';
// part '../../../widget/header/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> categories = const [
    {'image': MainAssets.fitur1, 'name': 'Beauty'},
    {'image': MainAssets.fitur2, 'name': 'Fashion'},
    {'image': MainAssets.fitur3, 'name': 'Kids'},
    {'image': MainAssets.fitur4, 'name': 'Mens'},
    {'image': MainAssets.fitur5, 'name': 'Womens'},
  ];

  final List<Map<String, dynamic>> banners = const [
    {'image': MainAssets.bannerDiskon, 'title': '50-40% OFF'},
    {'image': MainAssets.bannerDiskon2, 'title': 'New Arrivals'},
    {'image': MainAssets.bannerDiskon3, 'title': 'Summer Sale'},
  ];

  final List<Map<String, dynamic>> dealProducts = const [
    {
      'image': MainAssets.produk1,
      'title': 'Women Printed Kurta',
      'price': 1500,
      'originalPrice': 2499,
      'discount': '40% OFF',
      'rating': 4.5,
      'reviews': 56890,
    },
    {
      'image': MainAssets.produk2,
      'title': 'HRX by Hrithik Roshan',
      'price': 2499,
      'originalPrice': 4999,
      'discount': '50% OFF',
      'rating': 4.8,
      'reviews': 344567,
    },
    {
      'image': MainAssets.produk3,
      'title': 'TITAN Men Watch- 1806N',
      'price': 1500,
      'originalPrice': 3500,
      'discount': '60% OFF',
      'rating': 4.5,
      'reviews': 15007,
    },
  ];

  int _currentBannerPage = 0;
  final PageController _bannerController = PageController();

  final List<Map<String, dynamic>> trendingProducts = const [
    {
      'image': MainAssets.trending1,
      'title': 'IWC Schaffhausen 2021 Pilot\'s Watch',
      'price': 650,
      'originalPrice': 1599,
      'discount': '60% OFF',
    },
    {
      'image': MainAssets.trending2,
      'title': 'Labbin White Sneakers For Men and Female',
      'price': 650,
      'originalPrice': 1250,
      'discount': '70% OFF',
    },
    {
      'image': MainAssets.trending3,
      'title': 'Mammon Women\'s Handbag (Set of 3)',
      'price': 750,
      'originalPrice': 1999,
      'discount': '62% OFF',
    },
  ];

  late ScrollController _trendingScrollController;

  @override
  void initState() {
    super.initState();
    _trendingScrollController = ScrollController();
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _trendingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildHeader(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildSearchBar(),

              const SizedBox(height: 20),

              buildFilter('All Featured'),

              const SizedBox(height: 16),

              AllFeatureSection(categories: categories),

              const SizedBox(height: 16),

              buildBanner(),

              const SizedBox(height: 24),

              buildNotif(
                Colors.blue[500],
                'Deal of the Day',
                Icon(Icons.timer_outlined, color: Colors.white, size: 16),
                '22h 55m 20s remaining ',
              ),

              const SizedBox(height: 16),

              ProductListHomePage(dealProducts: dealProducts),

              const SizedBox(height: 24),

              SpecialOffersHomePage(),

              const SizedBox(height: 16),

              BannerHeelsHomepage(),

              const SizedBox(height: 16),

              buildNotif(
                Color(0xffFD6E87),
                'Trending Products ',
                Icon(Icons.calendar_month, color: MainColors.whiteColor),
                'Last Date 29/02/22',
              ),

              const SizedBox(height: 16),

              TrendingProductHompage(
                trendingScrollController: _trendingScrollController,
                trendingProducts: trendingProducts,
              ),

              const SizedBox(height: 24),

              LastBannerHomepage(),
            ],
          ),
        ),
      ),
    );
  }

  

  Widget buildBanner() {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: banners.length,
            onPageChanged: (int page) {
              // 4. Update state saat halaman berganti
              setState(() {
                _currentBannerPage = page;
              });
            },
            itemBuilder: (context, index) {
              final banner = banners[index];
              // Ini adalah widget untuk satu banner
              return Container(
                decoration: BoxDecoration(
                  color: banner['color'],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      child: Image.asset(banner['image'], fit: BoxFit.cover),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              banner['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentBannerPage == index ? 24 : 8, // Lebar berubah
              height: 8,
              decoration: BoxDecoration(
                // Bentuk berubah dari lingkaran ke persegi panjang
                borderRadius: BorderRadius.circular(4),
                color: _currentBannerPage == index
                    ? Colors.pink[400]
                    : Colors.grey[300],
              ),
            );
          }),
        ),
      ],
    );
  }
}
