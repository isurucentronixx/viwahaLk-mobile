// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/services/home_service.dart';

class PremiumVendors extends ConsumerStatefulWidget {
  const PremiumVendors({super.key});

  @override
  _PremiumVendorsState createState() => _PremiumVendorsState();
}

class _PremiumVendorsState extends ConsumerState<PremiumVendors> {
  @override
  Widget build(BuildContext context) {
    var inputDateFormat = DateFormat('dd MMMM, yyyy');
    final data = ref.watch(vendorsProvider);

    final isLoading = ref.watch(isLoadingHomeProvider);

    final homeServiceProvider = Provider<HomeService>((ref) {
      return HomeService(ref.read(dioClientProvider));
    });

    final homeControllerProvider = Provider<HomeController>((ref) {
      return HomeController(ref.read(homeServiceProvider));
    });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'premium_vendors'.tr(),
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
                text: 'discover_top_rated_premium_vendors'.tr(),
                style: const TextStyle(
                  color: Colors.black87,
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
        CarouselSlider(
          options: CarouselOptions(
            height: 280, // Set the desired height of the slider
            autoPlay: true, // Enable auto-playing of images
            // enlargeCenterPage: true, // Increase the size of the center image
            viewportFraction:
                0.6, // Fraction of the viewport width occupied by each image
            aspectRatio: 16 / 9, // Aspect ratio of the images
          ),
          items: data.map((data) {
            final vendor = data;
            String thumbImg = vendor.image == null
                ? ref
                    .read(homeControllerProvider)
                    .getTumbImage(vendor.thumb_images)
                    .first
                : "https://viwaha.lk/${vendor.image.toString()}";
            return GestureDetector(
              onTap: () {
                AutoRouter.of(context)
                    .push(SingleView(vendor: vendor, topListing: null));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.yellow),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 280,
                      height: 225,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: thumbImg,
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 225,
                              width: 280,
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
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Center(
                              child: Image.network(
                                'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Image.network(
                          //   thumbImg,
                          //   fit: BoxFit.cover,
                          //   loadingBuilder: (context, child, progress) {
                          //     if (progress == null) {
                          //       return ClipRRect(
                          //         borderRadius: BorderRadius.circular(10),
                          //         child: SizedBox(
                          //           width: 280,
                          //           height: 225,
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
                              child: FavoriteIcon(vendor.id!,
                                  vendor.is_favourite != "0" ? true : false),
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
                                    inputDateFormat
                                        .format(DateFormat("yyyy-MM-dd")
                                            .parse(vendor.datetime!))
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  vendor.title!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                        vendor.category!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("rating".tr()),
                        RatingBarIndicator(
                          rating: int.parse(vendor.average_rating != null
                                  ? vendor.average_rating.toString()
                                  : '0')
                              .ceilToDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
