// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';

import '../../appColor.dart';
import '../../gen/assets.gen.dart';
import '../../routes/router.gr.dart';

class MyCardItem extends ConsumerStatefulWidget {
  final String id;
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  const MyCardItem({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
  });
  @override
  _MyCardItemState createState() => _MyCardItemState();
}

class _MyCardItemState extends ConsumerState<MyCardItem> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(postControllerProvider);
    final picker = ImagePicker();
    print(widget.imagePath);

    imageUpload(File image, String name, String type) async {
      ref.read(isLoadingBillImgProvider.notifier).state = true;

      final res = await controller.imageUpload(image, name);
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
          side: const BorderSide(color: Colors.yellow),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.imagePath,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: 400,
                                height: 150,
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
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 400,
                              height: 150,
                              child: Image.network(
                                'https://viwaha.lk/assets/img/logo/logo_dark.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
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
                              Jiffy.parse(widget.date)
                                  .format(pattern: 'do MMMM  yyyy'),
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
                      widget.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 24,
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
                              fontWeight: FontWeight.bold,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Bank Receipt',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Text(
                                        '( maximum image size 1 Mb )',
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
                                              File image;
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
                                                            image = File(
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
                      size: 24.0,
                    ),
                    label: const Text('Premium'), // <-- Text
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
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
                      Icons.delete_forever,
                      size: 24.0,
                    ),
                    label: const Text('Boost'), // <-- Text
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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
                      Icons.delete_forever,
                      size: 24.0,
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
                  const Icon(Icons.star, color: Colors.yellow),
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
