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
  final bool? premiumVendors;
  final bool? topListing;
  const SearchingResultsPage(this.premiumVendors, this.topListing, {super.key});
  @override
  _SearchingResultsPageState createState() => _SearchingResultsPageState();
}

class _SearchingResultsPageState extends ConsumerState<SearchingResultsPage> {
  @override
  Widget build(BuildContext context) {
    final searchingResult = ref.watch(searchResultProvider);

    List<Vendor> premiumVendorsList = [];
    List<TopListing> topListingList = [];
    List<Location> locationList = [];
    List<SubLocation> subLocationList = [];
    List<CardModel> cardList = [];
    List<CardModel> cardListUpdated = [];

    if (widget.premiumVendors == true) {
      premiumVendorsList = ref.read(vendorsProvider);
      for (var e in premiumVendorsList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      }
    } else {
      premiumVendorsList = [];
    }

    if (widget.topListing == true) {
      topListingList = ref.read(topListingProvider);
      for (var e in topListingList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      }
    } else {
      topListingList = [];
    }

    if (ref.read(selectedMainCategoryProvider) != "" &&
        ref.watch(selectedSubCategoryProvider).id == null) {
      premiumVendorsList = ref
          .read(vendorsProvider)
          .where(
              (e) => e.main_category == ref.watch(selectedMainCategoryProvider))
          .toList();
      for (var e in premiumVendorsList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      }

      topListingList = ref
          .read(topListingProvider)
          .where(
              (e) => e.main_category == ref.watch(selectedMainCategoryProvider))
          .toList();
      for (var e in topListingList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      }
    }

    if (ref.watch(selectedSubCategoryProvider).id != null) {
      premiumVendorsList = ref
          .read(vendorsProvider)
          .where((e) =>
              e.category == ref.watch(selectedSubCategoryProvider).sub_category)
          .toList();
      for (var e in premiumVendorsList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      }

      topListingList = ref
          .read(topListingProvider)
          .where((e) =>
              e.category == ref.watch(selectedSubCategoryProvider).sub_category)
          .toList();
      for (var e in topListingList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      }
    }

    /////////////////////////////////////////////////////////////
    if (ref.read(selectedMainLocationProvider) != "" &&
        ref.watch(selectedSubLocationProvider).id == null) {
      premiumVendorsList = ref
          .read(vendorsProvider)
          .where(
              (e) => e.main_location == ref.watch(selectedMainLocationProvider))
          .toList();
      for (var e in premiumVendorsList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      }

      topListingList = ref
          .read(topListingProvider)
          .where(
              (e) => e.main_location == ref.watch(selectedMainLocationProvider))
          .toList();
      for (var e in topListingList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      }
    }

    if (ref.watch(selectedSubLocationProvider).id != null) {
      premiumVendorsList = ref
          .read(vendorsProvider)
          .where((e) =>
              e.location ==
              ref.watch(selectedSubLocationProvider).sub_location_en)
          .toList();
      for (var e in premiumVendorsList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      }

      topListingList = ref
          .read(topListingProvider)
          .where((e) =>
              e.location ==
              ref.watch(selectedSubLocationProvider).sub_location_en)
          .toList();
      for (var e in topListingList) {
        CardModel cardModel = CardModel(
            imagePath: ref
                .read(homeControllerProvider)
                .getTumbImage(e.thumb_images)
                .first,
            title: e.title,
            description: e.description,
            starRating: "4.5",
            location: e.location,
            mainLocation: e.main_location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      }
    }
    /////////////////////////////////////////////////////////////

    //Remove same object in cardList
    for (var e in cardList) {
      CardModel cardModel = CardModel(
          imagePath: e.imagePath,
          title: e.title,
          description: e.description,
          starRating: "4.5",
          location: e.location,
          mainLocation: e.mainLocation,
          date: e.date);
      cardListUpdated.add(cardModel);
    }

    List<CardModel> finalCardList = [...cardListUpdated.toSet()].toList();
    List<CardModel> filteredCardList = [];
    @override
    initState() {
      // at the beginning, all users are shown
      filteredCardList = finalCardList;

      super.initState();
    }

    final TextEditingController searchController = TextEditingController();
    void _runFilter(String enteredKeyword) {
      List<CardModel> results = [];
      if (enteredKeyword.isEmpty) {
        // if the search field is empty or only contains white-space, we'll display all users
        results = finalCardList;
      } else {
        results = finalCardList
            .where((card) => card.title!.toLowerCase() == enteredKeyword)
            .toList();
        // we use the toLowerCase() method to make it case-insensitive
      }

      // Refresh the UI
      setState(() {
        filteredCardList = results;
      });
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
                              .getTumbImage(searchingResult[index].thumb_images)
                              .first, // Replace with your image paths
                          title: searchingResult[index].title.toString(),
                          description:
                              searchingResult[index].description.toString(),
                          starRating: 4.5,
                          location: searchingResult[index].location.toString(),
                          date: searchingResult[index].datetime.toString(),
                          type: '',
                          // Replace with the appropriate star rating value
                        ),
                      ),
                    )
                  : const Center(child: Text("No Data Found")),
            ),
          ],
        ));
  }
}
