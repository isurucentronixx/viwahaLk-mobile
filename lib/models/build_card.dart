import 'package:flutter/material.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';

class BuildCard extends StatefulWidget {
  const BuildCard({super.key});

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Number of columns in the grid
      children: [
        _buildCard('Venues', Assets.lib.assets.images.weddingVenues.image(),
            () {
          // Action for when Card 1 is clicked
        }),
        _buildCard('Dressing', Assets.lib.assets.images.dressing.image(), () {
          // Action for when Card 2 is clicked
        }),
        _buildCard('Jewelry', Assets.lib.assets.images.jewelry.image(), () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Decorations', Assets.lib.assets.images.decorations.image(),
            () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Photography', Assets.lib.assets.images.photography.image(),
            () {
          // Action for when Card 3 is clicked
        }),
        _buildCard(
            'Entertainment', Assets.lib.assets.images.entertainment.image(),
            () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Salon', Assets.lib.assets.images.makeup.image(), () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Food', Assets.lib.assets.images.food.image(), () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Honeymoon', Assets.lib.assets.images.honeymoon.image(), () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Weddign Car', Assets.lib.assets.images.weddingCars.image(),
            () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Music', Assets.lib.assets.images.music.image(), () {
          // Action for when Card 3 is clicked
        }),
        _buildCard('Others', Assets.lib.assets.images.others.image(), () {
          // Action for when Card 3 is clicked
        }),
        // Add more cards as needed
      ],
    );
  }

  Widget _buildCard(String title, imagePath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: imagePath,
              ),
              const SizedBox(height: 10.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
