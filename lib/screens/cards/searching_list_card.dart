// ignore_for_file: unnecessary_null_comparison

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class SearchingListItem extends ConsumerWidget {
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

  const SearchingListItem({
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: ViwahaColor.black, blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.circular(10.0),
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
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(
                                "PREMIUM",
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
                      borderRadius: BorderRadius.circular(10),
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
                  // dt1.compareTo(dt2) > 0
                  //     ?
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ViwahaColor.primary.withOpacity(0.8),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          "TOP",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // : const SizedBox(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          // Consumer(
                          //   builder: (_, WidgetRef ref, __) {
                          //     // 3. use ref.watch() to get the value of the provider
                          //     final helloWorld = ref.watch(tempFavProvider);
                          //     return Text(helloWorld.toString());
                          //   },
                          // ),
                          // ref.watch(tempFavProvider).contains(id.toString())
                          //     ? const Icon(
                          //         Icons.favorite,
                          //         color: ViwahaColor.primary,
                          //       )
                          //     : const Icon(
                          //         Icons.favorite_border,
                          //         color: ViwahaColor.primary,
                          //       )
                          FavoriteIcon(id, isFav != "0" ? true : false),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (location != "null" && location != null && location != "")
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 100,
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
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
                    Wrap(
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
                    height: 4,
                  ),
                  if (date != "null" && date != null && date != "")
                    boostedDate != "null"
                        ? Text(
                            "Boosted ${timeAgoSinceDate(boostedDate)}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        : Text(
                            timeAgoSinceDate(date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
