// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/screens/cards/myListingCard.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class MyListingPage extends ConsumerStatefulWidget {
  const MyListingPage({super.key});
  @override
  _MyListingPageState createState() => _MyListingPageState();
}

class _MyListingPageState extends ConsumerState<MyListingPage> {
  @override
  Widget build(BuildContext context) {
    List<SearchResultItem> myListing = ref.watch(myListingProvider);
    // List<SearchResultItem> myListing;
    // final favListing = ref.watch(favListingProvider);

    @override
    initState() {
      // at the beginning, all users are shown
      super.initState();
    }

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: ref.watch(isloginProvider)
              ? myListing.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 1, // Number of columns
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                          myListing.length, // Total number of cards
                          (index) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: MyCardItem(
                                  id: myListing[index].id.toString(),
                                  date: myListing[index].datetime.toString(),
                                  description:
                                      myListing[index].description.toString(),
                                  imagePath: ref
                                      .read(homeControllerProvider)
                                      .getTumbImage(
                                          myListing[index].thumb_images)
                                      .first,
                                  location:
                                      myListing[index].location.toString(),
                                  starRating: 3,
                                  title: myListing[index].title.toString(),
                                ),
                              )
                          // SearchingCardItem(
                          //   id: myListing[index].id.toString(),
                          //   imagePath: ref
                          //       .read(homeControllerProvider)
                          //       .getTumbImage(myListing[index].thumb_images)
                          //       .first, // Replace with your image paths
                          //   title: myListing[index].title.toString(),
                          //   description: myListing[index].description.toString(),
                          //   starRating: 4.5,
                          //   location: myListing[index].location.toString(),
                          //   date: myListing[index].datetime.toString(),
                          //   type: 'myAd',
                          //   // Replace with the appropriate star rating value
                          // ),
                          ),
                    )
                  : const Center(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
              : Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        AutoRouter.of(context).push(const Login());
                      },
                      icon: const Icon(Icons.login),
                      label: const Text('Sign In'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    ));
  }
}
