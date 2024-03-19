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
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/all_listing/all_listing.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/screens/cards/searching_list_card.dart';
import 'package:viwaha_lk/screens/menu_item.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class CategoryListingPage extends ConsumerStatefulWidget {
  final String category;
  final List<String> tags;
  const CategoryListingPage(this.category, this.tags, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryListingPageState();
}

class _CategoryListingPageState extends ConsumerState<CategoryListingPage> {
  List<SearchResultItem> allListing2 = [];

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
  initState() {
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
      // allListing = allListing;
      setState(() {
        isAddLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    allListing2.addAll(ref.watch(categoryListingProvider));
    //remove duplicates
    List<SearchResultItem> allListing = allListing2.toSet().toList();
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
          title: Text(widget.category),
        ),
        body: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              !ref.watch(isSearchingProvider)
                  ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      children: List.generate(widget.tags.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              ref.read(isSearchingProvider.notifier).state =
                                  true;

                              ref
                                  .read(isEmptySearchingProvider.notifier)
                                  .state = false;

                              ref
                                      .read(selectedSubCategoryProvider.notifier)
                                      .state =
                                  SubCategories(
                                      sub_category: widget.tags[index]);
                            });
                            AutoRouter.of(context)
                                .push(const SearchingResultsPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      widget.tags[index],
                                      style: const TextStyle(
                                          color: ViwahaColor.primary),
                                    ))),
                          ),
                        );
                      }),
                    )
                  : const SizedBox(),
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
                          allListing = [];

                          ref.read(selectedOrderProvider.notifier).state =
                              selected.value;
                          ref.refresh(categoryListingProvider);
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
                  : ref.watch(isEmptySearchingProvider) && allListing.isEmpty
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
                                      ? allListing.length + 2
                                      : allListing.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        calculateCrossAxisCount(context),
                                  ),
                                  itemBuilder: (context, index) {
                                    if (index < allListing.length) {
                                      return SearchingCardItem(
                                        id: allListing[index].id.toString(),
                                        imagePath: (allListing[index].image) !=
                                                null
                                            ? "https://viwaha.lk/${allListing[index].image.toString()}"
                                            : ref
                                                .read(homeControllerProvider)
                                                .getTumbImage(allListing[index]
                                                    .thumb_images)
                                                .first,
                                        // Replace with your image paths
                                        title:
                                            allListing[index].title.toString(),
                                        description: allListing[index]
                                            .description
                                            .toString(),
                                        starRating: (allListing[index]
                                                    .average_rating) !=
                                                null
                                            ? double.parse(allListing[index]
                                                .average_rating
                                                .toString())
                                            : 0,
                                        location: allListing[index]
                                            .location
                                            .toString(),
                                        date: allListing[index]
                                            .datetime
                                            .toString(),
                                        type: 'cat',
                                        isFav: allListing[index]
                                            .is_favourite
                                            .toString(),
                                        isPremium: allListing[index]
                                                    .premium
                                                    .toString() !=
                                                "1"
                                            ? false
                                            : true,
                                        boostedDate: allListing[index]
                                            .boosted
                                            .toString(),
                                        item: allListing[index],
                                        // Replace with the appropriate star rating value
                                      );
                                    } else {
                                      return !ref
                                              .watch(isEmptySearchingProvider)
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Shimmer.fromColors(
                                                baseColor: Colors.grey.shade100,
                                                highlightColor:
                                                    Colors.grey.shade300,
                                                child: Card(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      color:
                                                          Colors.grey.shade200,
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
                                      ? allListing.length + 1
                                      : allListing.length,
                                  itemBuilder: (context, index) {
                                    if (index < allListing.length) {
                                      return SearchingListItem(
                                        id: allListing[index].id.toString(),
                                        imagePath: (allListing[index].image) !=
                                                null
                                            ? "https://viwaha.lk/${allListing[index].image.toString()}"
                                            : ref
                                                .read(homeControllerProvider)
                                                .getTumbImage(allListing[index]
                                                    .thumb_images)
                                                .first,
                                        title:
                                            allListing[index].title.toString(),
                                        description: allListing[index]
                                            .description
                                            .toString(),
                                        starRating: (allListing[index]
                                                    .average_rating) !=
                                                null
                                            ? double.parse(allListing[index]
                                                .average_rating
                                                .toString())
                                            : 0,
                                        location:
                                            '${allListing[index].location.toString()}, ${allListing[index].main_location.toString()}',
                                        date: allListing[index]
                                            .datetime
                                            .toString(),
                                        type: 'all',
                                        isFav: allListing[index]
                                            .is_favourite
                                            .toString(),
                                        isPremium: allListing[index]
                                                    .premium
                                                    .toString() !=
                                                "1"
                                            ? false
                                            : true,
                                        boostedDate: allListing[index]
                                            .boosted
                                            .toString(),
                                        item: allListing[index],
                                        isTop: false,
                                      );
                                    } else {
                                      return !ref
                                              .watch(isEmptySearchingProvider)
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
          ),
        ));
  }
}
