// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/cards/searching_list_card.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class FavListingPage extends ConsumerStatefulWidget {
  final bool isAppBar;
  const FavListingPage(this.isAppBar, {super.key});
  @override
  _FavListingPageState createState() => _FavListingPageState();
}

class _FavListingPageState extends ConsumerState<FavListingPage> {
  bool isGridView = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SearchResultItem> favListing;
    // final favListing = ref.watch(favListingProvider);
    favListing = ref.watch(favListingProvider);

    return Scaffold(
        appBar: widget.isAppBar
            ? AppBar(
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
                title: const Text('My Favorites'),
              )
            : null,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  ],
                ),
              ),
              ref.watch(isSearchingProvider)
                  ? const Center(child: CircularProgressIndicator())
                  : favListing.isEmpty
                      ? const Center(child: NoListingPage())
                      : Expanded(
                          child: isGridView
                              ? GridView.builder(
                                  itemCount: favListing.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    return SearchingCardItem(
                                      id: favListing[index].id.toString(),
                                      imagePath: (favListing[index].image) !=
                                              null
                                          ? "https://viwaha.lk/${favListing[index].image.toString()}"
                                          : ref
                                              .read(homeControllerProvider)
                                              .getTumbImage(favListing[index]
                                                  .thumb_images)
                                              .first, // Replace with your image paths
                                      title: favListing[index].title.toString(),
                                      description: favListing[index]
                                          .description
                                          .toString(),
                                      starRating:
                                          (favListing[index].average_rating) !=
                                                  null
                                              ? double.parse(favListing[index]
                                                  .average_rating
                                                  .toString())
                                              : 0,
                                      location:
                                          '${favListing[index].location.toString()}, ${favListing[index].main_location.toString()}',
                                      date:
                                          favListing[index].datetime.toString(),
                                      type: 'fav',
                                      isFav: favListing[index]
                                          .is_favourite
                                          .toString(),
                                      isPremium: favListing[index]
                                                  .premium
                                                  .toString() !=
                                              "1"
                                          ? false
                                          : true,
                                      boostedDate:
                                          favListing[index].boosted.toString(),
                                      item: favListing[index],

                                      // Replace with the appropriate star rating value
                                    );
                                  })
                              : ListView.builder(
                                  itemCount: favListing.length,
                                  itemBuilder: (context, index) {
                                    return SearchingListItem(
                                      id: favListing[index].id.toString(),
                                      imagePath: (favListing[index].image) !=
                                              null
                                          ? "https://viwaha.lk/${favListing[index].image.toString()}"
                                          : ref
                                              .read(homeControllerProvider)
                                              .getTumbImage(favListing[index]
                                                  .thumb_images)
                                              .first,
                                      title: favListing[index].title.toString(),
                                      description: favListing[index]
                                          .description
                                          .toString(),
                                      starRating:
                                          (favListing[index].average_rating) !=
                                                  null
                                              ? double.parse(favListing[index]
                                                  .average_rating
                                                  .toString())
                                              : 0,
                                      location:
                                          '${favListing[index].location.toString()}, ${favListing[index].main_location.toString()}',
                                      date:
                                          favListing[index].datetime.toString(),
                                      type: 'all',
                                      isFav: favListing[index]
                                          .is_favourite
                                          .toString(),
                                      isPremium: favListing[index]
                                                  .premium
                                                  .toString() !=
                                              "1"
                                          ? false
                                          : true,
                                      boostedDate:
                                          favListing[index].boosted.toString(),
                                      item: favListing[index],
                                    );
                                  }),
                        )
            ],
          ),
        ));
  }
}
