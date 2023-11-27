import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MyCardItem extends ConsumerStatefulWidget {
  final String? id;
  final String? imagePath;
  final String? title;
  final String? description;
  final double? starRating;
  final String? location;
  final String? date;
  final String? name;
  final String? main_category;
  final String? isFav;
  final String? boosted;
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
  Duration boostingCount = const Duration();
  bool isBoosting = false;
  String _more = 'Select One';
  List<S2Choice<String>>? moreData = [
    S2Choice<String>(value: 'edit', title: 'Edit Listing'),
    S2Choice<String>(value: 'delete', title: 'Delete'),
  ];
  boostingTime() {
    final now = DateTime.now();

    DateTime boostedDate = DateTime.parse(widget.boosted!);
    DateTime boostEndTime = boostedDate.add(const Duration(hours: 24));

    Duration difference = boostEndTime.difference(now);
    setState(() {
      boostingCount = difference;
      if (boostingCount < const Duration(hours: 24)) {
        isBoosting = true;
      }
    });
  }

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
  void initState() {
    // TODO: implement initState
    if (widget.boosted.toString() != 'null') {
      boostingTime();
    }

    super.initState();
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
                      imageUrl: widget.imagePath!,
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
                            widget.id!, widget.isFav != "0" ? true : false),
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
                                    "Boosted ${timeAgoSinceDate(widget.boosted!)}",
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
                          ? widget.name!
                          : widget.title!,
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
                            widget.location!,
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
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      !isBoosting
                          ? showDialog<bool>(
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
                                            .read(myListingViewStateProvider
                                                .notifier)
                                            .state = const AsyncValue.loading();
                                        controller.boostMyListing(widget.id);
                                      },
                                    ),
                                  ],
                                );
                              })
                          : null;
                    },
                    icon: const Icon(
                      Icons.airplane_ticket_outlined,
                      size: 22.0,
                    ),
                    label: const Text('Boost'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isBoosting
                          ? const Color.fromARGB(255, 147, 220, 150)
                          : const Color(0xFF4caf50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SmartSelect<String>.single(
                    modalFilterAuto: true,
                    modalFilter: true,
                    title: 'More about listing',
                    selectedValue: _more,
                    choiceItems: moreData,
                    onChange: (selected) {
                      if (selected.value == 'delete') {
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
                                          .read(myListingViewStateProvider
                                              .notifier)
                                          .state = const AsyncValue.loading();

                                      controller.deleteMyListing(widget.id);
                                    },
                                  ),
                                ],
                              );
                            });
                      } else if (selected.value == 'edit') {
                        ref.read(mainImageNameProvider.notifier).state = "";
                        ref.read(imageNameGalleryProvider).clear();
                        ref.read(mainImageProvider.notifier).state = "";
                        ref.read(imageGalleryProvider).clear();
                        AutoRouter.of(context).push(EditListingPage(
                            item: ref
                                .watch(myListingProvider)
                                .where((element) => widget.id == element.id)
                                .first));
                      }
                    },
                    modalType: S2ModalType.bottomSheet,
                    tileBuilder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          state.showModal();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ViwahaColor.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Icon(
                          Icons.more_horiz_outlined,
                          size: 22,
                        ),
                      );
                    },
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
            isBoosting
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ViwahaColor.primary.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            children: [
                              const Text(
                                'You can boost in:',
                                style: TextStyle(color: Colors.white),
                              ),
                              SlideCountdown(
                                duration: boostingCount,
                                decoration: const BoxDecoration(
                                    color: ViwahaColor.transparent),
                                onDone: () {
                                  setState(() {
                                    isBoosting = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
