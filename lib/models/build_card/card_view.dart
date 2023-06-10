import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Browse the most',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: ' desirable categories',
                style: TextStyle(
                  color: ViwahaColor.primary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3, // Number of columns in the grid
          children: [
            _buildCard(
              'Venues',
              Assets.lib.assets.images.weddingVenues.image(),
              () async {
                AutoRouter.of(context).push(const VenuesRoute());
              },
            ),
            _buildCard('Dressing', Assets.lib.assets.images.dressing.image(),
                () {
              AutoRouter.of(context).push(const DressingRoute());
            }),
            _buildCard(
              'Jewelry',
              Assets.lib.assets.images.jewelry.image(),
              () {
                // Action for when Card 3 is clicked
              },
            ),
            _buildCard(
              'Decorations',
              Assets.lib.assets.images.decorations.image(),
              () {
                // Action for when Card 4 is clicked
              },
            ),
            _buildCard(
              'Photography',
              Assets.lib.assets.images.photography.image(),
              () {
                // Action for when Card 5 is clicked
              },
            ),
            _buildCard(
              'Entertainment',
              Assets.lib.assets.images.entertainment.image(),
              () {
                // Action for when Card 6 is clicked
              },
            ),
            _buildCard(
              'Salon',
              Assets.lib.assets.images.makeup.image(),
              () {
                // Action for when Card 7 is clicked
              },
            ),
            _buildCard(
              'Food',
              Assets.lib.assets.images.food.image(),
              () {
                // Action for when Card 8 is clicked
              },
            ),
            _buildCard(
              'Honeymoon',
              Assets.lib.assets.images.honeymoon.image(),
              () {
                // Action for when Card 9 is clicked
              },
            ),
            _buildCard(
              'Wedding Car',
              Assets.lib.assets.images.weddingCars.image(),
              () {
                // Action for when Card 10 is clicked
              },
            ),
            _buildCard(
              'Music',
              Assets.lib.assets.images.music.image(),
              () {
                // Action for when Card 11 is clicked
              },
            ),
            _buildCard(
              'Others',
              Assets.lib.assets.images.others.image(),
              () {
                // Action for when Card 12 is clicked
              },
            ),
            // Add more cards as needed
          ],
        ),
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
