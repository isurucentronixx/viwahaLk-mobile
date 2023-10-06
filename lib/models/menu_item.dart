import 'package:auto_route/auto_route.dart';
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

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> {
  String currLocale = 'en';
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currLocale = context.locale.toString();
    Future<void>? changeLng(String lng) async {
      setState(() {
        final appRouter = ref.watch(appRouterProvider);
        context.setLocale(Locale(lng));
        Navigator.pop(context);
        appRouter.push(const HomePage());
      });
    }

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
                      ? '${user!.firstname.toString()[0].toUpperCase()}${user!.firstname.toString().substring(1).toLowerCase()} ${user.lastname.toString()[0].toUpperCase()}${user.lastname.toString().substring(1).toLowerCase()}'
                      : ''),
                  accountEmail: Text(
                      ref.watch(isloginProvider) ? user!.email.toString() : ''),
                  // currentAccountPicture: ref.watch(isloginProvider)
                  //     ? Container(
                  //         decoration: BoxDecoration(
                  //           shape: BoxShape.circle,
                  //           border: Border.all(
                  //             color: Colors.white,
                  //             width: 2.0,
                  //           ),
                  //         ),
                  //         child: SizedBox(
                  //           width: 120,
                  //           height: 120,
                  //           child: SizedBox(
                  //             child: CachedNetworkImage(
                  //               imageUrl: user!.image.toString(),
                  //               fit: BoxFit.cover,
                  //               imageBuilder: (context, imageProvider) =>
                  //                   Container(
                  //                 decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   border: Border.all(
                  //                     color: Colors.white,
                  //                   ),
                  //                   image: DecorationImage(
                  //                     image: imageProvider,
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //               ),
                  //               placeholder: (context, url) => const Center(
                  //                   child: CircularProgressIndicator()),
                  //               errorWidget: (context, url, error) => Center(
                  //                 child: Image.network(
                  //                   'https://viwaha.lk/assets/img/logo/no_image.jpg',
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : Container(),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    LocaleKeys.home.tr(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  onTap: () async {
                    AutoRouter.of(context).push(const HomePage());
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(LocaleKeys.about_us.tr(),
                      style: const TextStyle(color: Colors.grey)),
                  onTap: () async {
                    AutoRouter.of(context).push(const AboutUsPage());
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: Text(LocaleKeys.contact_us.tr(),
                      style: const TextStyle(color: Colors.grey)),
                  onTap: () {
                    AutoRouter.of(context).push(const ContactUsPage());
                  },
                ),
                const Divider(),
                !ref.read(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.login),
                        title: Text(LocaleKeys.login.tr(),
                            style: const TextStyle(color: Colors.grey)),
                        onTap: () {
                          AutoRouter.of(context).push(Login(onHome: false));
                        },
                      )
                    : const SizedBox(),
                ref.watch(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text(LocaleKeys.logout.tr(),
                            style: const TextStyle(color: Colors.grey)),
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
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeLng('en');
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: currLocale == 'en'
                                  ? ViwahaColor.primary
                                  : ViwahaColor.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ViwahaColor.primary)),
                          child: Center(
                              child: Text(
                            'En',
                            style: TextStyle(
                                color: currLocale == 'en'
                                    ? Colors.white
                                    : ViwahaColor.primary),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          changeLng('si');
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: currLocale == 'si'
                                  ? ViwahaColor.primary
                                  : ViwahaColor.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ViwahaColor.primary)),
                          child: Center(
                              child: Text(
                            'සිං',
                            style: TextStyle(
                                color: currLocale == 'si'
                                    ? Colors.white
                                    : ViwahaColor.primary),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          changeLng('ta');
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: currLocale == 'ta'
                                  ? ViwahaColor.primary
                                  : ViwahaColor.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ViwahaColor.primary)),
                          child: Center(
                              child: Text(
                            'த',
                            style: TextStyle(
                                color: currLocale == 'ta'
                                    ? Colors.white
                                    : ViwahaColor.primary),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
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
