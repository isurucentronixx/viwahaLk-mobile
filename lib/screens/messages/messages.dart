// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:viwaha_lk/models/user_dashboard/user_messages.dart';
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
class MessagesPage extends ConsumerStatefulWidget {
  final String userId;
  const MessagesPage(this.userId, {super.key});
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
  List<Message> messages = [];
  bool isLoading = false;

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    messages.addAll(await ref
        .read(homeControllerProvider)
        .fetchUserMessages(widget.userId));

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
                child: GestureDetector(
                    onTap:() {
                      AutoRouter.of(context).push(const HomePage());
                    },
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ),
            ],
          ),
        ],
        title: const Text("Messages"),
      ),
      body: isLoading
          ? messages.isNotEmpty
              ? SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
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
                  ),
                )
              : const NoListingPage()
          : const Center(
              child: CircularProgressIndicator(),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                            child: CachedNetworkImage(
                                              imageUrl: messages[index].image.toString(),
                                              fit: BoxFit.cover,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                height: 150,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10)),
                                                  color: Colors.black,
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Image.network(
                                                  'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            // Image.network(
                                            //   messages[index].image != null
                                            //       ? 'https://viwaha.lk/${messages[index].image.toString()}'
                                            //       : 'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                            //   fit: BoxFit.fill,
                                            //   loadingBuilder:
                                            //       (context, child, progress) {
                                            //     if (progress == null) {
                                            //       return SizedBox(
                                            //         width: 150,
                                            //         height: 150,
                                            //         child: child,
                                            //       );
                                            //     }
                                            //     return const Center(
                                            //       child:
                                            //           CircularProgressIndicator(),
                                            //     );
                                            //   },
                                            //   errorBuilder:
                                            //       (context, error, stackTrace) {
                                            //     return Image.network(
                                            //       'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                            //       fit: BoxFit.cover,
                                            //     );
                                            //   },
                                            // ),
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
}
