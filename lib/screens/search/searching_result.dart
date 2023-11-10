// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
// import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class SearchingResultsPage extends ConsumerStatefulWidget {
  const SearchingResultsPage({super.key});
  @override
  _SearchingResultsPageState createState() => _SearchingResultsPageState();
}

class _SearchingResultsPageState extends ConsumerState<SearchingResultsPage> {
  List<SearchResultItem> searchingResult = [];

  bool isAddLoading = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.refresh(paginateIndexProvider);
    scrollController.addListener(_scrollListner);
  }

  void _scrollListner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isAddLoading = true;
      });
      ref.read(paginateIndexProvider.notifier).state =
          ref.watch(paginateIndexProvider) + 1;
      setState(() {
        isAddLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    searchingResult.addAll(ref.watch(searchResultProvider));
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomePage());
                    },
                    child: SizedBox(
                      width: 100,
                      child: Assets.lib.assets.images.logo.image(),
                    ),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('Search Results'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !ref.read(isSearchingProvider)
                    ? Wrap(
                        children: [
                          "${ref.watch(selectedSubLocationProvider).sub_location_en ?? ref.watch(selectedMainLocationProvider)}" !=
                                  ""
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: ViwahaColor.primary,
                                              width: 1)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${ref.watch(selectedSubLocationProvider).sub_location_en ?? ref.watch(selectedMainLocationProvider)}",
                                                  style: const TextStyle(
                                                      color:
                                                          ViwahaColor.primary),
                                                )
                                              ]))),
                                )
                              : const SizedBox(),
                          "${ref.watch(selectedSubCategoryProvider).sub_category ?? ref.watch(selectedMainCategoryProvider)}" !=
                                  ""
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: ViwahaColor.primary,
                                              width: 1)),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${ref.watch(selectedSubCategoryProvider).sub_category ?? ref.watch(selectedMainCategoryProvider)}",
                                                  style: const TextStyle(
                                                      color:
                                                          ViwahaColor.primary),
                                                )
                                              ]))),
                                )
                              : const SizedBox(),
                        ],
                      )
                    : const SizedBox(),
                !ref.read(isSearchingProvider)
                    ? GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(const SearchingPage());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: ViwahaColor.primary,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: ViwahaColor.primary, width: 1)),
                              child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.filter_alt,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "FILTERS ",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ]))),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
            const SizedBox(height: 15),
            ref.watch(isSearchingProvider)
                ? const Center(child: CircularProgressIndicator())
                : searchingResult.isEmpty
                    ? const Center(child: NoListingPage())
                    : Expanded(
                        child: searchingResult.isNotEmpty
                            ? GridView.builder(
                                controller: scrollController,
                                itemCount: isAddLoading
                                    ? searchingResult.length + 2
                                    : searchingResult.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  if (index < searchingResult.length) {
                                    return SearchingCardItem(
                                      id: searchingResult[index].id.toString(),
                                      imagePath: (searchingResult[index]
                                                  .image) !=
                                              null
                                          ? "https://viwaha.lk/${searchingResult[index].image.toString()}"
                                          : ref
                                              .read(homeControllerProvider)
                                              .getTumbImage(
                                                  searchingResult[index]
                                                      .thumb_images)
                                              .first, // Replace with your image paths
                                      title: searchingResult[index]
                                          .title
                                          .toString(),
                                      description: searchingResult[index]
                                          .description
                                          .toString(),
                                      starRating: (searchingResult[index]
                                                  .average_rating) !=
                                              null
                                          ? double.parse(searchingResult[index]
                                              .average_rating
                                              .toString())
                                          : 0,
                                      location: searchingResult[index]
                                          .location
                                          .toString(),
                                      date: searchingResult[index]
                                          .datetime
                                          .toString(),
                                      type: '',
                                      isFav: searchingResult[index]
                                          .is_favourite
                                          .toString(),
                                      isPremium: searchingResult[index]
                                                  .premium
                                                  .toString() !=
                                              "1"
                                          ? false
                                          : true,
                                      boostedDate: searchingResult[index]
                                          .boosted
                                          .toString(),
                                      item: searchingResult[index],

                                      // Replace with the appropriate star rating value
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade100,
                                        highlightColor: Colors.grey.shade300,
                                        child: Card(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              color: Colors.grey.shade200,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                })
                            : NoListingPage()),
          ],
        ));
  }
}
