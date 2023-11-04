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
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class AllListingPage extends ConsumerStatefulWidget {
  final bool isAppBar;
  const AllListingPage(this.isAppBar, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AllListingPageState createState() => _AllListingPageState();
}

class _AllListingPageState extends ConsumerState<AllListingPage> {
  List<SearchResultItem>? filtered;

  final FocusNode _texrFocusNode = FocusNode();
  // ignore: unnecessary_nullable_for_final_variable_declarations
  final TextEditingController? _textEditingController = TextEditingController();

  @override
  void dispose() {
    _texrFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  initState() {
    // at the beginning, all users are shown

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allListing = ref.watch(allListingProvider);

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
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _textEditingController,
                      focusNode: _texrFocusNode,
                      onChanged: (value) {
                        setState(() {
                          filtered = allListing
                              .where((element) => element.name
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toString().toLowerCase()))
                              .toList();
                          if (_textEditingController!.text.isNotEmpty &&
                              filtered!.isEmpty) {
                            print('itemsListSearch Length ${filtered!.length}');
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            _textEditingController!.text.isNotEmpty && filtered!.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                : ref.watch(isSearchingProvider)
                    ? const Center(child: CircularProgressIndicator())
                    : allListing.isEmpty
                        ? const Center(child: NoListingPage())
                        : Expanded(
                            child: GridView.count(
                              crossAxisCount: 2, // Number of columns
                              children: List.generate(
                                _textEditingController!.text.isNotEmpty
                                    ? filtered!.length
                                    : allListing
                                        .length, // Total number of cards
                                (index) => SearchingCardItem(
                                  id: _textEditingController!.text.isNotEmpty
                                      ? filtered![index].id.toString()
                                      : allListing[index].id.toString(),
                                  imagePath: (_textEditingController!
                                                  .text.isNotEmpty
                                              ? filtered![index].image
                                              : allListing[index].image) !=
                                          null
                                      ? "https://viwaha.lk/${_textEditingController!.text.isNotEmpty ? filtered![index].image.toString() : allListing[index].image.toString()}"
                                      : ref
                                          .read(homeControllerProvider)
                                          .getTumbImage(
                                              _textEditingController!
                                                      .text.isNotEmpty
                                                  ? filtered![index]
                                                      .thumb_images
                                                  : allListing[index]
                                                      .thumb_images)
                                          .first,
                                  // Replace with your image paths
                                  title: _textEditingController!
                                          .text.isNotEmpty
                                      ? filtered![index].title.toString()
                                      : allListing[index].title.toString(),
                                  description:
                                      _textEditingController!.text.isNotEmpty
                                          ? filtered![index]
                                              .description
                                              .toString()
                                          : allListing[index]
                                              .description
                                              .toString(),
                                  starRating:
                                      (_textEditingController!.text.isNotEmpty
                                                  ? filtered![index]
                                                      .average_rating
                                                  : allListing[index]
                                                      .average_rating) !=
                                              null
                                          ? double.parse(
                                              _textEditingController!
                                                      .text.isNotEmpty
                                                  ? filtered![index]
                                                      .average_rating
                                                      .toString()
                                                  : allListing[index]
                                                      .average_rating
                                                      .toString())
                                          : 0,
                                  location: _textEditingController!
                                          .text.isNotEmpty
                                      ? filtered![index].location.toString()
                                      : allListing[index].location.toString(),
                                  date: _textEditingController!
                                          .text.isNotEmpty
                                      ? filtered![index].datetime.toString()
                                      : allListing[index].datetime.toString(),
                                  type: 'all',
                                  isFav:
                                      _textEditingController!.text.isNotEmpty
                                          ? filtered![index]
                                              .is_favourite
                                              .toString()
                                          : allListing[index]
                                              .is_favourite
                                              .toString(),
                                  isPremium: _textEditingController!
                                          .text.isNotEmpty
                                      ? filtered![index].premium.toString() !=
                                              "1"
                                          ? false
                                          : true
                                      : allListing[index]
                                                  .premium
                                                  .toString() !=
                                              "1"
                                          ? false
                                          : true,
                                  boostedDate: _textEditingController!
                                          .text.isNotEmpty
                                      ? filtered![index].boosted.toString()
                                      : allListing[index].boosted.toString(),
                                  // Replace with the appropriate star rating value
                                ),
                              ),
                            ),
                          )
          ],
        ));
  }
}
