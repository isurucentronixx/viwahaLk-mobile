// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/appColor.dart';
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
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

final myListingViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));
final singleListingViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

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
    final state = ref.watch(myListingViewStateProvider);
    // List<SearchResultItem> myListing;
    // final favListing = ref.watch(favListingProvider);
    Future getData() async {
      return await ref.watch(myListingProvider);
    }

    @override
    initState() {
      // at the beginning, all users are shown
      super.initState();
    }

    ref.listen<AsyncValue>(myListingViewStateProvider, (_, state) {
      state.whenData((items) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Successfully',
            message: items,
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: ViwahaColor.primary,
          ),
        );
        (items == null ? null : ScaffoldMessenger.of(context))!
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      });
    });

    return LoadingOverlay(
      isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
      color: Colors.white,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                    onTap:() {
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
            title: const Text("My Listings"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              ref.watch(isSearchingProvider)
                  ? const Center(child: CircularProgressIndicator())
                  : myListing.isEmpty
                      ? const Center(child: NoListingPage())
                      : Expanded(
                          child: GridView.count(
                          crossAxisCount: 1,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                              myListing.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MyCardItem(
                                      id: myListing[index].id.toString(),
                                      date:
                                          myListing[index].datetime.toString(),
                                      description: myListing[index]
                                          .description
                                          .toString(),
                                      imagePath: myListing[index].image != null
                                          ? "https://viwaha.lk/${myListing[index].image.toString()}"
                                          : ref
                                              .read(homeControllerProvider)
                                              .getTumbImage(
                                                  myListing[index].images)
                                              .first,
                                      location:
                                          myListing[index].location.toString(),
                                      starRating:
                                          myListing[index].average_rating !=
                                                  null
                                              ? double.parse(myListing[index]
                                                  .average_rating
                                                  .toString())
                                              : 0,
                                      title: myListing[index].title.toString(),
                                      name: myListing[index].name.toString(),
                                      main_category: myListing[index]
                                          .main_category
                                          .toString(),
                                      isFav: myListing[index]
                                          .is_favourite
                                          .toString(),
                                    ),
                                  )),
                        ))
            ],
          )),
    );
  }
}
