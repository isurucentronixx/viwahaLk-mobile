// ignore_for_file: unnecessary_string_interpolations
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/single_page/popup/report_popup.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/screens/single_page/popup/request_quote_popup.dart';
import 'package:viwaha_lk/services/functions.dart';

class SliderView extends ConsumerStatefulWidget {
  const SliderView(this.images, this.type, {super.key});
  final String images;
  final String type;
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends ConsumerState<SliderView> {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths =
        ref.read(homeControllerProvider).getTumbImage(widget.images);
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
        return Image.network(
          imagePath,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  child: child,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Image.network(
                'https://viwaha.lk/assets/img/logo/no_image.jpg',
                fit: BoxFit.cover,
              ),
            );
          },
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
  final SearchResultItem? item;

  @override
  _SingleItemOverviewState createState() => _SingleItemOverviewState();
}

class _SingleItemOverviewState extends ConsumerState<SingleItemOverview> {
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
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                widget.type == "myAd"
                    ? IconButton(
                        onPressed: () {
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
            '${widget.title}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
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
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Ratings: ${(double.parse(widget.item!.average_rating != null ? widget.item!.average_rating.toString() : '0')).roundToDouble()}',
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
                label: const Text('Vendor Profile'),
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
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showReviewForm(context, ref,
                            listingId: widget.item!.id.toString(),
                            userId: widget.item!.user_id.toString());
                      },
                      child: const Text('Add Review'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showReportingForm(context, ref,
                            listingId: widget.item!.id.toString(),
                            userId: widget.item!.user_id.toString());
                      },
                      child: const Text('Report'),
                    ),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amenities = getAmenites(widget.amenities);
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
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Amenities',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class SingleItemDescription extends StatefulWidget {
  const SingleItemDescription(this.description, {super.key});
  final String description;
  @override
  State<SingleItemDescription> createState() => _SingleItemDescriptionState();
}

class _SingleItemDescriptionState extends State<SingleItemDescription> {
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
                  child: const Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Description',
                        style: TextStyle(
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
                  '${widget.description}',
                  // style: GoogleFonts.lato(),
                  // TextStyle(
                  //   color: Colors.amber,
                  //   fontFamily: 'Noto Serif Sinhala',
                  // ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}

class SingleItemContactInfo extends StatefulWidget {
  const SingleItemContactInfo(
      this.contactNumber, this.telephoneNumer, this.address, this.email,
      {super.key});
  final String contactNumber;
  final String telephoneNumer;
  final String address;
  final String email;
  @override
  State<SingleItemContactInfo> createState() => _SingleItemContactInfoState();
}

class _SingleItemContactInfoState extends State<SingleItemContactInfo> {
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
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Contact Informations',
                  style: TextStyle(
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
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: const Text('Contact Number'),
                subtitle: Text('${widget.contactNumber}'),
              ),
              widget.telephoneNumer.isEmpty ||
                      widget.telephoneNumer == 'null' ||
                      widget.telephoneNumer == 'Null'
                  ? Container()
                  : ListTile(
                      leading: const Icon(Icons.phone),
                      title: const Text('Telephone Number'),
                      subtitle: Text('${widget.telephoneNumer}'),
                    ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Address'),
                subtitle: Text('${widget.address}'),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: Text('${widget.email}'),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Transform.scale(
                        scale: 0.8, // Adjust this value to resize the button
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
                                  "whatsapp://send?phone='${widget.contactNumber}'&text=Hi, This Message from Viwaha App"));
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Transform.scale(
                        scale: 0.8, // Adjust this value to resize the button
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xff4267B2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            iconSize: 30,
                            icon: const FaIcon(FontAwesomeIcons.facebookF),
                            color: Colors.white,
                            onPressed: () {
                              launchUrl(Uri.parse("https://www.facebook.com/"));
                            },
                          ),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8, // Adjust this value to resize the button
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
                              icon: const FaIcon(FontAwesomeIcons.twitter),
                              color: Colors.white,
                              onPressed: () {
                                launchUrl(
                                    Uri.parse("https://www.twitter.com/"));
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
  @override
  Widget build(BuildContext context) {
    // https://maps.googleapis.com/maps/api/staticmap?size=512x512&maptype=roadmap\&markers=size:mid|color:red|89%2F10%2C%20Lady%20Gordons%20%20Drive%2C%20Kandy%2C%20Sri%20Lanka&key=AIzaSyCQthDZlGXOe_-wTKiPUmLd9MVaisTCz-M
    String address = widget.address;

    const apiKey =
        'AIzaSyCQthDZlGXOe_-wTKiPUmLd9MVaisTCz-M'; // Replace with your Google API key
    final encodedAddress = Uri.encodeComponent(address);

    final url = 'https://maps.googleapis.com/maps/api/staticmap?'
        'size=600x400'
        '&zoom=17'
        '&maptype=roadmap\&'
        'markers=size:mid|color:red|$encodedAddress'
        '&key=$apiKey';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Location',
                  style: TextStyle(
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
            child: Image.network(url),
          ),
        ],
      ),
    );
  }
}
