// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/card/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class SearchingResultsPage extends ConsumerStatefulWidget {
  const SearchingResultsPage({super.key});
  @override
  _SearchingResultsPageState createState() => _SearchingResultsPageState();
}

class _SearchingResultsPageState extends ConsumerState<SearchingResultsPage> {
  @override
  Widget build(BuildContext context) {
    final searchingResult = ref.watch(searchResultProvider);
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('Results'),
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.0),
            //       border: Border.all(color: Colors.grey),
            //     ),
            //     child: Column(
            //       children: [
            //         TextField(
            //           controller: _searchController,
            //           decoration: const InputDecoration(
            //             labelText: 'Search',
            //             prefixIcon: Icon(Icons.search),
            //             border: InputBorder.none,
            //           ),
            //           onChanged: (value) => _runFilter(value),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 15),
            Expanded(
                child: searchingResult.isNotEmpty
                    ? GridView.count(
                        crossAxisCount: 2, // Number of columns
                        children: List.generate(
                          searchingResult.length, // Total number of cards
                          (index) => SearchingCardItem(
                            imagePath: ref
                                .read(homeControllerProvider)
                                .getTumbImage(
                                    searchingResult[index].thumb_images)
                                .first, // Replace with your image paths
                            title: searchingResult[index].title.toString(),
                            description:
                                searchingResult[index].description.toString(),
                            starRating: 4.5,
                            location:
                                searchingResult[index].location.toString(),
                            date: searchingResult[index].datetime.toString(),
                            type: '',
                            // Replace with the appropriate star rating value
                          ),
                        ),
                      )
                    : const Center(
                        child: Center(
                        child: CircularProgressIndicator(),
                      ))),
          ],
        ));
  }
}
