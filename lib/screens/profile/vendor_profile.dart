// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/vendor_profile/vendor_profile.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';

@RoutePage()
class VendorProfilePage extends ConsumerStatefulWidget {
  final String userId;
  const VendorProfilePage(this.userId, {super.key});
  @override
  _VendorProfilePageState createState() => _VendorProfilePageState();
}

class _VendorProfilePageState extends ConsumerState<VendorProfilePage> {
  VendorProfile vendor = const VendorProfile();
  List<SearchResultItem> vendorListing = [];
  bool isLoading = false;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    vendor = await ref.read(homeControllerProvider).fetchVendor(widget.userId);
    vendorListing.addAll(await ref
        .read(homeControllerProvider)
        .fetchVendorListings(widget.userId));

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Assets.lib.assets.images.logo.image(),
                ),
              ),
            ],
          ),
        ],
        title: const Text("Vendor Profile"),
      ),
      body: isLoading
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /// -- IMAGE
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ViwahaColor
                                        .primary, // Set your desired border color here
                                    width: 4, // Set the desired border width
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    vendor.image.toString(),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) {
                                        return SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: child,
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ListTile(
                        title: Text(
                            '${vendor.firstname} ${vendor.lastname != "" ? vendor.lastname : ""}'
                                .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.center),
                        subtitle: Text(
                            (vendor.designation != "null")
                                ? (vendor.designation != null)
                                    ? (vendor.designation != "")
                                        ? vendor.designation.toString()
                                        : ""
                                    : ""
                                : "",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ViwahaColor.primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Total Listings ${vendor.listings_count}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddFieldMainWidget(
                            icon: Icons.person_2_outlined,
                            title: "Profile Details",
                            description: "",
                            inputList: [
                              (vendor.phone != "null")
                                  ? (vendor.phone != null)
                                      ? (vendor.phone != "")
                                          ? ListTile(
                                              title: const Text(
                                                  'Telephone Number',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.phone.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start))
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                              (vendor.phonenumber != "null")
                                  ? (vendor.phonenumber != null)
                                      ? (vendor.phonenumber != "")
                                          ? ListTile(
                                              title: const Text(
                                                  'Whatsapp Number',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.phonenumber.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start),
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                              (vendor.email != "null")
                                  ? (vendor.email != null)
                                      ? (vendor.email != "")
                                          ? ListTile(
                                              title: const Text('Email',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.email.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start),
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                              (vendor.address != "null")
                                  ? (vendor.address != null)
                                      ? (vendor.address != "")
                                          ? ListTile(
                                              title: const Text('Address',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.address.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start),
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                              (vendor.address != "null")
                                  ? (vendor.address != null)
                                      ? (vendor.address != "")
                                          ? ListTile(
                                              title: const Text('Company',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.company.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start),
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                              (vendor.address != "null")
                                  ? (vendor.address != null)
                                      ? (vendor.address != "")
                                          ? ListTile(
                                              title: const Text('Birthday',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  textAlign: TextAlign.start),
                                              subtitle: Text(
                                                  vendor.birthday.toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 18),
                                                  textAlign: TextAlign.start),
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox(),
                            ]),
                        AddFieldMainWidget(
                            icon: Icons.follow_the_signs_outlined,
                            title: "Follow Us",
                            description: "",
                            inputList: [
                              ListTile(
                                leading:
                                    const Icon(Icons.mail_outline_outlined),
                                title: Text(
                                  vendor.email.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                            ]),
                        vendorListigs(),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget vendorListigs() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 400, // Set the desired height for the horizontal list view
        child: Column(
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
                    'Our Listings',
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
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                scrollDirection:
                    Axis.horizontal, // Set the scroll direction to horizontal
                children: List.generate(
                  vendorListing.length, // Total number of cards
                  (index) => MyCardItem(
                    imagePath: ref
                        .read(homeControllerProvider)
                        .getTumbImage(vendorListing[index].thumb_images)
                        .first,
                    title: vendorListing[index].title != null
                        ? vendorListing[index].title!
                        : "",
                    description: vendorListing[index].description != null
                        ? vendorListing[index].description!
                        : "",
                    starRating: vendorListing[index].average_rating != null
                        ? double.parse(
                            vendorListing[index].average_rating.toString())
                        : 0,
                    type: "vendorAd",
                    date: vendorListing[index].datetime != null
                        ? vendorListing[index].datetime!
                        : "",
                    location: vendorListing[index].location!,
                    listing: vendorListing[index],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MyCardItem extends ConsumerWidget {
  final String imagePath;
  final String title;
  final String description;
  final double starRating;
  final String location;
  final String date;
  final String type;
  final SearchResultItem listing;

  const MyCardItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.type,
    required this.listing,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context)
            .push(SearchSingleView(item: listing, type: 'vendorAd'));
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
                      imagePath,
                      fit: BoxFit.cover,
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
                        return Center(
                          child: Image.network(
                            'https://viwaha.lk/assets/img/logo/no_image.jpg',
                            fit: BoxFit.cover,
                          ),
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
                              Jiffy.parse(date)
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                          '${(double.parse(starRating != null ? starRating.toString() : '0')).roundToDouble()}'),
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
