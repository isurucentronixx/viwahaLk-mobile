// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

import '../../appColor.dart';
import '../../gen/assets.gen.dart';
import '../../routes/router.gr.dart';
import '../favorite.dart';

class SingleItemLatest extends ConsumerWidget {
  final String type;
  const SingleItemLatest(this.type, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Vendor> premiumVendorsList = [];
    List<TopListing> topListingList = [];
    List<CardModel> cardList = [];
    final data = ref.watch(vendorsProvider);
    // final data = ref.watch(topListingProvider);
    if (type == "vendor") {
      premiumVendorsList = ref.read(vendorsProvider);
      premiumVendorsList.forEach((e) {
        CardModel cardModel = CardModel(
            id: e.id,
            imagePath: e.image != null
                ? "https://viwaha.lk/${e.image.toString()}"
                : ref
                    .read(homeControllerProvider)
                    .getTumbImage(e.thumb_images)
                    .first,
            title: e.title,
            description: e.description,
            starRating:
                e.average_rating != null ? e.average_rating.toString() : '0',
            location: e.location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      });
    } else if (type == "topListing") {
      topListingList = ref.read(topListingProvider);
      topListingList.forEach((e) {
        CardModel cardModel = CardModel(
            id: e.id,
            imagePath: e.image != null
                ? "https://viwaha.lk/${e.image.toString()}"
                : ref
                    .read(homeControllerProvider)
                    .getTumbImage(e.thumb_images)
                    .first,
            title: e.title,
            description: e.description,
            starRating:
                e.average_rating != null ? e.average_rating.toString() : '0',
            location: e.location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      });
    } else {
      premiumVendorsList = ref.read(vendorsProvider);
      premiumVendorsList.forEach((e) {
        CardModel cardModel = CardModel(
            id: e.id,
            imagePath: e.image != null
                ? "https://viwaha.lk/${e.image.toString()}"
                : ref
                    .read(homeControllerProvider)
                    .getTumbImage(e.thumb_images)
                    .first,
            title: e.title,
            description: e.description,
            starRating:
                e.average_rating != null ? e.average_rating.toString() : '0',
            location: e.location,
            date: e.datetime,
            type: 'vendor');
        cardList.add(cardModel);
      });
      topListingList = ref.read(topListingProvider);
      topListingList.forEach((e) {
        CardModel cardModel = CardModel(
            id: e.id,
            imagePath: e.image != null
                ? "https://viwaha.lk/${e.image.toString()}"
                : ref
                    .read(homeControllerProvider)
                    .getTumbImage(e.thumb_images)
                    .first,
            title: e.title,
            description: e.description,
            starRating:
                e.average_rating != null ? e.average_rating.toString() : '0',
            location: e.location,
            date: e.datetime,
            type: 'topListing');
        cardList.add(cardModel);
      });
    }

    //Remove same object in cardList
    List<CardModel> finalCardList = [...cardList.toSet()].toList();
    var inputDateFormat = DateFormat('dd MMMM, yyyy');
    finalCardList.sort(((a, b) => inputDateFormat
        .format(DateFormat("yyyy-MM-dd").parse(b.date!))
        .compareTo(
            inputDateFormat.format(DateFormat("yyyy-MM-dd").parse(a.date!)))));
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 400, // Set the desired height for the horizontal list view
        child: Column(
          children: [
            Container(
              color:
                  ViwahaColor.primary, // Set the background color for the title
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    LocaleKeys.latest.tr(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
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
                crossAxisCount: 1,
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                children: List.generate(
                  finalCardList.length > 3
                      ? 3
                      : finalCardList.length, // Total number of cards
                  (index) => CardItem(
                    imagePath: finalCardList[index].imagePath!,
                    title: finalCardList[index].title!,
                    description: finalCardList[index].description!,
                    starRating: finalCardList[index].starRating != null
                        ? double.parse(
                            finalCardList[index].starRating.toString())
                        : 0,
                    type: type,
                    date: finalCardList[index].date!,
                    location: finalCardList[index].location!,
                    id: finalCardList[index].id.toString(),
                    isFav: finalCardList[index].isFav.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends ConsumerWidget {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  final String type;
  final String isFav;

  const CardItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.type,
    required this.isFav,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        final data = type == 'vendor'
            ? ref
                .watch(vendorsProvider)
                .where((element) => title == element.title)
                .first
            : ref
                .watch(topListingProvider)
                .where((element) => title == element.title);
        if (type == 'vendor') {
          AutoRouter.of(context).push(SingleView(
              vendor: ref
                  .watch(vendorsProvider)
                  .where((element) => title == element.title)
                  .first,
              topListing: null));
        } else {
          AutoRouter.of(context).push(SingleView(
            vendor: null,
            topListing: ref
                .watch(topListingProvider)
                .where((element) => title == element.title)
                .first,
          ));
        }
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                width: 200,
                height: 500,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.black,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Center(
                        child: Image.network(
                          'https://viwaha.lk/assets/img/logo/no_image.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavoriteIcon(id, isFav != "0" ? true : false),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: Text(
                              '${Jiffy.parse(date).format(pattern: 'do MMMM  yyyy')}',
                              style: const TextStyle(
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: ViwahaColor.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
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
      ),
    );
  }
}
