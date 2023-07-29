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
import 'package:viwaha_lk/models/menu_item.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class CategoryListingPage extends ConsumerStatefulWidget {
  final String category;
  const CategoryListingPage(this.category, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryListingPageState();
}

class _CategoryListingPageState extends ConsumerState<CategoryListingPage> {
  @override
  Widget build(BuildContext context) {
    final allListing = ref.watch(categoryListingProvider);

    @override
    initState() {
      // at the beginning, all users are shown
      
      super.initState();
    }

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
          title: Text(widget.category),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
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
            ),
            const SizedBox(height: 15),
            Expanded(
              child: allListing.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 2, // Number of columns
                      children: List.generate(
                        allListing.length, // Total number of cards
                        (index) => SearchingCardItem(
                          imagePath: ref
                              .read(homeControllerProvider)
                              .getTumbImage(allListing[index].thumb_images)
                              .first, // Replace with your image paths
                          title: allListing[index].title.toString(),
                          description: allListing[index].description.toString(),
                          starRating: 4.5,
                          location: allListing[index].location.toString(),
                          date: allListing[index].datetime.toString(),
                          type: '',
                          // Replace with the appropriate star rating value
                        ),
                      ),
                    )
                  : const Center(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))
            ),
          ],
        ));
  }
}