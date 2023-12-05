// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../../appColor.dart';
import '../../routes/router.gr.dart';
import '../../models/favorite.dart';

class SingleItemOtherLatest extends ConsumerWidget {
  final String type;
  const SingleItemOtherLatest(this.type, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SearchResultItem> premiumVendorsList = [];
    List<SearchResultItem> topListingList = [];
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
            type: 'vendor',
            isFav: e.is_favourite.toString());
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
            type: 'topListing',
            isFav: e.is_favourite.toString());
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
            type: 'vendor',
            isFav: e.is_favourite.toString());
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
            type: 'topListing',
            isFav: e.is_favourite.toString());
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
    if (type != 'vendor') finalCardList.removeRange(0, 10);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 350, // Set the desired height for the horizontal list view
        child: Column(
          children: [
            Container(
              color:
                  ViwahaColor.primary, // Set the background color for the title
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Other Latest Listing',
                    style: TextStyle(
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
                  finalCardList.length > 11
                      ? 11
                      : finalCardList.length, // Total number of cards
                  (index) => index != 10
                      ? CardItem(
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
                          boosted: finalCardList[index].boosted.toString(),
                        )
                      : Container(
                          height: 100,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ViwahaColor.primary, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              if (ref.watch(isloginProvider)) {
                                ref.read(tempReviewsProvider).clear();
                                ref.refresh(allListingProvider);
                              }
                              ref.read(isSearchingProvider.notifier).state =
                                  true;
                              AutoRouter.of(context)
                                  .push(AllListingPage(isAppBar: true));
                            },
                            child: const Center(
                                child: Text(
                              "Click here to see more listings >>",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: ViwahaColor.primary,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
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
  final String boosted;

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
    required this.boosted,
  });
  tz.TZDateTime convertToTimeZone(DateTime dateTime, String timeZoneName) {
    final location = tz.getLocation(timeZoneName);
    final deviceTimeZone = tz.TZDateTime.from(dateTime, location);
    return deviceTimeZone;
  }

  String timeAgoSinceDate(String date) {
    DateTime originalDateTime = DateTime.now(); // Your original date and time
    String deviceTimeZone = tz.local.name; // Device's time zone
    tz.TZDateTime deviceDateTime =
        convertToTimeZone(originalDateTime, deviceTimeZone);
    tz.TZDateTime listingDateTime =
        convertToTimeZone(DateTime.parse(date), deviceTimeZone);
    final now = deviceDateTime;
    final difference = now.difference(listingDateTime);

    if (difference.inSeconds < 60) {
      return 'few seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(currentListingIdProvider.notifier).state = id.toString();
        if (type == 'vendor') {
          AutoRouter.of(context).push(SearchSingleView(
              item: ref
                  .watch(vendorsProvider)
                  .where((element) => id == element.id)
                  .first,
              type: "vendor"));
        } else {
          AutoRouter.of(context).push(SearchSingleView(
              item: ref
                  .watch(topListingProvider)
                  .where((element) => id == element.id)
                  .first,
              type: "top"));
        }
      },
      child: Container(
        height: 100,
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
                          child: FavoriteIcon(id, isFav == "1" ? true : false),
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
                              child: boosted != "null"
                                  ? Text(
                                      "Boosted ${timeAgoSinceDate(boosted)}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      timeAgoSinceDate(date),
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
                      overflow: TextOverflow.ellipsis,
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
                    // Text(
                    //   description,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(fontSize: 12),
                    // ),
                    // const SizedBox(height: 8),
                    Row(
                      children: [
                        starRating.toString() != '0.0'
                            ? const Icon(Icons.star, color: Colors.yellow)
                            : const Icon(Icons.star_border,
                                color: Colors.yellow),
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
      ),
    );
  }
}
