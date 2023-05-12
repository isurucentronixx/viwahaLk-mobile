import 'package:auto_route/auto_route.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomePage.page, path: '/homePage'),
        AutoRoute(page: AboutUsPage.page, path: '/aboutPage', initial: true),
      ];
}
