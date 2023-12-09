// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

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
        backgroundColor: const Color(0xff21B6A8),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 220,
            left: 50,
            right: 50),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    Future<bool?> _showConfirmationDialog(BuildContext context) async {
      return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content:
                const Text("Are you sure you want to delete your account?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Confirm"),
              ),
            ],
          );
        },
      );
    }

    void _showSecondAlert(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Account Removal Request Sent"),
            content: const Text(
                "Your account removal request has been sent. Our support team will connect with you to proceed with the deletion process."),
            actions: [
              TextButton(
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  final appRouter = ref.watch(appRouterProvider);
                  final _googleSignIn = GoogleSignIn();
                  ref.read(isloginProvider.notifier).state = false;
                  pref.remove("email");
                  pref.remove("password");
                  await _googleSignIn.signOut();
                  appRouter.push(Login(onHome: false));
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
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
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Assets
                                            .lib.assets.images.noProfile
                                            .image(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Hi,', style: Theme.of(context).textTheme.headline4),
                    Text(
                        '${user.firstname.toString()[0].toUpperCase()}${user.firstname.toString().substring(1).toLowerCase()} ${user.lastname != "" ? user.lastname != null ? user.lastname.toString()[0].toUpperCase() + user.lastname.toString().substring(1).toLowerCase() : "" : ""}',
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
                                  const Color(0xff21B6A8)),
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
                                  "POST YOUR LISTING",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 48)),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 255, 193, 7)),
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
                                const Icon(Icons.file_copy,
                                    color: Colors.black),
                                const SizedBox(width: 8),
                                Text(
                                  "Copy referral link".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
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
                            LocaleKeys.main.tr().toUpperCase(),
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
                        title: LocaleKeys.dashboard.tr(),
                        icon: Icons.settings,
                        onPress: () {
                          router.push(
                              UserDashboardPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.my_profile.tr(),
                        icon: Icons.person_outline_outlined,
                        onPress: () {
                          AutoRouter.of(context).push(const MyProfilePage());
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.edit_profile.tr(),
                        icon: Icons.edit_note,
                        onPress: () {
                          AutoRouter.of(context).push(const EditProfilePage());
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.message.tr(),
                        icon: Icons.mail_outline,
                        onPress: () {
                          AutoRouter.of(context)
                              .push(MessagesPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.change_password.tr(),
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
                            LocaleKeys.listings.tr().toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: LocaleKeys.my_listings.tr(),
                        icon: Icons.notes,
                        onPress: () {
                          // ref.refresh(myListingProvider);
                          // ref.refresh(vendorsProvider);
                          // ref.refresh(topListingProvider);
                          router.push(const MyListingPage());
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.my_favorite.tr(),
                        icon: Icons.favorite_border_outlined,
                        onPress: () {
                          setState(() {
                            ref.read(isSearchingProvider.notifier).state = true;
                          });

                          ref.refresh(favListingProvider);
                          router.push(FavListingPage(isAppBar: true));
                        }),
                    ProfileMenuWidget(
                        title: LocaleKeys.reviews.tr(),
                        icon: Icons.reviews_outlined,
                        onPress: () {
                          // router.push(const ReviewsPage());
                          AutoRouter.of(context)
                              .push(ReviewsPage(userId: user.id.toString()));
                        }),
                    ProfileMenuWidget(
                        title: "Post Your Listing",
                        icon: Icons.add_circle_outline,
                        onPress: () {
                          ref.read(mainImageNameProvider.notifier).state = "";
                          ref.read(imageNameGalleryProvider).clear();
                          ref.read(mainImageProvider.notifier).state = "";
                          ref.read(imageGalleryProvider).clear();

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
                        appRouter.push(Login(onHome: false));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.logout_outlined,
                              color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            LocaleKeys.logout.tr(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 48)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        bool? confirmed =
                            await _showConfirmationDialog(context);

                        // If the user confirms, show the second alert
                        if (confirmed!) {
                          _showSecondAlert(context);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.delete, color: Colors.red),
                          const SizedBox(width: 8),
                          Text(
                            "Delete Account",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.red),
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
                    AutoRouter.of(context).push(Login(onHome: false));
                  },
                  icon: const Icon(Icons.login),
                  label: Text(LocaleKeys.login.tr()),
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
