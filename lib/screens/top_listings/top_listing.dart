// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/cards/searching_list_card.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';
import 'package:timezone/timezone.dart' as tz;

class TopListing extends ConsumerWidget {
  const TopListing({super.key});

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
    final data = ref.watch(topListingProvider);

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
            ? ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return SearchingListItem(
                    id: data[index].id.toString(),
                    imagePath: (data[index].image) != null
                        ? "https://viwaha.lk/${data[index].image.toString()}"
                        : ref
                            .read(homeControllerProvider)
                            .getTumbImage(data[index].thumb_images)
                            .first,
                    title: data[index].title.toString(),
                    description: data[index].description.toString(),
                    starRating: (data[index].average_rating) != null
                        ? double.parse(data[index].average_rating.toString())
                        : 0,
                    location:
                        '${data[index].location.toString()}, ${data[index].main_location.toString()}',
                    date: data[index].datetime.toString(),
                    type: 'all',
                    isFav: data[index].is_favourite.toString(),
                    isPremium:
                        data[index].premium.toString() != "1" ? false : true,
                    boostedDate: data[index].boosted.toString(),
                    item: data[index],
                  );
                })
            : const Center(
                child: Center(
                child: CircularProgressIndicator(),
              )),
        const SizedBox(
          height: 15,
        ),
        data.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  if (ref.watch(isloginProvider)) {
                    ref.read(tempReviewsProvider).clear();
                    ref.refresh(allListingProvider);
                  }
                  ref.read(isSearchingProvider.notifier).state = true;
                  AutoRouter.of(context).push(AllListingPage(isAppBar: true));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ViwahaColor.primary),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'See More',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
