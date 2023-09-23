// ignore_for_file: use_key_in_widget_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:viwaha_lk/translations/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('si'),
        Locale('ta'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: ProviderScope(child: App())));
}

// assuing this is the root widget of your App
class App extends ConsumerWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(appRouterProvider);
    return MaterialApp.router(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false, 
      title: 'Viwaha App',
      theme: MyTheme.lightTheme,
      routerDelegate: AutoRouterDelegate(
        router,
        navigatorObservers: () => [RouteObserver()],
      ),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
