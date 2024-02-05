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
import 'package:viwaha_lk/screens/cards/searching_list_card.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class ViewAllPremiumsPage extends ConsumerStatefulWidget {
  const ViewAllPremiumsPage({super.key});
  @override
  _ViewAllPremiumsPageState createState() => _ViewAllPremiumsPageState();
}

class _ViewAllPremiumsPageState extends ConsumerState<ViewAllPremiumsPage> {
  List<SearchResultItem> searchingResult = [];

  bool isAddLoading = false;
  final scrollController = ScrollController();
  String _orderBy = 'Select One';
  bool isGridView = true;
  List<S2Choice<String>>? orderByData = [
    S2Choice<String>(value: 'asc', title: 'Accending'),
    S2Choice<String>(value: 'desc', title: 'Decending'),
  ];

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
    if (searchingResult.length < ref.watch(vendorsProvider).length) {
      searchingResult.addAll(ref.watch(vendorsProvider));
    }

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
          title: const Text('View All Premiums'),
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
                      setState(() {});
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
                : searchingResult.isEmpty
                    ? const Center(child: NoListingPage())
                    : searchingResult.isNotEmpty
                        ? Expanded(
                            child: isGridView
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
                                          id: searchingResult[index]
                                              .id
                                              .toString(),
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
                                              ? double.parse(
                                                  searchingResult[index]
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
                                        return Padding(
                                          padding: EdgeInsets.all(8.0),
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
                                          ),
                                        );
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
                                          id: searchingResult[index]
                                              .id
                                              .toString(),
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
                                              ? double.parse(
                                                  searchingResult[index]
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
                                        );
                                      } else {
                                        return Shimmer.fromColors(
                                          baseColor: Colors.grey.shade100,
                                          highlightColor: Colors.grey.shade300,
                                          child: const Card(
                                            child: SizedBox(
                                              height: 150,
                                              width: 150,
                                            ),
                                          ),
                                        );
                                      }
                                    }),
                          )
                        : const NoListingPage(),
          ],
        ));
  }
}
