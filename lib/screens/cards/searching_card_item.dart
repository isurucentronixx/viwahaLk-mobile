// ignore_for_file: unnecessary_null_comparison

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class SearchingCardItem extends ConsumerWidget {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  final String type;
  final String isFav;
  final bool isPremium;
  final String boostedDate;
  final dynamic item;

  const SearchingCardItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.type,
    required this.isFav,
    required this.isPremium,
    required this.boostedDate,
    required this.item,
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
    DateTime dt1 =
        boostedDate != "null" ? DateTime.parse(boostedDate) : DateTime.now();
    DateTime dt2 = DateTime.now();

    return GestureDetector(
      onTap: () {
        ref.read(currentListingIdProvider.notifier).state = item.id.toString();
        AutoRouter.of(context).push(SearchSingleView(
            item: item,
            type: type == "myAd"
                ? 'myAd'
                : type == "fav"
                    ? 'fav'
                    : type == "cat"
                        ? 'cat'
                        : type == "all"
                            ? 'all'
                            : ''));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: type == 'fav' ? 85 : 100,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
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
                  isPremium
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.9),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Wrap(
                                children: [
                                  Icon(
                                    Icons.workspace_premium,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "PREMIUM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  dt1.compareTo(dt2) > 0
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ViwahaColor.primary.withOpacity(0.8),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                "TOP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent
                        ],
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
                  (date != "null")
                      ? (date != null)
                          ? (date != "")
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: boostedDate != "null"
                                            ? Text(
                                                "Boosted ${timeAgoSinceDate(boostedDate)}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Text(
                                                timeAgoSinceDate(date),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                          : Container()
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: 120,
                    child: Center(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            if (location != "null" && location != null && location != "")
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 16,
                          color: ViwahaColor.primary,
                        ),
                        Expanded(
                          child: Text(
                            location.toString(),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14.0),
                          ),
                        ),
                      ]),
                ),
              ),
            const SizedBox(
              height: 4,
            ),
            if (starRating.toString() != "null" &&
                starRating != null &&
                starRating.toString() != "")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    itemSize: 15,
                    initialRating: double.parse(starRating.toString()),
                    minRating: 0,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(width: 4),
                  Text(
                      '(${(double.parse(starRating.toString())).roundToDouble()})'),
                ],
              ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
