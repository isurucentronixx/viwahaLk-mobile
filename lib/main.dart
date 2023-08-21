// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/theme.dart';

Future<void> main() async {
  // if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
  //   // initialiaze the facebook javascript SDK
  //   await FacebookAuth.instance.webAndDesktopInitialize(
  //     appId: "789086282822664",
  //     cookie: true,
  //     xfbml: true,
  //     version: "v15.0",
  //   );
  // }
  runApp(ProviderScope(child: App()));
}

// assuing this is the root widget of your App
class App extends ConsumerWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);
    return MaterialApp.router(
      title: 'Viwaha App',
      theme: MyTheme.lightTheme,
      // darkTheme: MyTheme.darkTheme,
      // routerConfig: _appRouter.config(),
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [RouteObserver()],
      ),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
