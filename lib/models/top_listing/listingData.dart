// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/services/functions.dart';

class ListingData {
  final int rating;
  final String title;
  final String description;
  final String date;
  final String imagePath;

  ListingData({
    required this.rating,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
  });
}

final List<ListingData> listing = [
  ListingData(
    rating: 5,
    title: 'Excellent Service',
    date: "09 May 2023",
    description: 'Catogery 01',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  ListingData(
    rating: 4,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 02',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  ListingData(
    rating: 4,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 03',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  ListingData(
    rating: 5,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 04',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
];

class FavoriteIcon extends ConsumerStatefulWidget {
    final String listingId;
  const FavoriteIcon(this.listingId,{super.key});

  

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends ConsumerState<FavoriteIcon> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
     final controller = ref.watch(postControllerProvider);
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;

          controller.addFavorite(widget.listingId).then((value) => {
                print('ADDED......'),
              });
        });
      },
      child: Icon(
        Icons.favorite,
        color: isFavorite ? ViwahaColor.primary : Colors.white,
      ),
    );
  }
}
