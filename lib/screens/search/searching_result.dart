// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
class SearchingResultsPage extends ConsumerStatefulWidget {
  const SearchingResultsPage({super.key});
  @override
  _SearchingResultsPageState createState() => _SearchingResultsPageState();
}

class _SearchingResultsPageState extends ConsumerState<SearchingResultsPage> {
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
  Widget build(BuildContext context) {
    final searchingResult = ref.watch(searchResultProvider);
    return Scaffold(
        appBar: AppBar(
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
            Container(
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
                        filtered = searchingResult
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
                    : searchingResult.isEmpty
                        ? const Center(child: NoListingPage())
                        : Expanded(
                            child: searchingResult.isNotEmpty
                                ? GridView.count(
                                    crossAxisCount: 2, // Number of columns
                                    children: List.generate(
                                      _textEditingController!.text.isNotEmpty
                                          ? filtered!.length
                                          : searchingResult
                                              .length, // Total number of cards
                                      (index) => SearchingCardItem(
                                        id: _textEditingController!
                                                .text.isNotEmpty
                                            ? filtered![index].id.toString()
                                            : searchingResult[index]
                                                .id
                                                .toString(),
                                        imagePath: (_textEditingController!
                                                        .text.isNotEmpty
                                                    ? filtered![index].image
                                                    : searchingResult[index]
                                                        .image) !=
                                                null
                                            ? "https://viwaha.lk/${_textEditingController!.text.isNotEmpty ? filtered![index].image.toString() : searchingResult[index].image.toString()}"
                                            : ref
                                                .read(homeControllerProvider)
                                                .getTumbImage(
                                                    _textEditingController!
                                                            .text.isNotEmpty
                                                        ? filtered![index]
                                                            .thumb_images
                                                        : searchingResult[index]
                                                            .thumb_images)
                                                .first, // Replace with your image paths
                                        title: _textEditingController!
                                                .text.isNotEmpty
                                            ? filtered![index].title.toString()
                                            : searchingResult[index]
                                                .title
                                                .toString(),
                                        description: _textEditingController!
                                                .text.isNotEmpty
                                            ? filtered![index]
                                                .description
                                                .toString()
                                            : searchingResult[index]
                                                .description
                                                .toString(),
                                        starRating: (_textEditingController!
                                                        .text.isNotEmpty
                                                    ? filtered![index]
                                                        .average_rating
                                                    : searchingResult[index]
                                                        .average_rating) !=
                                                null
                                            ? double.parse(
                                                _textEditingController!
                                                        .text.isNotEmpty
                                                    ? filtered![index]
                                                        .average_rating
                                                        .toString()
                                                    : searchingResult[index]
                                                        .average_rating
                                                        .toString())
                                            : 0,
                                        location: _textEditingController!
                                                .text.isNotEmpty
                                            ? filtered![index]
                                                .location
                                                .toString()
                                            : searchingResult[index]
                                                .location
                                                .toString(),
                                        date: _textEditingController!
                                                .text.isNotEmpty
                                            ? filtered![index]
                                                .datetime
                                                .toString()
                                            : searchingResult[index]
                                                .datetime
                                                .toString(),
                                        type: '',
                                        isFav:
                                            _textEditingController!
                                                    .text.isNotEmpty
                                                ? filtered![index]
                                                    .is_favourite
                                                    .toString()
                                                : searchingResult[index]
                                                    .is_favourite
                                                    .toString(),
                                        // Replace with the appropriate star rating value
                                      ),
                                    ),
                                  )
                                : NoListingPage()),
          ],
        ));
  }
}
