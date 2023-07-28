// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/card/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).userId;
    return Scaffold(
      body: ref.watch(isloginProvider)
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: SizedBox(
                            child: Image.network(
                              user!.image.toString(),
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: SizedBox(
                                      width: 120,
                                      height: 120,
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
                                return const Center(
                                  child: Text('Failed to load image'),
                                );
                              },
                            ),
                          ),
                        ),
                        // Positioned(
                        //   bottom: 0,
                        //   right: 0,
                        //   child: Container(
                        //     width: 35,
                        //     height: 35,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(100)),
                        //     child: const Icon(
                        //       Icons.mode_edit_outline,
                        //       color: ViwahaColor.primary,
                        //       size: 20,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Hi,', style: Theme.of(context).textTheme.headline4),
                    Text('${user.firstname}',
                        style: Theme.of(context).textTheme.bodyText2),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ViwahaColor.primary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        AutoRouter.of(context).push(const AddListingPage());
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add,
                              color: Colors
                                  .white), // Replace Icons.copy with your desired icon.
                          SizedBox(
                              width:
                                  8), // Add some space between the icon and the text.
                          Text(
                            "POST YOUR ADD",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow[700]),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.yellow),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.copy_all_outlined,
                              color: Colors
                                  .black), // Replace Icons.copy with your desired icon.
                          SizedBox(
                              width:
                                  8), // Add some space between the icon and the text.
                          Text(
                            "Copy referral link !",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),

                    /// -- BUTTON

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Main".toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Icon(Icons.settings,
                              color: ViwahaColor.primary),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),

                    /// -- MENU
                    ProfileMenuWidget(
                        title: "Dashboard",
                        icon: Icons.settings,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "My Profile",
                        icon: Icons.person_outline_outlined,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Edit Profile",
                        icon: Icons.edit_note,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Message",
                        icon: Icons.mail_outline,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Change Password",
                        icon: Icons.password,
                        onPress: () {}),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Listings".toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const Icon(Icons.check_circle_outline_outlined,
                              color: ViwahaColor.primary),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "My Listing", icon: Icons.notes, onPress: () {}),
                    ProfileMenuWidget(
                        title: "My Favorite",
                        icon: Icons.favorite_border_outlined,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Reviews",
                        icon: Icons.reviews_outlined,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: "Post Your Ad",
                        icon: Icons.add_circle_outline,
                        onPress: () {}),

                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        ref.read(isloginProvider.notifier).state = false;
                        AutoRouter.of(context).push(const Login());
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.logout_outlined,
                              color: Colors
                                  .white), // Replace Icons.copy with your desired icon.
                          SizedBox(
                              width:
                                  8), // Add some space between the icon and the text.
                          Text(
                            "LOGOUT",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            )
          : Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton.icon(
                  onPressed: () {
                    AutoRouter.of(context).push(const Login());
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
