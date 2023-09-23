import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/models/build_card/card_view.dart';
import 'package:viwaha_lk/models/popular_cities/popular_cities.dart';
import 'package:viwaha_lk/models/premium_vender/premium_vendors.dart';
import 'package:viwaha_lk/models/top_listing/top_listing.dart';
import 'package:http/http.dart' as http;
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    filteredItems.addAll(items);
    fetchSliderImages();
  }

  List<String> sliderImageUrls = [];

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  void _onSearchChanged() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    });
  }
 
  Future<void> fetchSliderImages() async {
    final response = await http
        .get(Uri.parse('https://viwahaapp.viwaha.lk/api/app/get_sliders/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<String> imageUrls = data.map((item) {
        return item['url'] as String;
      }).toList();

      setState(() {
        sliderImageUrls = imageUrls;
      });
    } else {
      throw Exception('Failed to load slider images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const SearchingPage());
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: ViwahaColor.primary),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(
                            'search'.tr(),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
            child: CarouselSlider(
              items: sliderImageUrls.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: child,
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Image.network(
                          'https://viwaha.lk/assets/img/logo/no_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  // Handle page change
                },
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      Text(
                        'home_main_title'.tr(),
                        // 'Discover everything you need to plan your big day',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.pink[300],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const CardView(),
          const SizedBox(
            height: 16,
          ),
          const PremiumVendors(),
          const SizedBox(
            height: 16,
          ),
          const TopListing(),
          const SizedBox(
            height: 16,
          ),
          const PopularCities(),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}
