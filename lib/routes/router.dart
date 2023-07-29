import 'package:auto_route/auto_route.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: Login.page,
          path: '/login',
        ),
        AutoRoute(page: HomePage.page, path: '/homePage', initial: true),
        AutoRoute(page: AddListingPage.page, path: '/addListingPage'),
        AutoRoute(
          page: AboutUsPage.page,
          path: '/aboutPage',
        ),
        AutoRoute(
          page: ContactUsPage.page,
          path: '/aboutPage',
        ),

        AutoRoute(page: VenuesRoute.page, path: "/venuesPage"),
        AutoRoute(page: DressingRoute.page, path: "/dressingPage"),
        AutoRoute(page: VenusesSingleView.page, path: "/singleVenuesPage"),
        AutoRoute(page: SingleView.page, path: "/singlePage"),
        AutoRoute(page: SearchSingleView.page, path: "/searchSinglePage"),
        AutoRoute(page: SearchingPage.page, path: "/searchingPage"),
        AutoRoute(
            page: SearchingResultsPage.page, path: "/searchingResultsPage"),
        AutoRoute(page: CategoryListingPage.page, path: "/categoryListingPage"),
        AutoRoute(page: ProfilePage.page, path: "/profilePage"),
        // AutoRoute(page: FacebookLogin.page, path: "/facebookLogin"),
      ];
}
