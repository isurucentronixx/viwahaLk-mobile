// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
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
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class FavListingPage extends ConsumerStatefulWidget {
  const FavListingPage({super.key});
  @override
  _FavListingPageState createState() => _FavListingPageState();
}

class _FavListingPageState extends ConsumerState<FavListingPage> {
  @override
  Widget build(BuildContext context) {
    final favListing = ref.watch(favListingProvider);

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
          ? favListing.isNotEmpty 
              ? GridView.count(
                  crossAxisCount: 2, // Number of columns
                  children: List.generate(
                    favListing.length, // Total number of cards
                    (index) => SearchingCardItem(
                      imagePath: ref
                          .read(homeControllerProvider)
                          .getTumbImage(favListing[index].thumb_images)
                          .first, // Replace with your image paths
                      title: favListing[index].title.toString(),
                      description: favListing[index].description.toString(),
                      starRating: 4.5,
                      location: favListing[index].location.toString(),
                      date: favListing[index].datetime.toString(),
                      type: '',
                      // Replace with the appropriate star rating value
                    ),
                  ),
                )
              : const Center(
                  child: Center(
                  child: CircularProgressIndicator(),
                )):Center(
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
