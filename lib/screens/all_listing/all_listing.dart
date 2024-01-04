// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
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
import 'package:shimmer/shimmer.dart';

@RoutePage()
class AllListingPage extends ConsumerStatefulWidget {
  final bool isAppBar;
  const AllListingPage(this.isAppBar, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AllListingPageState createState() => _AllListingPageState();
}

class _AllListingPageState extends ConsumerState<AllListingPage> {
  List<SearchResultItem> allListing2 = [];
  bool isGridView = true;
  bool isAddLoading = false;
  final scrollController = ScrollController();
  String _orderBy = 'Select One';
  List<S2Choice<String>>? orderByData = [
    S2Choice<String>(value: 'asc', title: 'Accending'),
    S2Choice<String>(value: 'desc', title: 'Decending'),
  ];

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
      setState(() {
        isAddLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    allListing2.addAll(ref.watch(allListingProvider));
     //remove duplicates
    List<SearchResultItem> allListing = allListing2.toSet().toList();  
    return Scaffold(
        appBar: widget.isAppBar
            ? AppBar(
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
                title: const Text('All Listings'),
              )
            : null,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ViwahaColor.primary),
                ),
                child: Column(
                  children: [
                    TextField(
                      onTap: () =>
                          AutoRouter.of(context).push(const SearchingPage()),
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(color: ViwahaColor.primary),
                        prefixIcon: Icon(
                          Icons.search,
                          color: ViwahaColor.primary,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
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
                      setState(() {
                        allListing = [];

                        ref.read(selectedOrderProvider.notifier).state =
                            selected.value;
                        ref.refresh(allListingProvider);
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
            allListing.isNotEmpty
                ? Expanded(
                    child: isGridView
                        ? GridView.builder(
                            controller: scrollController,
                            itemCount: isAddLoading
                                ? allListing.length + 2
                                : allListing.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              if (index < allListing.length) {
                                return SearchingCardItem(
                                  id: allListing[index].id.toString(),
                                  imagePath: (allListing[index].image) != null
                                      ? "https://viwaha.lk/${allListing[index].image.toString()}"
                                      : ref
                                          .read(homeControllerProvider)
                                          .getTumbImage(
                                              allListing[index].thumb_images)
                                          .first,
                                  title: allListing[index].title.toString(),
                                  description:
                                      allListing[index].description.toString(),
                                  starRating:
                                      (allListing[index].average_rating) != null
                                          ? double.parse(allListing[index]
                                              .average_rating
                                              .toString())
                                          : 0,
                                  location:
                                      '${allListing[index].location.toString()}, ${allListing[index].main_location.toString()}',
                                  date: allListing[index].datetime.toString(),
                                  type: 'all',
                                  isFav:
                                      allListing[index].is_favourite.toString(),
                                  isPremium:
                                      allListing[index].premium.toString() !=
                                              "1"
                                          ? false
                                          : true,
                                  boostedDate:
                                      allListing[index].boosted.toString(),
                                  item: allListing[index],
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
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
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
                                ? allListing.length + 1
                                : allListing.length,
                            itemBuilder: (context, index) {
                              if (index < allListing.length) {
                                return SearchingListItem(
                                  id: allListing[index].id.toString(),
                                  imagePath: (allListing[index].image) != null
                                      ? "https://viwaha.lk/${allListing[index].image.toString()}"
                                      : ref
                                          .read(homeControllerProvider)
                                          .getTumbImage(
                                              allListing[index].thumb_images)
                                          .first,
                                  title: allListing[index].title.toString(),
                                  description:
                                      allListing[index].description.toString(),
                                  starRating:
                                      (allListing[index].average_rating) != null
                                          ? double.parse(allListing[index]
                                              .average_rating
                                              .toString())
                                          : 0,
                                  location:
                                      '${allListing[index].location.toString()}, ${allListing[index].main_location.toString()}',
                                  date: allListing[index].datetime.toString(),
                                  type: 'all',
                                  isFav:
                                      allListing[index].is_favourite.toString(),
                                  isPremium:
                                      allListing[index].premium.toString() !=
                                              "1"
                                          ? false
                                          : true,
                                  boostedDate:
                                      allListing[index].boosted.toString(),
                                  item: allListing[index],
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
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ));
  }
}
