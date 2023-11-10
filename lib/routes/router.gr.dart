// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart' as _i30;
import 'package:viwaha_lk/models/search/search_result_item.dart' as _i29;
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart'
    as _i31;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i1;
import 'package:viwaha_lk/screens/add_listing/add_listing.dart' as _i2;
import 'package:viwaha_lk/screens/add_listing/edit_listing.dart' as _i3;
import 'package:viwaha_lk/screens/all_listing/all_listing.dart' as _i4;
import 'package:viwaha_lk/screens/category_listings/category_listing.dart'
    as _i5;
import 'package:viwaha_lk/screens/coming_soon.dart' as _i6;
import 'package:viwaha_lk/screens/contact_us_view.dart' as _i7;
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart' as _i8;
import 'package:viwaha_lk/screens/home_view.dart' as _i9;
import 'package:viwaha_lk/screens/login.dart' as _i13;
import 'package:viwaha_lk/screens/login/change_password.dart' as _i10;
import 'package:viwaha_lk/screens/login/login.dart' as _i11;
import 'package:viwaha_lk/screens/login/register.dart' as _i12;
import 'package:viwaha_lk/screens/messages/messages.dart' as _i14;
import 'package:viwaha_lk/screens/my_listings/my_listings.dart' as _i15;
import 'package:viwaha_lk/screens/profile/edit_profile.dart' as _i16;
import 'package:viwaha_lk/screens/profile/my_profile.dart' as _i17;
import 'package:viwaha_lk/screens/profile/profile.dart' as _i18;
import 'package:viwaha_lk/screens/profile/user_dashboard.dart' as _i20;
import 'package:viwaha_lk/screens/profile/vendor_profile.dart' as _i21;
import 'package:viwaha_lk/screens/reviews/reviews.dart' as _i19;
import 'package:viwaha_lk/screens/search/searching_page.dart' as _i22;
import 'package:viwaha_lk/screens/search/searching_result.dart' as _i23;
import 'package:viwaha_lk/screens/single_page/search_single_view.dart' as _i24;
import 'package:viwaha_lk/screens/single_page/single_view.dart' as _i25;
import 'package:viwaha_lk/screens/splash_screen/splash_screen.dart' as _i26;

abstract class $AppRouter extends _i27.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    AboutUsPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutUsPage(),
      );
    },
    AddListingPage.name: (routeData) {
      final args = routeData.argsAs<AddListingPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    EditListingPage.name: (routeData) {
      final args = routeData.argsAs<EditListingPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditListingPage(
          args.item,
          key: args.key,
        ),
      );
    },
    AllListingPage.name: (routeData) {
      final args = routeData.argsAs<AllListingPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AllListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    CategoryListingPage.name: (routeData) {
      final args = routeData.argsAs<CategoryListingPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CategoryListingPage(
          args.category,
          args.tags,
          key: args.key,
        ),
      );
    },
    ComingSoonPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ComingSoonPage(),
      );
    },
    ContactUsPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ContactUsPage(),
      );
    },
    FavListingPage.name: (routeData) {
      final args = routeData.argsAs<FavListingPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.FavListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    HomePage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomePage(),
      );
    },
    ChangePasswordPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ChangePasswordPage(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.Login(
          args.onHome,
          key: args.key,
        ),
      );
    },
    Register.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.Register(),
      );
    },
    LoginOld.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LoginOld(),
      );
    },
    MessagesPage.name: (routeData) {
      final args = routeData.argsAs<MessagesPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.MessagesPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    MyListingPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MyListingPage(),
      );
    },
    EditProfilePage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.EditProfilePage(),
      );
    },
    MyProfilePage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MyProfilePage(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfilePage(),
      );
    },
    ReviewsPage.name: (routeData) {
      final args = routeData.argsAs<ReviewsPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.ReviewsPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    UserDashboardPage.name: (routeData) {
      final args = routeData.argsAs<UserDashboardPageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.UserDashboardPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    VendorProfilePage.name: (routeData) {
      final args = routeData.argsAs<VendorProfilePageArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.VendorProfilePage(
          args.userId,
          key: args.key,
        ),
      );
    },
    SearchingPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SearchingResultsPage(),
      );
    },
    SearchSingleView.name: (routeData) {
      final args = routeData.argsAs<SearchSingleViewArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.SearchSingleView(
          args.item,
          args.type,
          key: args.key,
        ),
      );
    },
    SingleView.name: (routeData) {
      final args = routeData.argsAs<SingleViewArgs>();
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.SingleView(
          args.vendor,
          args.topListing,
          key: args.key,
          type: args.type,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutUsPage]
class AboutUsPage extends _i27.PageRouteInfo<void> {
  const AboutUsPage({List<_i27.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddListingPage]
class AddListingPage extends _i27.PageRouteInfo<AddListingPageArgs> {
  AddListingPage({
    required bool isAppBar,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AddListingPage.name,
          args: AddListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddListingPage';

  static const _i27.PageInfo<AddListingPageArgs> page =
      _i27.PageInfo<AddListingPageArgs>(name);
}

class AddListingPageArgs {
  const AddListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i28.Key? key;

  @override
  String toString() {
    return 'AddListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i3.EditListingPage]
class EditListingPage extends _i27.PageRouteInfo<EditListingPageArgs> {
  EditListingPage({
    required _i29.SearchResultItem? item,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EditListingPage.name,
          args: EditListingPageArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditListingPage';

  static const _i27.PageInfo<EditListingPageArgs> page =
      _i27.PageInfo<EditListingPageArgs>(name);
}

class EditListingPageArgs {
  const EditListingPageArgs({
    required this.item,
    this.key,
  });

  final _i29.SearchResultItem? item;

  final _i28.Key? key;

  @override
  String toString() {
    return 'EditListingPageArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i4.AllListingPage]
class AllListingPage extends _i27.PageRouteInfo<AllListingPageArgs> {
  AllListingPage({
    required bool isAppBar,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          AllListingPage.name,
          args: AllListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllListingPage';

  static const _i27.PageInfo<AllListingPageArgs> page =
      _i27.PageInfo<AllListingPageArgs>(name);
}

class AllListingPageArgs {
  const AllListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i28.Key? key;

  @override
  String toString() {
    return 'AllListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i5.CategoryListingPage]
class CategoryListingPage extends _i27.PageRouteInfo<CategoryListingPageArgs> {
  CategoryListingPage({
    required String category,
    required List<String> tags,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CategoryListingPage.name,
          args: CategoryListingPageArgs(
            category: category,
            tags: tags,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListingPage';

  static const _i27.PageInfo<CategoryListingPageArgs> page =
      _i27.PageInfo<CategoryListingPageArgs>(name);
}

class CategoryListingPageArgs {
  const CategoryListingPageArgs({
    required this.category,
    required this.tags,
    this.key,
  });

  final String category;

  final List<String> tags;

  final _i28.Key? key;

  @override
  String toString() {
    return 'CategoryListingPageArgs{category: $category, tags: $tags, key: $key}';
  }
}

/// generated route for
/// [_i6.ComingSoonPage]
class ComingSoonPage extends _i27.PageRouteInfo<void> {
  const ComingSoonPage({List<_i27.PageRouteInfo>? children})
      : super(
          ComingSoonPage.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ContactUsPage]
class ContactUsPage extends _i27.PageRouteInfo<void> {
  const ContactUsPage({List<_i27.PageRouteInfo>? children})
      : super(
          ContactUsPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i8.FavListingPage]
class FavListingPage extends _i27.PageRouteInfo<FavListingPageArgs> {
  FavListingPage({
    required bool isAppBar,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FavListingPage.name,
          args: FavListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FavListingPage';

  static const _i27.PageInfo<FavListingPageArgs> page =
      _i27.PageInfo<FavListingPageArgs>(name);
}

class FavListingPageArgs {
  const FavListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i28.Key? key;

  @override
  String toString() {
    return 'FavListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i9.HomePage]
class HomePage extends _i27.PageRouteInfo<void> {
  const HomePage({List<_i27.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChangePasswordPage]
class ChangePasswordPage extends _i27.PageRouteInfo<void> {
  const ChangePasswordPage({List<_i27.PageRouteInfo>? children})
      : super(
          ChangePasswordPage.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Login]
class Login extends _i27.PageRouteInfo<LoginArgs> {
  Login({
    required bool onHome,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(
            onHome: onHome,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i27.PageInfo<LoginArgs> page = _i27.PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({
    required this.onHome,
    this.key,
  });

  final bool onHome;

  final _i28.Key? key;

  @override
  String toString() {
    return 'LoginArgs{onHome: $onHome, key: $key}';
  }
}

/// generated route for
/// [_i12.Register]
class Register extends _i27.PageRouteInfo<void> {
  const Register({List<_i27.PageRouteInfo>? children})
      : super(
          Register.name,
          initialChildren: children,
        );

  static const String name = 'Register';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i13.LoginOld]
class LoginOld extends _i27.PageRouteInfo<void> {
  const LoginOld({List<_i27.PageRouteInfo>? children})
      : super(
          LoginOld.name,
          initialChildren: children,
        );

  static const String name = 'LoginOld';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MessagesPage]
class MessagesPage extends _i27.PageRouteInfo<MessagesPageArgs> {
  MessagesPage({
    required String userId,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MessagesPage.name,
          args: MessagesPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesPage';

  static const _i27.PageInfo<MessagesPageArgs> page =
      _i27.PageInfo<MessagesPageArgs>(name);
}

class MessagesPageArgs {
  const MessagesPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MessagesPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i15.MyListingPage]
class MyListingPage extends _i27.PageRouteInfo<void> {
  const MyListingPage({List<_i27.PageRouteInfo>? children})
      : super(
          MyListingPage.name,
          initialChildren: children,
        );

  static const String name = 'MyListingPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i16.EditProfilePage]
class EditProfilePage extends _i27.PageRouteInfo<void> {
  const EditProfilePage({List<_i27.PageRouteInfo>? children})
      : super(
          EditProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'EditProfilePage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MyProfilePage]
class MyProfilePage extends _i27.PageRouteInfo<void> {
  const MyProfilePage({List<_i27.PageRouteInfo>? children})
      : super(
          MyProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'MyProfilePage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfilePage]
class ProfilePage extends _i27.PageRouteInfo<void> {
  const ProfilePage({List<_i27.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i19.ReviewsPage]
class ReviewsPage extends _i27.PageRouteInfo<ReviewsPageArgs> {
  ReviewsPage({
    required String userId,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          ReviewsPage.name,
          args: ReviewsPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewsPage';

  static const _i27.PageInfo<ReviewsPageArgs> page =
      _i27.PageInfo<ReviewsPageArgs>(name);
}

class ReviewsPageArgs {
  const ReviewsPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i28.Key? key;

  @override
  String toString() {
    return 'ReviewsPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i20.UserDashboardPage]
class UserDashboardPage extends _i27.PageRouteInfo<UserDashboardPageArgs> {
  UserDashboardPage({
    required String userId,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          UserDashboardPage.name,
          args: UserDashboardPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDashboardPage';

  static const _i27.PageInfo<UserDashboardPageArgs> page =
      _i27.PageInfo<UserDashboardPageArgs>(name);
}

class UserDashboardPageArgs {
  const UserDashboardPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i28.Key? key;

  @override
  String toString() {
    return 'UserDashboardPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i21.VendorProfilePage]
class VendorProfilePage extends _i27.PageRouteInfo<VendorProfilePageArgs> {
  VendorProfilePage({
    required String userId,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          VendorProfilePage.name,
          args: VendorProfilePageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VendorProfilePage';

  static const _i27.PageInfo<VendorProfilePageArgs> page =
      _i27.PageInfo<VendorProfilePageArgs>(name);
}

class VendorProfilePageArgs {
  const VendorProfilePageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i28.Key? key;

  @override
  String toString() {
    return 'VendorProfilePageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i22.SearchingPage]
class SearchingPage extends _i27.PageRouteInfo<void> {
  const SearchingPage({List<_i27.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SearchingResultsPage]
class SearchingResultsPage extends _i27.PageRouteInfo<void> {
  const SearchingResultsPage({List<_i27.PageRouteInfo>? children})
      : super(
          SearchingResultsPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SearchSingleView]
class SearchSingleView extends _i27.PageRouteInfo<SearchSingleViewArgs> {
  SearchSingleView({
    required _i29.SearchResultItem? item,
    required String? type,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SearchSingleView.name,
          args: SearchSingleViewArgs(
            item: item,
            type: type,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchSingleView';

  static const _i27.PageInfo<SearchSingleViewArgs> page =
      _i27.PageInfo<SearchSingleViewArgs>(name);
}

class SearchSingleViewArgs {
  const SearchSingleViewArgs({
    required this.item,
    required this.type,
    this.key,
  });

  final _i29.SearchResultItem? item;

  final String? type;

  final _i28.Key? key;

  @override
  String toString() {
    return 'SearchSingleViewArgs{item: $item, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i25.SingleView]
class SingleView extends _i27.PageRouteInfo<SingleViewArgs> {
  SingleView({
    required _i30.Vendor? vendor,
    required _i31.TopListing? topListing,
    _i28.Key? key,
    String? type,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SingleView.name,
          args: SingleViewArgs(
            vendor: vendor,
            topListing: topListing,
            key: key,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleView';

  static const _i27.PageInfo<SingleViewArgs> page =
      _i27.PageInfo<SingleViewArgs>(name);
}

class SingleViewArgs {
  const SingleViewArgs({
    required this.vendor,
    required this.topListing,
    this.key,
    this.type,
  });

  final _i30.Vendor? vendor;

  final _i31.TopListing? topListing;

  final _i28.Key? key;

  final String? type;

  @override
  String toString() {
    return 'SingleViewArgs{vendor: $vendor, topListing: $topListing, key: $key, type: $type}';
  }
}

/// generated route for
/// [_i26.SplashScreen]
class SplashRoute extends _i27.PageRouteInfo<void> {
  const SplashRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}
