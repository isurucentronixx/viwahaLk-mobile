// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    isLogged();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future isLogged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final appRouter = ref.watch(appRouterProvider);

    var currentPhone =
        pref.containsKey("email") ? pref.getString("email").toString() : null;

    if (currentPhone != null) { 
      await ref
          .read(loginControllerProvider)
          .fetchUser(
              username: pref.getString("email").toString(),
              password: pref.getString("password").toString())
          .then((value) async {
        ref.read(userProvider.notifier).state = value;
        ref.read(isloginProvider.notifier).state = true;
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Welcome back!',
            message:
                "Hi ${value.user!.firstname.toString()}, Welcome back to the Viwaha mobile app. let's make your celebrations great.",
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: ViwahaColor.primary,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);

        appRouter.push(const HomePage());
      });
    } else {
      final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Welcome!',
            message:
                "Hi, Welcome to the Viwaha mobile app. let's make your celebrations great.",
            inMaterialBanner: false,
            contentType: ContentType.success,
            color: ViwahaColor.primary,
          ));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      appRouter.push(const HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Loading Bar
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context)
                  .primaryColor, // You can replace this with your desired color
            ),
            backgroundColor: Colors.grey[300],
          ),
          // Fading Logo
          FadeTransition(
            opacity: _animation,
            child: Container(
              alignment: Alignment.center,
              color: const Color.fromARGB(251, 251, 252, 254),
              child: Assets.lib.assets.images.logoDark.image(width: 170),
            ),
          ),
        ],
      ),
    );
  }
}
