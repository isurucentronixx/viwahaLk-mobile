// ignore_for_file: unnecessary_string_interpolations
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:jiffy/jiffy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/top_listing/listingData.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/single_page/popup/report_popup.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/screens/single_page/popup/request_quote_popup.dart';
import 'package:viwaha_lk/screens/single_page/single_page_content/inner_fav.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SliderView extends ConsumerStatefulWidget {
  const SliderView(this.images, this.type, this.mainCategory, {super.key});
  final String images;
  final String type;
  final String mainCategory;
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends ConsumerState<SliderView> {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths =
        ref.read(homeControllerProvider).getTumbImage(widget.images);
    if (widget.mainCategory == "Proposal") {
      String isMembership = ref.read(userProvider).user!.membership.toString();
      if (isMembership != "1") {
        imagePaths.length = 1;
      }
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: 400, // Set the desired height of the slider
        autoPlay: true, // Enable auto-playing of images
        enlargeCenterPage: true, // Increase the size of the center image
        viewportFraction:
            0.8, // Fraction of the viewport width occupied by each image
        aspectRatio: 16 / 9, // Aspect ratio of the images
      ),
      items: imagePaths.map((imagePath) {
        return CachedNetworkImage(
          imageUrl: imagePath.toString(),
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
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
        );
      }).toList(),
    );
  }
}

class SingleItemOverview extends ConsumerStatefulWidget {
  const SingleItemOverview(this.date, this.location, this.title, this.views,
      this.type, this.id, this.item,
      {super.key});
  final String date;
  final String location;
  final String title;
  final String views;
  final String type;
  final String id;
  final dynamic item;

  @override
  _SingleItemOverviewState createState() => _SingleItemOverviewState();
}

class _SingleItemOverviewState extends ConsumerState<SingleItemOverview> {
  String isMembership(String text) {
    int end = text.length > 2 ? 2 : 0;
    String isMembership = ref.read(userProvider).user!.membership.toString();
    String visiblePart = text.substring(0, end);
    String hiddenPart =
        text.substring(end, text.length).replaceAll(RegExp(r'.'), 'X');
    String remainingPart = text.substring(text.length);
    String modifiedText = visiblePart + hiddenPart + remainingPart;

    return isMembership == "1" ? text : modifiedText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.overview.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                widget.type == "myAd"
                    ? IconButton(
                        onPressed: () {
                          ref.read(mainImageNameProvider.notifier).state = "";
                          ref.read(imageNameGalleryProvider).clear();
                          ref.read(mainImageProvider.notifier).state = "";
                          ref.read(imageGalleryProvider).clear();
                          AutoRouter.of(context)
                              .push(EditListingPage(item: widget.item));
                        },
                        icon: const Icon(
                          Icons.edit_document,
                          color: Colors.white,
                        ))
                    : const SizedBox(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.item!.main_category == "Proposal"
                ? isMembership(widget.item!.name!)
                : '${widget.title}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 8),
              Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: ViwahaColor.primary, width: 1)),
                  child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.item!.category.toString(),
                              style:
                                  const TextStyle(color: ViwahaColor.primary),
                            )
                          ]))),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ViwahaColor.primary),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InnerFavoriteIcon(widget.id,
                      widget.item!.is_favourite != "0" ? true : false),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [
              widget.item!.premium.toString() != "0"
                  ? ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(120, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () => null,
                      icon: const Icon(Icons.workspace_premium),
                      label: const Text(
                        "Premium",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(width: widget.item!.verified.toString() != "0" ? 8 : 0),
              widget.item!.verified.toString() != "0"
                  ? ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.lightBlueAccent),
                        fixedSize: Size(110, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () => null,
                      icon: const Icon(
                        Icons.shield_outlined,
                        color: Colors.lightBlueAccent,
                      ),
                      label: const Text(
                        "Verified",
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(width: widget.item!.member.toString() != "0" ? 8 : 0),
              widget.item!.member.toString() != "0"
                  ? ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.amber),
                        fixedSize: Size(110, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () => null,
                      icon: const Icon(
                        Icons.stars_rounded,
                        color: Colors.amber,
                      ),
                      label: const Text(
                        "Member",
                        style: TextStyle(color: Colors.amber),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 10),
          widget.item!.main_category != "Proposal"
              ? widget.item.price != "0"
                  ? Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ViwahaColor.primary,
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: ViwahaColor.primary, width: 1)),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Up to RS. ${widget.item.price}",
                                  style: const TextStyle(color: Colors.white),
                                )
                              ])))
                  : const SizedBox()
              : const SizedBox(),
          const SizedBox(height: 10),
          (widget.date != "null")
              ? (widget.date != null)
                  ? (widget.date != "")
                      ? Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${Jiffy.parse(widget.date).format(pattern: 'do MMMM  yyyy')}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                // color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox()
              : const SizedBox(),
          const SizedBox(height: 8),
          (widget.location != "null")
              ? (widget.location != null)
                  ? (widget.location != "")
                      ? Row(
                          children: [
                            const Icon(
                              Icons.pin_drop,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.location}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                // color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox()
              : const SizedBox(),
          SizedBox(height: widget.item.ask_price == "1" ? 8 : 0),
          widget.item.ask_price == "1"
              ? const Row(
                  children: [
                    Icon(
                      Icons.check_box_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Ask Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(height: widget.item.negotiable == "1" ? 8 : 0),
          widget.item.negotiable == "1"
              ? const Row(
                  children: [
                    Icon(
                      Icons.check_box_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Negotiable",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        // color: Colors.grey,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(height: 8),
          (widget.views != "null")
              ? (widget.views != null)
                  ? (widget.views != "")
                      ? Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.views} Views',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            widget.item!.average_rating != null
                                ? const Icon(Icons.star, color: Colors.yellow)
                                : const Icon(Icons.star_border,
                                    color: Colors.yellow),
                            // const Icon(

                            //   Icons.star,
                            //   color: Colors.yellow,
                            // ),
                            const SizedBox(width: 4),
                            Text(
                              '${LocaleKeys.rating.tr()}: ${(double.parse(widget.item!.average_rating != null ? widget.item!.average_rating.toString() : '0')).roundToDouble()}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox()
              : const SizedBox(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  AutoRouter.of(context).push(VendorProfilePage(
                      userId: widget.item!.user_id.toString()));
                },
                icon: const Icon(Icons.person),
                label: Text(LocaleKeys.vendor_profile.tr()),
              ),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Share.share('https://viwaha.lk/listing?id=${widget.id}');
                },
                icon: const Icon(Icons.share_sharp),
                label: const Text("Share"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          widget.type != "myAd"
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showRequestQuoteForm(context, ref,
                            listingId: widget.item!.id.toString(),
                            userId: widget.item!.user_id.toString());
                      },
                      child: const Text('Request Quote'),
                    ),
                    ref.watch(isloginProvider)
                        ? const SizedBox(
                            width: 10,
                          )
                        : const SizedBox(),
                    ref.watch(isloginProvider)
                        ? ElevatedButton(
                            onPressed: () {
                              showReviewForm(context, ref,
                                  listingId: widget.item!.id.toString(),
                                  userId: ref
                                      .read(userProvider)
                                      .user!
                                      .id
                                      .toString());
                            },
                            child: const Text('Add Review'),
                          )
                        : const SizedBox(),
                    ref.watch(isloginProvider)
                        ? const SizedBox(
                            width: 10,
                          )
                        : const SizedBox(),
                    ref.watch(isloginProvider)
                        ? ElevatedButton(
                            onPressed: () {
                              showReportingForm(context, ref,
                                  listingId: widget.item!.id.toString(),
                                  userId: ref
                                      .read(userProvider)
                                      .user!
                                      .id
                                      .toString());
                            },
                            child: const Text('Report'),
                          )
                        : const SizedBox(),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class SingleItemAmenities extends StatefulWidget {
  const SingleItemAmenities(this.amenities, {super.key});
  final String amenities;
  @override
  State<SingleItemAmenities> createState() => _SingleItemAmenitiesState();
}

class _SingleItemAmenitiesState extends State<SingleItemAmenities> {
  List<String> amenities = [];

  List<String> getAmenites(String amenities) {
    // Remove the initial 'a:11:' part from the string
    String serializedString = amenities!.substring(6);
    // Replace the semicolons, colons, and quotes to format it as a valid JSON
    RegExp regex = RegExp('"([^"]+)"');
    Iterable<Match> matches = regex.allMatches(serializedString);
    List<String> filteredTextList =
        matches.map((match) => match.group(1)!).toList();
    if (filteredTextList.isEmpty) {
      filteredTextList = [""];
    }
    return filteredTextList;
  }

  aminitiesInitializing(String aminitiesStr) {
    if (aminitiesStr != '') {
      amenities = getAmenites(aminitiesStr);

      if (amenities.first == '') {
        String text = widget.amenities
            .toString()
            .substring(1, widget.amenities.length - 1);
        amenities.addAll(
            text.split(',').where((element) => element.isNotEmpty).toList());
        amenities.removeWhere((element) => element.isEmpty);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    aminitiesInitializing(widget.amenities);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.aminities.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: amenities.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        color: ViwahaColor.primary,
                      ),
                      title: Text(amenities[index].toString()));
                }),
          ),
        ],
      ),
    );
  }
}

class SingleItemProposal extends StatefulWidget {
  final dynamic item;
  const SingleItemProposal(this.item, {super.key});

  @override
  State<SingleItemProposal> createState() => _SingleItemProposalState();
}

class _SingleItemProposalState extends State<SingleItemProposal> {
  List<String> amenities = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.proposal_deatails.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          widget.item.gender.toString() != "Select one"
              ? ListTile(
                  title: const Text('Gender',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.gender.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.birthyear.toString() != ""
              ? ListTile(
                  title: const Text('Birth Day',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(
                      '${widget.item.birthyear.toString()}-${widget.item.birthmonth.toString()}-${widget.item.birthday.toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.height.toString() != "Select one"
              ? ListTile(
                  title: const Text('Height ',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.height.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.weight.toString() != "Select one"
              ? ListTile(
                  title: const Text('Weight',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.weight.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.body.toString() != "Select one"
              ? ListTile(
                  title: const Text('Body',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.body.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.appearance.toString() != "Select one"
              ? ListTile(
                  title: const Text('Appearance',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.appearance.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.complexion.toString() != "Select one"
              ? ListTile(
                  title: const Text('Complexion',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.complexion.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.maritial.toString() != "Select one"
              ? ListTile(
                  title: const Text('Maritial',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.maritial.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.education.toString() != "Select one"
              ? ListTile(
                  title: const Text('Education',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.education.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.career.toString() != "Select one"
              ? ListTile(
                  title: const Text('Career',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.career.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.religion.toString() != "Select one"
              ? ListTile(
                  title: const Text('Religion',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.religion.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.ethnicity.toString() != "Select one"
              ? ListTile(
                  title: const Text('Ethnicity',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.ethnicity.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.social_class.toString() != "Select one"
              ? ListTile(
                  title: const Text('Social Class',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.social_class.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.residency.toString() != "Select one"
              ? ListTile(
                  title: const Text('Residency',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.residency.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.family_values.toString() != "Select one"
              ? ListTile(
                  title: const Text('Family Values',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.family_values.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.smoking.toString() != "Select one"
              ? ListTile(
                  title: const Text('Smoking',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.smoking.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.drinking.toString() != "Select one"
              ? ListTile(
                  title: const Text('Drinking',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.drinking.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.diet.toString() != "Select one"
              ? ListTile(
                  title: const Text('Diet',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.diet.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.personality.toString() != "Select one"
              ? ListTile(
                  title: const Text('Personality',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.personality.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
          widget.item.next_step.toString() != "Select one"
              ? ListTile(
                  title: const Text('Next Step',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.start),
                  subtitle: Text(widget.item.next_step.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.start),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class SingleItemDescription extends ConsumerStatefulWidget {
  const SingleItemDescription(
      this.description, this.mainCategory, this.videoLink,
      {super.key});
  final String description;
  final String mainCategory;
  final String videoLink;
  @override
  _SingleItemDescriptionState createState() => _SingleItemDescriptionState();
}

class _SingleItemDescriptionState extends ConsumerState<SingleItemDescription> {
  String isMembership(String text) {
    int end = text.length > 2 ? 2 : 0;
    String isMembership = ref.read(userProvider).user!.membership.toString();
    String visiblePart = text.substring(0, end);
    String hiddenPart =
        text.substring(end, text.length).replaceAll(RegExp(r'.'), 'X');
    String remainingPart = text.substring(text.length);
    String modifiedText = visiblePart + hiddenPart + remainingPart;

    return isMembership == "1" ? text : modifiedText;
  }

  @override
  Widget build(BuildContext context) {
    return widget.description.isEmpty ||
            widget.description == 'null' ||
            widget.description == 'NULL'
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: ViwahaColor
                      .primary, // Set the background color for the title
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        LocaleKeys.description.tr(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ExpandText(
                  widget.mainCategory == "Proposal"
                      ? isMembership(widget.description)
                      : widget.description,
                  // style: GoogleFonts.lato(),
                  // TextStyle(
                  //   color: Colors.amber,
                  //   fontFamily: 'Noto Serif Sinhala',
                  // ),
                  textAlign: TextAlign.left,
                ),
                widget.videoLink != ""
                    ? Center(
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await launchUrl(Uri.parse(widget.videoLink),
                                mode: LaunchMode.externalApplication);
                          },
                          icon: const Icon(Icons.play_circle),
                          label: const Text('Watch clip'),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
  }
}

class SingleItemOpeningHours extends ConsumerStatefulWidget {
  const SingleItemOpeningHours(this.item, {super.key});
  final dynamic item;
  @override
  _SingleItemOpeningHoursState createState() => _SingleItemOpeningHoursState();
}

class _SingleItemOpeningHoursState
    extends ConsumerState<SingleItemOpeningHours> {
  @override
  Widget build(BuildContext context) {
    Widget openTimeWidget(String date, String openTime, String closeTime) {
      return openTime != "" || closeTime != ""
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$date'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$openTime - $closeTime',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            )
          : const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.opening_hours.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.item.open_holiday.toString() == 'Yes'
                  ? Stack(
                      children: [
                        openTimeWidget(
                            'Monday',
                            widget.item.monday_open_time.toString(),
                            widget.item.monday_open_time.toString()),
                        openTimeWidget(
                            'Tuesday',
                            widget.item.tuesday_open_time.toString(),
                            widget.item.tuesday_close_time.toString()),
                        openTimeWidget(
                            'Wednesday',
                            widget.item.wednesday_open_time.toString(),
                            widget.item.wednesday_open_time.toString()),
                        openTimeWidget(
                            'Thursday',
                            widget.item.thursday_open_time.toString(),
                            widget.item.thursday_open_time.toString()),
                        openTimeWidget(
                            'Friday',
                            widget.item.friday_open_time.toString(),
                            widget.item.friday_open_time.toString()),
                        openTimeWidget(
                            'Saturday',
                            widget.item.saturday_close_time.toString(),
                            widget.item.saturday_close_time.toString()),
                        openTimeWidget(
                            'Sunday',
                            widget.item.sunday_open_time.toString(),
                            widget.item.sunday_open_time.toString()),
                      ],
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Always Open'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.item.always_open.toString() == "Yes"
                        ? const Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          )
                        : const Icon(Icons.close_rounded, color: Colors.red),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Open in Holidays'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.item.open_holiday.toString() == "Yes"
                        ? const Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          )
                        : const Icon(Icons.close_rounded, color: Colors.red),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SingleItemContactInfo extends ConsumerStatefulWidget {
  const SingleItemContactInfo(
      this.mainCategory,
      this.contactNumber,
      this.telephoneNumer,
      this.address,
      this.email,
      this.facebook,
      this.whatsapp,
      this.instagram,
      this.linkedin,
      {super.key});
  final String mainCategory;
  final String contactNumber;
  final String telephoneNumer;
  final String address;
  final String email;
  final String facebook;
  final String whatsapp;
  final String instagram;
  final String linkedin;
  @override
  _SingleItemContactInfoState createState() => _SingleItemContactInfoState();
}

class _SingleItemContactInfoState extends ConsumerState<SingleItemContactInfo> {
  String isMembership(String text) {
    int end = text.length > 2 ? 2 : 0;
    String isMembership = ref.read(userProvider).user!.membership.toString();
    String visiblePart = text.substring(0, end);
    String hiddenPart =
        text.substring(end, text.length).replaceAll(RegExp(r'.'), 'X');
    String remainingPart = text.substring(text.length);
    String modifiedText = visiblePart + hiddenPart + remainingPart;

    return isMembership == "1" ? text : modifiedText;
  }

  @override
  Widget build(BuildContext context) {
    int whatsappIndexOf0 = widget.whatsapp.trim().indexOf("0");
    print(whatsappIndexOf0);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.contact_information.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              widget.contactNumber.isEmpty ||
                      widget.contactNumber == 'null' ||
                      widget.contactNumber == 'Null' ||
                      widget.contactNumber == ""
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse("tel:${widget.contactNumber}"));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.phone_android),
                        title: Text(LocaleKeys.contact_number.tr()),
                        subtitle: Text(widget.mainCategory == "Proposal"
                            ? isMembership(widget.contactNumber)
                            : widget.contactNumber),
                      ),
                    ),
              widget.telephoneNumer.isEmpty ||
                      widget.telephoneNumer == 'null' ||
                      widget.telephoneNumer == 'Null' ||
                      widget.telephoneNumer == ""
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse("tel:${widget.telephoneNumer}"));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text(LocaleKeys.tele_number.tr()),
                        subtitle: Text(widget.mainCategory == "Proposal"
                            ? isMembership(widget.telephoneNumer)
                            : widget.telephoneNumer),
                      ),
                    ),
              widget.address.isEmpty ||
                      widget.address == 'null' ||
                      widget.address == 'Null' ||
                      widget.address == ""
                  ? Container()
                  : ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(LocaleKeys.address.tr()),
                      subtitle: Text(widget.mainCategory == "Proposal"
                          ? isMembership(widget.address)
                          : widget.address),
                    ),
              widget.email.isEmpty ||
                      widget.email == 'null' ||
                      widget.email == 'Null' ||
                      widget.email == ""
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        print(widget.email.replaceAll(' ', ''));
                        launchUrl(Uri.parse(
                            "mailto:${widget.email.replaceAll(' ', '')}?subject=subject&body=body"));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.email),
                        title: Text(LocaleKeys.email.tr()),
                        subtitle: Text(widget.mainCategory == "Proposal"
                            ? isMembership(widget.email)
                            : widget.email),
                      ),
                    ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.whatsapp.isEmpty ||
                            widget.whatsapp == 'null' ||
                            widget.whatsapp == 'Null' ||
                            widget.whatsapp == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Transform.scale(
                              scale:
                                  0.8, // Adjust this value to resize the button
                              child: Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: const Color(0xff25d366),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  iconSize: 30,
                                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                                  color: Colors.white,
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        "whatsapp://send?phone=+94'${widget.whatsapp.substring(whatsappIndexOf0)}'&text=Hi, This Message from Viwaha App"));
                                  },
                                ),
                              ),
                            ),
                          ),
                    widget.facebook.isEmpty ||
                            widget.facebook == 'null' ||
                            widget.facebook == 'Null' ||
                            widget.facebook == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Transform.scale(
                              scale:
                                  0.8, // Adjust this value to resize the button
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4267B2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  iconSize: 30,
                                  icon:
                                      const FaIcon(FontAwesomeIcons.facebookF),
                                  color: Colors.white,
                                  onPressed: () {
                                    launchUrl(
                                        Uri.parse(
                                            'fb://facewebmodal/f?href=${widget.facebook}'),
                                        mode: LaunchMode.platformDefault);
                                  },
                                ),
                              ),
                            ),
                          ),
                    widget.instagram.isEmpty ||
                            widget.instagram == 'null' ||
                            widget.instagram == 'Null' ||
                            widget.instagram == ""
                        ? Container()
                        : Transform.scale(
                            scale:
                                0.8, // Adjust this value to resize the button
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1DA1F2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                    iconSize: 30,
                                    icon: const FaIcon(
                                        FontAwesomeIcons.instagram),
                                    color: Colors.white,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          widget.instagram.toString()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                    widget.linkedin.isEmpty ||
                            widget.linkedin == 'null' ||
                            widget.linkedin == 'Null' ||
                            widget.linkedin == ""
                        ? Container()
                        : Transform.scale(
                            scale:
                                0.8, // Adjust this value to resize the button
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1DA1F2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: IconButton(
                                    iconSize: 30,
                                    icon:
                                        const FaIcon(FontAwesomeIcons.linkedin),
                                    color: Colors.white,
                                    onPressed: () {
                                      launchUrl(Uri.parse(
                                          widget.linkedin.toString()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SingleItemMap extends StatefulWidget {
  final String address;
  const SingleItemMap(this.address, {super.key});

  @override
  State<SingleItemMap> createState() => _SingleItemMapState();
}

class _SingleItemMapState extends State<SingleItemMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> markers = Set();

  @override
  void initState() {
    setState(() {
      _goToTheAddress();
    });

    super.initState();
  }

  Future<void> _goToTheAddress() async {
    List<Location> locations = await locationFromAddress(widget.address);
    final GoogleMapController controller = await _controller.future;

    Marker resultMarker = Marker(
      markerId: const MarkerId("marker"),
      infoWindow: InfoWindow(
        title: widget.address.toString(),
      ),
      position: LatLng(locations.first.latitude, locations.first.longitude),
    );

    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(locations.first.latitude, locations.first.longitude),
            zoom: 16)));
    setState(() {
      markers.add(resultMarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  LocaleKeys.location.tr(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Flexible(
              child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition:
                      const CameraPosition(target: LatLng(0.0, 0.0)),
                  markers: markers,
                  zoomControlsEnabled: true,
                  tiltGesturesEnabled: false),
            ),

            // Image.network(url),
          ),
        ],
      ),
    );
  }
}
