// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jiffy/jiffy.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/user_dashboard/user_reviews.dart';
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/screens/widgets/no_listings_widget.dart';

@RoutePage()
class ReviewsPage extends ConsumerStatefulWidget {
  final String userId;
  const ReviewsPage(this.userId, {super.key});
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends ConsumerState<ReviewsPage> {
  List<UserReviews> reviews = [];
  bool isLoading = false;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    reviews.addAll(
        await ref.read(homeControllerProvider).fetchUserReviews(widget.userId));

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
          title: const Text("Reviews"),
        ),
        body: isLoading
            ? reviews.isNotEmpty
                ? SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          reviews.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: reviews.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return reviewCard(review: reviews[index]);
                                  })
                              : const Center(
                                  child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'Currently, there are no reviews to display!',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ))
                        ],
                      ),
                    ),
                  )
                : NoListingPage()
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget reviewCard({required UserReviews review}) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(color: ViwahaColor.primary),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ViwahaColor
                                                .primary, // Set your desired border color here
                                            width:
                                                2, // Set the desired border width
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                            review.image != null
                                                ? 'https://viwaha.lk/${review.image.toString()}'
                                                : 'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (context, child, progress) {
                                              if (progress == null) {
                                                return SizedBox(
                                                  width: 150,
                                                  height: 150,
                                                  child: child,
                                                );
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
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
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 100, top: 5, right: 5),
                              child: Text(
                                Jiffy.parse(review.datetime.toString())
                                    .format(pattern: 'yyyy-MM-dd hh:mm'),
                                style: const TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                                width: 200,
                                child: Text(
                                  '${review.firstname} ${review.lastname != "" ? review.lastname : ""}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 15,
                              initialRating:
                                  double.parse(review.rating.toString()),
                              minRating: 0,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(review.message.toString()),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.replay,
                                    size: 22.0,
                                  ),
                                  label: const Text('Reply'), // <-- Text
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: ViwahaColor.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
