// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
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
              ref.watch(isSearchingProvider)
                  ? const Center(child: CircularProgressIndicator())
                  : favListing.isEmpty
                      ? const Center(child: NoListingPage())
                      : Expanded(
                          child: GridView.count(
                          crossAxisCount: 2, // Number of columns
                          children: List.generate(
                            favListing.length, // Total number of cards
                            (index) => SearchingCardItem(
                              id: favListing[index].id.toString(),
                              imagePath: favListing[index].image != null
                                  ? "https://viwaha.lk/${favListing[index].image.toString()}"
                                  : ref
                                      .read(homeControllerProvider)
                                      .getTumbImage(
                                          favListing[index].thumb_images)
                                      .first, // Replace with your image paths
                              title: favListing[index].title.toString(),
                              description:
                                  favListing[index].description.toString(),
                              starRating:
                                  favListing[index].average_rating != null
                                      ? double.parse(favListing[index]
                                          .average_rating
                                          .toString())
                                      : 0,
                              location: favListing[index].location.toString(),
                              date: favListing[index].datetime.toString(),
                              type: 'fav',
                              isFav: favListing[index].is_favourite.toString(),
                              isPremium:
                                  favListing[index].premium.toString() != "1"
                                      ? false
                                      : true,
                              boostedDate: favListing[index].boosted.toString(),

                              // Replace with the appropriate star rating value
                            ),
                          ),
                        ))
            ],
          ),
        ));
  }
}
