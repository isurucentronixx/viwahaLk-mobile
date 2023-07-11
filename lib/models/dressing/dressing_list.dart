// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';

import '../favorite.dart';

class DressingViewList extends StatefulWidget {
  const DressingViewList({super.key});

  @override
  State<DressingViewList> createState() => _DressingViewListState();
}

class _DressingViewListState extends State<DressingViewList> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0), 
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of columns
              children: List.generate(
                8, // Total number of cards
                (index) => CardItem(
                  imagePath: Assets.lib.assets.images.bgCard
                      .path, // Replace with your image paths
                  title: 'Dressing $index',
                  description: 'Description for dressing $index',
                  starRating:
                      4.5, // Replace with the appropriate star rating value
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double starRating;

  const CardItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black87.withOpacity(0.4), BlendMode.darken),
                ),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FavoriteIcon(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            "09th May 2023",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: ViwahaColor.primary,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Location Name',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const SizedBox(width: 4),
                    Text(starRating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
