import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/theme.dart';

void main() {
  runApp(App());
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
