// ignore_for_file: unnecessary_null_comparison

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

class SearchingCardItem extends ConsumerWidget {
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  final String type;

  const SearchingCardItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.type,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var vendorData;
    var topListingData;
    return GestureDetector(
      onTap: () {
       AutoRouter.of(context).push(SearchSingleView(
              item: ref
                  .watch(searchResultProvider)
                  .where((element) => title == element.title)
                  .first));
        // bool exists =
        //     ref.read(topListingProvider).any((file) => file.title == title);
        
        // print(exists);
        // if (exists) {
        //   AutoRouter.of(context).push(SingleView(
        //       vendor: null,
        //       topListing: ref
        //           .watch(topListingProvider)
        //           .where((element) => title == element.title)
        //           .first));
        // } else {
        //   AutoRouter.of(context).push(SingleView(
        //       vendor: ref
        //           .watch(vendorsProvider)
        //           .where((element) => title == element.title)
        //           .first,
        //       topListing: null));
        // }



        // if(ref.read(vendorsProvider).firstWhere((element) => element.title == title)){

        // }

        // final data = type == 'vendor'
        //     ? ref
        //         .watch(vendorsProvider)
        //         .where((element) => title == element.title)
        //         .first
        //     : ref
        //         .watch(topListingProvider)
        //         .where((element) => title == element.title);
        // if (type == 'vendor') {
        //   AutoRouter.of(context).push(SingleView(
        //       vendor: ref
        //           .watch(vendorsProvider)
        //           .where((element) => title == element.title)
        //           .first,
        //       topListing: null));
        // } else {
        // if (ref
        //         .watch(topListingProvider)
        //         .where((element) => title == element.title) != null) {
        //           print("TOP");
        //   // AutoRouter.of(context).push(SingleView(
        //   //   vendor: null,
        //   //   topListing: ref
        //   //       .watch(topListingProvider)
        //   //       .where((element) => title == element.title)
        //   //       .first,
        //   // ));
        // } else {
        //   print("VENDOR");
        //   // AutoRouter.of(context).push(SingleView(
        //   //     vendor: ref
        //   //         .watch(vendorsProvider)
        //   //         .where((element) => title == element.title)
        //   //         .first,
        //   //     topListing: null));
        // }
        // }
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
                    Image.network(
                      'https://viwaha.lk/$imagePath',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: child,
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(
                              // value: progress.cumulativeBytesLoaded /
                              //     progress.expectedTotalBytes!.toDouble(),
                              ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text('Failed to load image'),
                        );
                      },
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FavoriteIcon(),
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
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    description.toString().replaceAll('\r\n', " "),
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
