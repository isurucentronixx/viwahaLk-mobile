import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/latest_items/latest.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/single_page/single_page_content/single_page_content.dart';
import '../menu_item.dart';

@RoutePage()
class SearchSingleView extends StatefulWidget {
  final SearchResultItem? item;
  const SearchSingleView(this.item, {super.key});

  @override
  State<SearchSingleView> createState() => _SearchSingleViewState();
}

class _SearchSingleViewState extends State<SearchSingleView> {
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  //   filteredItems.addAll(items);
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  void _onSearchChanged() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Assets.lib.assets.images.logo.image(),
                ),
              ),
            ],
          ),
        ],
        title: Text(widget.item!.title.toString()),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SliderView(widget.item!.images.toString()),
            const SizedBox(height: 20),
            SingleItemOverview(
                widget.item!.datetime.toString(),
                widget.item!.location.toString(),
                widget.item!.title.toString(),
                widget.item!.views.toString()),
            SingleItemDescription(widget.item!.description.toString()),
            SingleItemContactInfo(
                widget.item!.phone.toString(),
                widget.item!.whatsapp.toString(),
                widget.item!.address.toString(),
                widget.item!.email.toString()),
            SingleItemMap(widget.item!.address.toString()),
            const SingleItemLatest('topListing')
          ],
        ),
      ),
    );
  }
}
