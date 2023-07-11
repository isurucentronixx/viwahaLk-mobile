import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/models/build_card/card_view.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(const SearchingPage());
                  },
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            'Search',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          const CardView(),
          const PremiumVendors(),
          const TopListing(),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
