// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/theme.dart';

Future<void> main() async {
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.macOS) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "789086282822664",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }
  runApp(ProviderScope(child: App()));
}

// assuing this is the root widget of your App
class App extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
