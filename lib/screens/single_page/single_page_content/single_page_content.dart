// ignore_for_file: unnecessary_string_interpolations
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:jiffy/jiffy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
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
              child: CircularProgressIndicator(
                  // value: progress.cumulativeBytesLoaded /
                  //     progress.expectedTotalBytes!.toDouble(),
                  ),
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
          Row(
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
          ),
          const SizedBox(height: 8),
          Row(
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
          ),
          const SizedBox(height: 8),
          Row(
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
              const Text(
                'Ratings: 4.5',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
              widget.telephoneNumer.isEmpty
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
                      child: FlutterSocialButton(
                        mini: true,
                        title: "0770369602",
                        buttonType: ButtonType.whatsapp,
                        onTap: () {
                          launchUrl(Uri.parse(
                              "whatsapp://send?phone=0770369602&text=Hi, Message from Viwaha App"));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: FlutterSocialButton(
                        mini: true,
                        title: "Facebook",
                        buttonType: ButtonType.facebook,
                        onTap: () {
                          launchUrl(Uri.parse("https://www.facebook.com/"));
                        },
                      ),
                    ),
                    FlutterSocialButton(
                      mini: true,
                      title: "Twitter",
                      buttonType: ButtonType.twitter,
                      onTap: () {
                        launchUrl(Uri.parse("https://www.twitter.com/"));
                      },
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
          const SizedBox(height: 8),
          SizedBox(
            child: Image.network(url),
          ),
        ],
      ),
    );
  }
}

class SingleItemReview extends StatefulWidget {
  const SingleItemReview({super.key});

  @override
  State<SingleItemReview> createState() => _SingleItemReviewState();
}

class _SingleItemReviewState extends State<SingleItemReview> {
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
                  'Review',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ViwahaColor.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                hintText: "This name will appear on your review.",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'Name',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                prefixIcon: const Icon(
                  Icons.mail_outline_rounded,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ViwahaColor.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                hintText: "This email will appear on your review.",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
              validator: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              // minLines: 3,
              maxLines: 6,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusColor: Colors.white,
                //add prefix icon
                prefixIcon: const Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ViwahaColor.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                hintText: "Write your review here.",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
                labelText: 'Review',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontFamily: "verdana_regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SizedBox(
                width: double.infinity, // Full width
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Review'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
