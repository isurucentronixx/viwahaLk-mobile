import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/models/build_card/card_view.dart';
import 'package:viwaha_lk/models/popular_cities/popular_cities.dart';
import 'package:viwaha_lk/models/premium_vender/premium_vendors.dart';
import 'package:viwaha_lk/models/top_listing/top_listing.dart';

import 'package:viwaha_lk/routes/router.gr.dart';

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
  }

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            // color: Colors.black,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.network(
                    'https://viwaha.lk/assets/img/q5.jpg',
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
                        child: CircularProgressIndicator(
                            // value: progress.cumulativeBytesLoaded /
                            //     progress.expectedTotalBytes!.toDouble(),
                            ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text('Failed to load image'),
                      );
                    },
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
                              // Stroked text as border.
                              Text(
                                'Discover everything you need to plan your big day',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 4
                                    ..color = Colors.white,
                                ),
                              ),
                              // Solid text as fill.
                              Text(
                                'Discover everything you need to plan your big day',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.pink[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const SearchingPage());
                              },
                              child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border:
                                        Border.all(color: ViwahaColor.primary),
                                  ),
                                  child: const Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.search, color: Colors.grey),
                                      SizedBox(width: 5),
                                      Text(
                                        'Search',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          height: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     Card(
          //       child: Column(
          //         children: [

          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          const CardView(),
          const SizedBox(
            height: 16,
          ),
          const PopularCities(),
          const SizedBox(
            height: 16,
          ),
          const PremiumVendors(),
          const SizedBox(
            height: 16,
          ),
          const TopListing(),
          const SizedBox(height: 75),
        ],
      ),
    );
  }
}
