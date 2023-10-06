import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

class CardView extends ConsumerWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'popular_categories'.tr(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'browse_the_most'.tr(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: 'desirable_categories'.tr(),
                style: const TextStyle(
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
              'venues'.tr(),
              Assets.lib.assets.images.weddingVenues.image(),
              () async {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Venues";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Venues'));
              },
            ),
            _buildCard(
                'dressing'.tr(), Assets.lib.assets.images.dressing.image(), () {
                  ref.read(isSearchingProvider.notifier).state = true;
              ref.read(selectedMainCategoryProvider.notifier).state =
                  "Dressing";
                  
              AutoRouter.of(context)
                  .push(CategoryListingPage(category: 'Dressing'));
            }),
            _buildCard(
              'jewelry'.tr(),
              Assets.lib.assets.images.jewelry.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Jewelry";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Jewelry'));
              },
            ),
            _buildCard(
              'decorations'.tr(),
              Assets.lib.assets.images.decorations.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Decorations";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Decorations'));
              },
            ),
            _buildCard(
              'photography'.tr(),
              Assets.lib.assets.images.photography.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Photography";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Photography'));
              },
            ),
            _buildCard(
              'entertainment'.tr(),
              Assets.lib.assets.images.entertainment.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Entertainment";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Entertainment'));
              },
            ),
            _buildCard(
              'salon'.tr(),
              Assets.lib.assets.images.makeup.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Salon";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Salon'));
              },
            ),
            _buildCard(
              'food'.tr(),
              Assets.lib.assets.images.food.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Food";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Food'));
              },
            ),
            _buildCard(
              'honeymoon'.tr(),
              Assets.lib.assets.images.honeymoon.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Honeymoon";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Honeymoon'));
              },
            ),
            _buildCard(
              'wedding_car'.tr(),
              Assets.lib.assets.images.weddingCars.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Wedding Car";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Wedding Car'));
              },
            ),
            _buildCard(
              'music'.tr(),
              Assets.lib.assets.images.music.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Music";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Music'));
              },
            ),
            _buildCard(
              'others'.tr(),
              Assets.lib.assets.images.others.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Others";
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Others'));
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
      padding: const EdgeInsets.all(3.0),
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
