import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

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
                                  return Center(
                                    child: Image.network(
                                      'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () async {
                    AutoRouter.of(context).push(const HomePage());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('About Us'),
                  onTap: () async {
                    AutoRouter.of(context).push(const AboutUsPage());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.contact_phone),
                  title: const Text('Contact Us'),
                  onTap: () {
                    AutoRouter.of(context).push(const ContactUsPage());
                  },
                ),
                const Divider(),
                !ref.read(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.login),
                        title: const Text('Login'),
                        onTap: () {
                          AutoRouter.of(context).push(const Login());
                        },
                      )
                    : const SizedBox(),
                ref.watch(isloginProvider)
                    ? ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          final appRouter = ref.watch(appRouterProvider);
                          final _googleSignIn = GoogleSignIn();
                          ref.read(isloginProvider.notifier).state = false;
                          pref.remove("email");
                          pref.remove("password");
                          await _googleSignIn.signOut();
                          appRouter.push(const Login());
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
