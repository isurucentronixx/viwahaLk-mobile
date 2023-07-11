// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';

class FeedbackModel {
  final int rating;
  final String title;
  final String description;
  final String date;
  final String imagePath;

  FeedbackModel({
    required this.rating,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
  });
}

final List<FeedbackModel> feedbacks = [
  FeedbackModel(
    rating: 5,
    title: 'Excellent Service',
    date: "09 May 2023",
    description: 'Catogery 01',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  FeedbackModel(
    rating: 4,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 02',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  FeedbackModel(
    rating: 4,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 03',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  FeedbackModel(
    rating: 5,
    title: 'Great Experience',
    date: "09 May 2023",
    description: 'Catogery 04',
    imagePath: Assets.lib.assets.images.bgCard.path,
  ),
  // Add more feedbacks as needed
];

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({super.key});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: Icon(
        Icons.favorite,
        color: isFavorite ? ViwahaColor.primary : Colors.white,
      ),
    );
  }
}
