// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/favorite.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/user_dashboard/user_dashboard.dart';
import 'package:viwaha_lk/models/user_dashboard/user_messages.dart';
import 'package:viwaha_lk/models/user_dashboard/user_notifications.dart';
import 'package:viwaha_lk/models/user_dashboard/user_reviews.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';

@RoutePage()
class UserDashboardPage extends ConsumerStatefulWidget {
  final String userId;
  const UserDashboardPage(this.userId, {super.key});
  @override
  _UserDashboardPageState createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends ConsumerState<UserDashboardPage> {
  UserDashboard counts = const UserDashboard();
  List<Message> messages = [];
  List<UserNotification> notifications = [];
  List<UserReviews> reviews = [];
  bool isLoading = false;
  @override 
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async { 
    counts = await ref
        .read(homeControllerProvider)
        .fetchUserDashboardCounts(widget.userId);
    messages.addAll(await ref
        .read(homeControllerProvider)
        .fetchUserMessages(widget.userId));

    notifications.addAll(await ref
        .read(homeControllerProvider)
        .fetchUserNotifications(widget.userId));

    reviews.addAll(
        await ref.read(homeControllerProvider).fetchUserReviews(widget.userId));

    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<SearchResultItem> myListing = ref.watch(myListingProvider);
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
        title: const Text("My Dashboard"),
      ),
      body: isLoading
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildCard(
                            "Listings",
                            counts.listings.toString(),
                            () {},
                          ),
                          buildCard(
                            "Messages",
                            counts.messages.toString(),
                            () {},
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          buildCard(
                            "Reviews",
                            counts.messages.toString(),
                            () {},
                          ),
                          buildCard(
                            "Referals",
                            counts.referals.toString(),
                            () {},
                          ),
                        ],
                      ),
                    ),
                    AddFieldMainWidget(
                      icon: Icons.message,
                      title: "Messages",
                      description:
                          "Now you can communicate and exchange ideas with ease.",
                      inputList: [
                        messages.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: messages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return messageCard(
                                      message: messages[index], index: index);
                                })
                            : const Center(
                                child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'It appears that there are no messages to show here right now!',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ))
                      ],
                    ),
                    AddFieldMainWidget(
                      icon: Icons.notification_add_rounded,
                      title: "Notifications",
                      description:
                          "You'll stay updated and informed about all the latest happenings.",
                      inputList: [
                        const SizedBox(
                          height: 8,
                        ),
                        notifications.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: notifications.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return notificationCard(
                                      notification: notifications[index]);
                                })
                            : const Center(
                                child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Looks like there are no notifications to display at the moment, but stay tuned for future updates!',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ))
                      ],
                    ),
                    AddFieldMainWidget(
                      icon: Icons.reviews_rounded,
                      title: "Reviews",
                      description:
                          "You can read about others' experiences and share your own valuable feedback.",
                      inputList: [
                        const SizedBox(
                          height: 8,
                        ),
                        reviews.isNotEmpty
                            ? ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: reviews.length,
                                itemBuilder: (BuildContext context, int index) {
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
                    myListigs(),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildCard(String title, String count, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Card(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(color: ViwahaColor.primary),
            color: ViwahaColor.primary,
          ), // where to position the child
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 107,
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ]),
        )),
      ),
    );
  }

  Widget messageCard({required Message message, required int index}) {
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
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
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
                                              messages[index].image != null
                                                  ? 'https://viwaha.lk/${messages[index].image.toString()}'
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
                                Jiffy.parse(messages[index].datetime.toString())
                                    .format(pattern: 'yyyy-MM-dd hh:mm'),
                                style: const TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                                width: 200,
                                child: Text(
                                  messages[index].title.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              width: 200,
                              child: Text(messages[index].message.toString()),
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
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: ViwahaColor.primary,
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
                            SizedBox(
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

  Widget notificationCard({required UserNotification notification}) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 2),
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
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 190, top: 5, right: 5),
                              child: Text(
                                Jiffy.parse(notification.datetime.toString())
                                    .format(pattern: 'yyyy-MM-dd hh:mm'),
                                style: const TextStyle(color: Colors.grey),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                  width: 270,
                                  child: Text(
                                    notification.detail.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
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

  Widget myListigs() {
    List<SearchResultItem> myListing = ref.watch(myListingProvider);
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
                    'My Listings',
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
                  myListing.length, // Total number of cards
                  (index) => MyCardItem(
                    imagePath: ref
                        .read(homeControllerProvider)
                        .getTumbImage(myListing[index].thumb_images)
                        .first,
                    title: myListing[index].title != null
                        ? myListing[index].title!
                        : "",
                    description: myListing[index].description != null
                        ? myListing[index].description!
                        : "",
                    starRating: 4.5,
                    type: "myAd",
                    date: myListing[index].datetime != null
                        ? myListing[index].datetime!
                        : "",
                    location: myListing[index].location!,
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

  const MyCardItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.starRating,
    required this.location,
    required this.date,
    required this.type,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
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
                      Text(starRating.toString()),
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
