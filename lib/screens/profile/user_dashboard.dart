// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/user_dashboard/user_dashboard.dart';
import 'package:viwaha_lk/models/user_dashboard/user_messages.dart';
import 'package:viwaha_lk/models/user_dashboard/user_notifications.dart';
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
  bool isLoading = false;
  @override
  void initState() {
    gerCounts();
    // TODO: implement initState
    super.initState();
  }

  gerCounts() async {
    counts = await ref
        .read(homeControllerProvider)
        .fetchUserDashboardCounts(widget.userId);
    messages.addAll(
        await ref.read(homeControllerProvider).fetchUserMessages("288"));

    notifications.addAll(
        await ref.read(homeControllerProvider).fetchUserNotifications("288"));

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
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: messages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return messageCard(
                                  message: messages[index], index: index);
                            })
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
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return notificationCard(
                                  notification: notifications[index]);
                            })
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
                                              "https://viwaha.lk/assets/img/logo/no_image.jpg",
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
}
