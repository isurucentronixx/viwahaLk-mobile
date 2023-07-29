import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

class CardView extends ConsumerWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ref.read(selectedMainCategoryProvider.notifier).state = "Venues";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Venues'));
              },
            ),
            _buildCard('Dressing', Assets.lib.assets.images.dressing.image(),
                () {

              ref.read(selectedMainCategoryProvider.notifier).state = "Dressing";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Dressing'));
            }),
            _buildCard(
              'Jewelry',
              Assets.lib.assets.images.jewelry.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Jewelry";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Jewelry'));
              },
            ),
            _buildCard(
              'Decorations',
              Assets.lib.assets.images.decorations.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Decorations";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Decorations'));
              },
            ),
            _buildCard(
              'Photography',
              Assets.lib.assets.images.photography.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Photography";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Photography'));
              },
            ),
            _buildCard(
              'Entertainment',
              Assets.lib.assets.images.entertainment.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Entertainment";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Entertainment'));
              },
            ),
            _buildCard(
              'Salon',
              Assets.lib.assets.images.makeup.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Salon";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Salon'));
              },
            ),
            _buildCard(
              'Food',
              Assets.lib.assets.images.food.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Food";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Food'));
              },
            ),
            _buildCard(
              'Honeymoon',
              Assets.lib.assets.images.honeymoon.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Honeymoon";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Honeymoon'));
              },
            ),
            _buildCard(
              'Wedding Car',
              Assets.lib.assets.images.weddingCars.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Wedding Car";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Wedding Car'));
              },
            ),
            _buildCard(
              'Music',
              Assets.lib.assets.images.music.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Music";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Music'));
              },
            ),
            _buildCard(
              'Others',
              Assets.lib.assets.images.others.image(),
              () {
                 ref.read(selectedMainCategoryProvider.notifier).state = "Others";
                AutoRouter.of(context).push(CategoryListingPage(category: 'Others'));
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
                width: 60,
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
