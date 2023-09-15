// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).user;
    final router = ref.watch(appRouterProvider);
    void _copyReferralLink(BuildContext context) {
      String referralLink =
          'https://viwaha.lk/register?ref=${user!.id}'; // Replace with your actual link
      Clipboard.setData(ClipboardData(text: referralLink));

      SnackBar snackBar = SnackBar(
        content:
            const Text('Referral link copied!', style: TextStyle(fontSize: 15)),
        backgroundColor: ViwahaColor.primary,
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 220,
            left: 50,
            right: 50),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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
                                  user!.image.toString(),
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
                    Text(
                        '${user.firstname} ${user.lastname != "" ? user.lastname != null ? user.lastname : "" : ""}',
                        style: Theme.of(context).textTheme.bodyText2),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 48)),
                              backgroundColor: MaterialStateProperty.all(
                                  ViwahaColor.primary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              ref.read(mainImageNameProvider.notifier).state =
                                  "";
                              ref.read(imageNameGalleryProvider).clear();
                              ref.read(mainImageProvider.notifier).state = "";
                              ref.read(imageGalleryProvider).clear();
                              AutoRouter.of(context)
                                  .push(AddListingPage(isAppBar: true));
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "POST YOUR ADD",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 48)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            onPressed: () => _copyReferralLink(context),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.copy_all_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text(
                                  "Copy referral link".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
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
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),

                    /// -- MENU
                    ProfileMenuWidget(
                        title: "Dashboard",
                        icon: Icons.settings,
                        onPress: () {
                          router.push(
                              UserDashboardPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: "My Profile",
                        icon: Icons.person_outline_outlined,
                        onPress: () {
                          AutoRouter.of(context).push(const MyProfilePage());
                        }),
                    ProfileMenuWidget(
                        title: "Edit Profile",
                        icon: Icons.edit_note,
                        onPress: () {
                          AutoRouter.of(context).push(const EditProfilePage());
                        }),
                    ProfileMenuWidget(
                        title: "Message",
                        icon: Icons.mail_outline,
                        onPress: () {
                          AutoRouter.of(context)
                              .push(MessagesPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: "Change Password",
                        icon: Icons.password,
                        onPress: () {
                          AutoRouter.of(context)
                              .push(const ChangePasswordPage());
                        }),

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
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: "My Listing",
                        icon: Icons.notes,
                        onPress: () {
                          ref.refresh(myListingProvider);
                          router.push(const MyListingPage());
                        }),
                    ProfileMenuWidget(
                        title: "My Favorite",
                        icon: Icons.favorite_border_outlined,
                        onPress: () {
                          router.push(FavListingPage(isAppBar: true));
                        }),
                    ProfileMenuWidget(
                        title: "Reviews",
                        icon: Icons.reviews_outlined,
                        onPress: () {
                          // router.push(const ReviewsPage());
                          AutoRouter.of(context)
                              .push(ReviewsPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: "Post Your Ad",
                        icon: Icons.add_circle_outline,
                        onPress: () {
                          ref.read(mainImageNameProvider.notifier).state = "";
                          ref.read(imageNameGalleryProvider).clear();
                          ref.read(mainImageProvider.notifier).state = "";
                          ref.read(imageGalleryProvider).clear();
                          print("ASDSADASDSADSD");
                          router.push(AddListingPage(isAppBar: true));
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 48)),
                        backgroundColor:
                            MaterialStateProperty.all(ViwahaColor.primary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();

                        final appRouter = ref.watch(appRouterProvider);
                        final _googleSignIn = GoogleSignIn();
                        ref.read(isloginProvider.notifier).state = false;
                        pref.remove("email");
                        pref.remove("password");
                        await _googleSignIn.signOut();
                        appRouter.push(const Login());
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
                    const SizedBox(height: 50),
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
