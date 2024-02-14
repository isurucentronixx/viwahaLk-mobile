import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

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
                List<String> tags = [];

                var selectedTags = ref.read(categoriesProvider).firstWhere(
                    (element) => element.category == "Wedding Venues");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Venues', tags: tags));
              },
            ),
            _buildCard(
              'proposal'.tr(),
              Assets.lib.assets.images.proposal.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Proposal";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Proposal");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Proposal', tags: tags));
              },
            ),
            _buildCard(
                'dressing'.tr(), Assets.lib.assets.images.dressing.image(), () {
              ref.read(isSearchingProvider.notifier).state = true;
              ref.read(selectedMainCategoryProvider.notifier).state =
                  "Dressing";

              List<String> tags = [];

              var selectedTags = ref
                  .read(categoriesProvider)
                  .firstWhere((element) => element.category == "Dressing");

              selectedTags.sub_categories!.forEach((element) {
                tags.add(element!.sub_category!);
              });

              AutoRouter.of(context)
                  .push(CategoryListingPage(category: 'Dressing', tags: tags));
            }),
            _buildCard(
              'jewelry'.tr(),
              Assets.lib.assets.images.jewelry.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Jewelry";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Jewellery");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Jewelry', tags: tags));
              },
            ),
            _buildCard(
              'decorations'.tr(),
              Assets.lib.assets.images.decorations.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Decorations";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Decorations");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Decorations', tags: tags));
              },
            ),
            _buildCard(
              'photography'.tr(),
              Assets.lib.assets.images.photography.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Photography";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Photography");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Photography', tags: tags));
              },
            ),
            _buildCard(
              'entertainment'.tr(),
              Assets.lib.assets.images.entertainment.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Entertainment";
                List<String> tags = [];

                var selectedTags = ref.read(categoriesProvider).firstWhere(
                    (element) => element.category == "Entertainment");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Entertainment', tags: tags));
              },
            ),
            _buildCard(
              'salon'.tr(),
              Assets.lib.assets.images.makeup.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Salon";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Makeup");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Salon', tags: tags));
              },
            ),
            _buildCard(
              'food'.tr(),
              Assets.lib.assets.images.food.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Food";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Food");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Food', tags: tags));
              },
            ),
            _buildCard(
              'honeymoon'.tr(),
              Assets.lib.assets.images.honeymoon.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Honeymoon";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Honeymoon");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Honeymoon', tags: tags));
              },
            ),
            _buildCard(
              'wedding_car'.tr(),
              Assets.lib.assets.images.weddingCars.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Wedding Car";
                List<String> tags = [];

                var selectedTags = ref.read(categoriesProvider).firstWhere(
                    (element) => element.category == "Wedding Cars");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context).push(
                    CategoryListingPage(category: 'Wedding Car', tags: tags));
              },
            ),
            _buildCard(
              'music'.tr(),
              Assets.lib.assets.images.music.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state = "Music";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Music");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Music', tags: tags));
              },
            ),
            const SizedBox(),
            _buildCard(
              'others'.tr(),
              Assets.lib.assets.images.others.image(),
              () {
                ref.read(isSearchingProvider.notifier).state = true;
                ref.read(selectedMainCategoryProvider.notifier).state =
                    "Others";
                List<String> tags = [];

                var selectedTags = ref
                    .read(categoriesProvider)
                    .firstWhere((element) => element.category == "Others");

                selectedTags.sub_categories!.forEach((element) {
                  tags.add(element!.sub_category!);
                });
                AutoRouter.of(context)
                    .push(CategoryListingPage(category: 'Others', tags: tags));
              },
            ),
            const SizedBox(),
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
