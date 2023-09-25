// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class AllListingPage extends ConsumerStatefulWidget {
  const AllListingPage({super.key});
  @override
  _AllListingPageState createState() => _AllListingPageState();
}

class _AllListingPageState extends ConsumerState<AllListingPage> {
  @override
  Widget build(BuildContext context) {
    final allListing = ref.watch(allListingProvider);

    @override
    initState() {
      // at the beginning, all users are shown
      super.initState();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
          body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: const Column(
              children: [
                TextField(
                  // controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  // onChanged: (value) => _runFilter(value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: allListing.isNotEmpty
                ? GridView.count(
                    crossAxisCount: 2, // Number of columns
                    children: List.generate(
                      allListing.length, // Total number of cards
                      (index) => SearchingCardItem(
                        id: allListing[index].id.toString(),
                        imagePath: allListing[index].image != null  
                            ? "https://viwaha.lk/${allListing[index].image.toString()}"
                            : ref
                                .read(homeControllerProvider)
                                .getTumbImage(allListing[index].thumb_images)
                                .first,
                        // Replace with your image paths
                        title: allListing[index].title.toString(),
                        description: allListing[index].description.toString(),
                        starRating: allListing[index].average_rating != null
                            ? double.parse(
                                allListing[index].average_rating.toString())
                            : 0,
                        location: allListing[index].location.toString(),
                        date: allListing[index].datetime.toString(),
                        type: 'all',
                        // Replace with the appropriate star rating value
                      ),
                    ),
                  )
                : NoListingPage(),
          ),
        ],
      )),
    );
  }
}
