import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: ViwahaColor.primary,
                    image: DecorationImage(
                        image: ref.watch(isloginProvider)
                            ? Assets.lib.assets.images.logoNav.image().image
                            : Assets.lib.assets.images.logoNav.image().image,
                        fit: BoxFit.contain,
                        alignment: Alignment.center),
                  ),
                  accountName: Text(ref.watch(isloginProvider)
                      ? '${user!.firstname.toString()} ${user.lastname.toString()}'
                      : ''),
                  accountEmail: Text(
                      ref.watch(isloginProvider) ? user!.email.toString() : ''),
                  currentAccountPicture: ref.watch(isloginProvider)
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: SizedBox(
                              child: CachedNetworkImage(
                                imageUrl: user!.image.toString(),
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    color: Colors.black,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Center(
                                  child: Image.network(
                                    'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(LocaleKeys.home.tr()),
                  onTap: () async {
                    AutoRouter.of(context).push(const HomePage());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(LocaleKeys.about_us.tr()),
                  onTap: () async {
                    AutoRouter.of(context).push(const AboutUsPage());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: Text(LocaleKeys.contact_us.tr()),
                  onTap: () {
                    AutoRouter.of(context).push(const ContactUsPage());
                  },
                ),
                const Divider(),
                !ref.read(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.login),
                        title: Text(LocaleKeys.login.tr()),
                        onTap: () {
                          AutoRouter.of(context).push(Login(onHome: false));
                        },
                      )
                    : const SizedBox(),
                ref.watch(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text(LocaleKeys.logout.tr()),
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          final appRouter = ref.watch(appRouterProvider);
                          final _googleSignIn = GoogleSignIn();
                          ref.read(isloginProvider.notifier).state = false;
                          pref.remove("email");
                          pref.remove("password");
                          await _googleSignIn.signOut();
                          appRouter.push(Login(onHome: false));
                          // Update the state of the app
                          // ...
                          // Then close the drawer

                          Navigator.pop(context);
                        },
                      )
                    : Container(),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Center(
              child: Text(
                'Version 1.0.0 powered by Viwaha.lk',
                style: TextStyle(fontSize: 12),
              ),
            ),
            onTap: () {
              // Handle 'Powered by Thushan' action
            },
          ),
        ],
      ),
    );
  }
}
