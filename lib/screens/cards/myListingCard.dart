import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

class MyCardItem extends ConsumerStatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  final String name;
  final String main_category;
  final String isFav;
  final String boosted;
  const MyCardItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.name,
    required this.main_category,
    required this.isFav,
    required this.boosted,
  });
  @override
  _MyCardItemState createState() => _MyCardItemState();
}

class _MyCardItemState extends ConsumerState<MyCardItem> {
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
  Widget build(BuildContext context) {
    final controller = ref.watch(postControllerProvider);
    final picker = ImagePicker();

    imageUpload(XFile image, String name, String type) async {
      ref.read(isLoadingBillImgProvider.notifier).state = true;

      final res = await controller.imageUpload(image, name, type);
      setState(() {
        if (res['responseCode'].toString() == "1") {
          ref.read(premiumBillNameProvider.notifier).state =
              res['imageUrl'].toString();
          ref.read(isLoadingBillImgProvider.notifier).state = false;
        }
      });
    }

    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(SearchSingleView(
            item: ref
                .watch(myListingProvider)
                .where((element) => widget.id == element.id)
                .first,
            type: 'myAd'));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: ViwahaColor.primary),
        ),
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
                      imageUrl: widget.imagePath,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
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
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavoriteIcon(
                            widget.id, widget.isFav != "0" ? true : false),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: widget.boosted != "null"
                                ? Text(
                                    "Boosted ${timeAgoSinceDate(widget.boosted)}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    timeAgoSinceDate(widget.date!),
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
              padding:
                  const EdgeInsets.only(left: 10, bottom: 0, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      widget.main_category == "Proposal"
                          ? '${widget.name}'
                          : '${widget.title}',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            widget.location,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.location_pin,
                          color: ViwahaColor.primary,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, bottom: 8, top: 0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (stfContext, stfSetState) {
                              return AlertDialog(
                                content: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Bank Receipt',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Text(
                                        '(Maximum image size 1 Mb)',
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              XFile image;
                                              picker
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery,
                                                      imageQuality: 50,
                                                      maxWidth: 800,
                                                      maxHeight: 800)
                                                  .then((value) => {
                                                        if (value != null)
                                                          {
                                                            image = XFile(
                                                                value.path),
                                                            stfSetState(
                                                              () {
                                                                imageUpload(
                                                                    image,
                                                                    value.name,
                                                                    "review");
                                                                ref
                                                                    .read(premiumBillProvider
                                                                        .notifier)
                                                                    .state = value.path;
                                                              },
                                                            )
                                                          }
                                                      });
                                            },
                                            child: Container(
                                              color: ViwahaColor.transparent,
                                              width: 50,
                                              height: 50,
                                              child: Assets
                                                  .lib.assets.images.photography
                                                  .image(),
                                            ),
                                          ),
                                          ref.watch(premiumBillProvider).isEmpty
                                              ? Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ViwahaColor
                                                              .primary),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Assets.lib.assets
                                                      .images.colorLogo
                                                      .image(),
                                                )
                                              : Container(
                                                  width: 150,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: Image.file(File(
                                                                  ref.watch(
                                                                      premiumBillProvider)))
                                                              .image),
                                                      border: Border.all(
                                                          color: ViwahaColor
                                                              .primary),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  10))),
                                                )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blueGrey),
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ElevatedButton(
                                    child: const Text('Upload'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      ref
                                          .read(myListingViewStateProvider
                                              .notifier)
                                          .state = const AsyncValue.loading();
                                      controller.premiumMyListing(widget.id);
                                    },
                                  ),
                                ],
                              );
                            });
                          });
                    },
                    icon: const Icon(
                      Icons.workspace_premium_outlined,
                      size: 22.0,
                    ),
                    label: const Text('Premium'), // <-- Text
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ViwahaColor.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                  'Are you sure you want to boost this post?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text('Yes, Boost now!'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    ref
                                        .read(
                                            myListingViewStateProvider.notifier)
                                        .state = const AsyncValue.loading();
                                    controller.boostMyListing(widget.id);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.analytics_outlined,
                      size: 22.0,
                    ),
                    label: const Text('Boost'), // <-- Text
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4caf50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text(
                                  'Are you sure you want to delete?'),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text('Yes, delete'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    ref
                                        .read(
                                            myListingViewStateProvider.notifier)
                                        .state = const AsyncValue.loading();

                                    controller.deleteMyListing(widget.id);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, bottom: 8, top: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.starRating.toString() != '0.0'
                      ? const Icon(Icons.star, color: Colors.yellow)
                      : const Icon(Icons.star_border, color: Colors.yellow),
                  const SizedBox(width: 4),
                  Text(widget.starRating.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
