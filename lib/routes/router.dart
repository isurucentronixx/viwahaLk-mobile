import 'package:auto_route/auto_route.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/splashScreen', initial: true),
        AutoRoute(
          page: Login.page,
          path: '/login',
        ),

        AutoRoute(
          page: Register.page,
          path: '/register',
        ),
        AutoRoute(page: HomePage.page, path: '/homePage'),
        AutoRoute(page: AddListingPage.page, path: '/addListingPage'),
        AutoRoute(
          page: AboutUsPage.page,
          path: '/aboutPage',
        ),
        AutoRoute(
          page: ContactUsPage.page,
          path: '/contactPage',
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
        AutoRoute(page: MyProfilePage.page, path: "/myProfilePage"),
        AutoRoute(page: EditProfilePage.page, path: "/editProfilePage"),
        AutoRoute(page: MessagesPage.page, path: "/messagesPage"),
        AutoRoute(page: ReviewsPage.page, path: "/reviewsPage"),
        AutoRoute(page: ChangePasswordPage.page, path: "/changePasswordPage"),
        AutoRoute(page: FavListingPage.page, path: "/favListingPage"),
        AutoRoute(page: MyListingPage.page, path: "/myListingPage"),
        AutoRoute(page: EditListingPage.page, path: "/editListingPage"),
        AutoRoute(page: UserDashboardPage.page, path: "/userDashboardPage"),
        AutoRoute(page: VendorProfilePage.page, path: "/vendorProfilePage"),

        // AutoRoute(page: FacebookLogin.page, path: "/facebookLogin"),
      ];
}
