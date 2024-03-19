// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/all_listing/all_listing.dart';
import 'package:viwaha_lk/screens/cards/searching_list_card.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class SearchingResultsPage extends ConsumerStatefulWidget {
  const SearchingResultsPage({super.key});
  @override
  _SearchingResultsPageState createState() => _SearchingResultsPageState();
}

class _SearchingResultsPageState extends ConsumerState<SearchingResultsPage> {
  List<SearchResultItem> searchingResult2 = [];

  bool isAddLoading = false;
  final scrollController = ScrollController();
  String _orderBy = 'Select One';
  bool isGridView = false;
  List<S2Choice<String>>? orderByData = [
    S2Choice<String>(value: 'asc', title: 'Accending'),
    S2Choice<String>(value: 'desc', title: 'Decending'),
  ];
  bool collaps = false;

  @override
  void initState() {
    super.initState();
    ref.refresh(paginateIndexProvider);
    scrollController.addListener(_scrollListner);
  }

  String isMembership(String text) {
    int end = text.length > 2 ? 2 : 0;
    String isMembership =
        ref.read(userProvider).user?.membership.toString() ?? "0";
    String visiblePart = text.substring(0, end);
    String hiddenPart =
        text.substring(end, text.length).replaceAll(RegExp(r'.'), 'X');
    String remainingPart = text.substring(text.length);
    String modifiedText = visiblePart + hiddenPart + remainingPart;

    return isMembership == "1" ? text : modifiedText;
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
    ref.read(tempReviewsProvider).clear();
    searchingResult2.addAll(ref.watch(searchResultProvider));
    //remove duplicates
    List<SearchResultItem> searchingResult = searchingResult2.toSet().toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ViwahaColor.primary,
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
                            const Icon(Icons.search,
                                color: ViwahaColor.primary),
                            const SizedBox(width: 5),
                            Text(
                              'search'.tr(),
                              style: const TextStyle(
                                  fontSize: 16, color: ViwahaColor.primary),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                !ref.read(isSearchingProvider)
                    ? Wrap(
                        children: [
                          "${ref.watch(selectedSubLocationProvider).sub_location_en ?? ref.watch(selectedMainLocationProvider)}" !=
                                  ""
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
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
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ToggleButtons(
                    borderColor: ViwahaColor.primary,
                    selectedBorderColor: ViwahaColor.primary,
                    borderRadius: BorderRadius.circular(5),
                    constraints:
                        const BoxConstraints(minWidth: 30, minHeight: 30),
                    onPressed: (int index) {
                      setState(() {
                        isGridView = index == 0;
                      });
                    },
                    isSelected: [isGridView, !isGridView],
                    children: const [
                      Icon(
                        Icons.grid_on_outlined,
                        color: ViwahaColor.primary,
                      ),
                      Icon(Icons.list, color: ViwahaColor.primary),
                    ],
                  ),
                  SmartSelect<String>.single(
                    modalFilterAuto: true,
                    modalFilter: true,
                    title: 'Order by',
                    selectedValue: _orderBy,
                    choiceItems: orderByData,
                    onChange: (selected) {
                      setState(() {
                        searchingResult = [];

                        ref.read(selectedOrderProvider.notifier).state =
                            selected.value;
                        ref.refresh(searchResultProvider);
                      });
                    },
                    modalType: S2ModalType.bottomSheet,
                    tileBuilder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          state.showModal();
                        },
                        child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(color: ViwahaColor.primary),
                            ),
                            child: const Icon(
                              Icons.sort,
                              size: 20,
                              color: ViwahaColor.primary,
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ref.watch(isSearchingProvider)
                ? const Center(child: CircularProgressIndicator())
                : ref.watch(isEmptySearchingProvider) && searchingResult.isEmpty
                    ? const Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Opacity(
                              opacity: 0.5,
                              child: Icon(Icons.comments_disabled_outlined,
                                  size: 50, color: Colors.grey)),
                          Text(
                            "No listings were found",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ))
                    : Expanded(
                        child: isGridView
                            ? GridView.builder(
                                controller: scrollController,
                                itemCount: isAddLoading
                                    ? searchingResult.length + 2
                                    : searchingResult.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      calculateCrossAxisCount(context),
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
                                                  .main_category ==
                                              "Proposal"
                                          ? isMembership(
                                              searchingResult[index].title!)
                                          : searchingResult[index]
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
                                      location:
                                          '${searchingResult[index].location.toString()}, ${searchingResult[index].main_location.toString()}',
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
                                    return !ref.watch(isEmptySearchingProvider)
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey.shade100,
                                              highlightColor:
                                                  Colors.grey.shade300,
                                              child: Card(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ),
                                              ),
                                            ))
                                        : const Center(
                                            child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: Icon(
                                                      Icons
                                                          .comments_disabled_outlined,
                                                      size: 50,
                                                      color: Colors.grey)),
                                              Text(
                                                "Not found",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                            ],
                                          ));
                                  }
                                })
                            : ListView.builder(
                                controller: scrollController,
                                itemCount: isAddLoading
                                    ? searchingResult.length + 1
                                    : searchingResult.length,
                                itemBuilder: (context, index) {
                                  if (index < searchingResult.length) {
                                    return SearchingListItem(
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
                                              .first,
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
                                      location:
                                          '${searchingResult[index].location.toString()}, ${searchingResult[index].main_location.toString()}',
                                      date: searchingResult[index]
                                          .datetime
                                          .toString(),
                                      type: 'all',
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
                                      isTop: false,
                                    );
                                  } else {
                                    return !ref.watch(isEmptySearchingProvider)
                                        ? Shimmer.fromColors(
                                            baseColor: Colors.grey.shade100,
                                            highlightColor:
                                                Colors.grey.shade300,
                                            child: const Card(
                                              child: SizedBox(
                                                height: 150,
                                                width: 150,
                                              ),
                                            ),
                                          )
                                        : const Center(
                                            child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Opacity(
                                                  opacity: 0.5,
                                                  child: Icon(
                                                      Icons
                                                          .comments_disabled_outlined,
                                                      size: 50,
                                                      color: Colors.grey)),
                                              Text(
                                                "No listings were found",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                            ],
                                          ));
                                  }
                                }),
                      )
          ],
        ));
  }
}
