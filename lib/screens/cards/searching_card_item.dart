// ignore_for_file: unnecessary_null_comparison

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

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
  });

  String timeAgoSinceDate(String date) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(date));

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
    var vendorData;
    var topListingData;

    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(SearchSingleView(
            item: ref
                .watch(type == "myAd"
                    ? myListingProvider
                    : type == "fav"
                        ? favListingProvider
                        : type == "cat"
                            ? categoryListingProvider
                            : type == "all"
                                ? allListingProvider
                                : searchResultProvider)
                .where((element) => id == element.id)
                .first,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SizedBox(
                width: 200,
                height: 500,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 200,
                        width: 200,
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
                    // Image.network(
                    //   (imagePath == "null")
                    //       ? "https://viwaha.lk/assets/img/logo/no_image.jpg"
                    //       : (imagePath == null)
                    //           ? "https://viwaha.lk/assets/img/logo/no_image.jpg"
                    //           : (imagePath == "")
                    //               ? "https://viwaha.lk/assets/img/logo/no_image.jpg"
                    //               : imagePath,
                    //   fit: BoxFit.cover,
                    //   loadingBuilder: (context, child, progress) {
                    //     if (progress == null) {
                    //       return ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: SizedBox(
                    //           width: 200,
                    //           height: 200,
                    //           child: child,
                    //         ),
                    //       );
                    //     }
                    //     return const Center(
                    //       child: CircularProgressIndicator(
                    //           // value: progress.cumulativeBytesLoaded /
                    //           //     progress.expectedTotalBytes!.toDouble(),
                    //           ),
                    //     );
                    //   },
                    //   errorBuilder: (context, error, stackTrace) {
                    //     return Center(
                    //       child: Image.network(
                    //         'https://viwaha.lk/assets/img/logo/no_image.jpg',
                    //         fit: BoxFit.cover,
                    //       ),
                    //     );
                    //   },
                    // ),
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
                                          child: Text(
                                            timeAgoSinceDate(date),
                                            // Jiffy.parse(date).format(
                                            //     pattern: 'do MMM  yyyy'),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                            : Container()
                        : Container()
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
                  (location != "null")
                      ? (location != null)
                          ? (location != "")
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0, bottom: 0.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: ViwahaColor.primary,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          location,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container()
                          : Container()
                      : Container(),
                  // (location != "null")
                  //     ? (location != null)
                  //         ? (location != "")
                  //             ? Text(
                  //                 description
                  //                     .toString()
                  //                     .replaceAll('\r\n', " "),
                  //                 overflow: TextOverflow.ellipsis,
                  //                 style: const TextStyle(fontSize: 12),
                  //               )
                  //             : Container()
                  //         : Container()
                  //     : Container(),
                  const SizedBox(height: 4),
                  (starRating != "null")
                      ? (starRating != null)
                          ? (starRating != "")
                              ? Row(
                                  children: [
                                    starRating.toString() != '0.0'
                                        ? const Icon(Icons.star,
                                            color: Colors.yellow)
                                        : const Icon(Icons.star_border_outlined,
                                            color: Colors.yellow),
                                    // const Icon(Icons.star,
                                    //     color: Colors.yellow),
                                    const SizedBox(width: 4),
                                    Text(
                                        '${(double.parse(starRating.toString())).roundToDouble()}'),
                                  ],
                                )
                              : Container()
                          : Container()
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
