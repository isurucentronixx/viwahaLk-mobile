// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/services/home_service.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

import 'listingData.dart';

class TopListing extends ConsumerWidget {
  const TopListing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var inputDateFormat = DateFormat('dd MMMM, yyyy');
    final data = ref.watch(topListingProvider);

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
            'exploring_top_listings'.tr(),
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
                text: 'discover'.tr(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: LocaleKeys.top_rated_local_listing.tr(),
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
        data.isNotEmpty
            ? GridView.count(
                physics: const ScrollPhysics(),
                childAspectRatio: 0.8,
                shrinkWrap: true,
                crossAxisCount: 2, // Number of columns
                children: List.generate(data.length, // Total number of cards
                    (index) {
                  final wedding = data[index];
                  String thumbImg = wedding.image != null
                      ? "https://viwaha.lk/${wedding.image.toString()}"
                      : ref
                          .read(homeControllerProvider)
                          .getTumbImage(wedding.thumb_images)
                          .first;
                  // ref
                  //     .read(homeControllerProvider)
                  //     .getTumbImage(wedding.thumb_images)
                  //     .first;
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context)
                          .push(SingleView(vendor: null, topListing: wedding));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.yellow),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 185,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: thumbImg,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                      Center(child: const CircularProgressIndicator()),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
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
                                    child: FavoriteIcon(
                                        wedding.id!,
                                        wedding.is_favourite != "0"
                                            ? true
                                            : false),
                                  ),
                                ),
                                Align(
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
                                          inputDateFormat
                                              .format(DateFormat("yyyy-MM-dd")
                                                  .parse(wedding.datetime!))
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        wedding.title!,
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
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4.0),
                                            child: Text(
                                              wedding.category!,
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
                                rating: double.parse(
                                    wedding.average_rating != null
                                        ? wedding.average_rating.toString()
                                        : '0'),
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
                }),
              )
            : const Center(
                child: Center(
                child: CircularProgressIndicator(),
              ))
      ],
    );
  }
}
