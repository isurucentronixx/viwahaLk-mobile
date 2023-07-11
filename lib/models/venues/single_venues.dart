import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/venues/single_page_content/single_page_content.dart';
import '../menu_item.dart';
import '../releted_items/releted.dart';

@RoutePage()
class VenusesSingleView extends StatefulWidget {
  const VenusesSingleView({super.key});

  @override
  State<VenusesSingleView> createState() => _VenusesSingleViewState();
}

class _VenusesSingleViewState extends State<VenusesSingleView> {
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    filteredItems.addAll(items);
  }

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
        title: const Text("SIngle Items"),
      ),
      drawer: const DrawerMenu(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SliderView(),
            SizedBox(height: 20),
            SingleItemOverview(),
            SingleItemDescription(),
            SingleItemContactInfo(),
            SingleItemMap(),
            SingleItemRelated()
          ],
        ),
      ),
    );
  }
}
