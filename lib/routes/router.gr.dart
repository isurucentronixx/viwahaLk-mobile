// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i20;
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart' as _i21;
import 'package:viwaha_lk/models/search/search_result_item.dart' as _i19;
import 'package:viwaha_lk/models/single_page/search_single_view.dart' as _i1;
import 'package:viwaha_lk/models/single_page/single_view.dart' as _i2;
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart'
    as _i22;
import 'package:viwaha_lk/models/venues/single_venues.dart' as _i3;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i4;
import 'package:viwaha_lk/screens/add_listing/add_listing.dart' as _i5;
import 'package:viwaha_lk/screens/all_listing/all_listing.dart' as _i6;
import 'package:viwaha_lk/screens/category_listings/category_listing.dart'
    as _i7;
import 'package:viwaha_lk/screens/coming_soon.dart' as _i8;
import 'package:viwaha_lk/screens/contact_us_view.dart' as _i9;
import 'package:viwaha_lk/screens/dressing_view.dart' as _i10;
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart' as _i11;
import 'package:viwaha_lk/screens/home_view.dart' as _i12;
import 'package:viwaha_lk/screens/login/login.dart' as _i13;
import 'package:viwaha_lk/screens/profile/profile.dart' as _i14;
import 'package:viwaha_lk/screens/search/searching_page.dart' as _i15;
import 'package:viwaha_lk/screens/search/searching_result.dart' as _i16;
import 'package:viwaha_lk/screens/venues_screen.dart' as _i17;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SearchSingleView.name: (routeData) {
      final args = routeData.argsAs<SearchSingleViewArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SearchSingleView(
          args.item,
          key: args.key,
        ),
      );
    },
    SingleView.name: (routeData) {
      final args = routeData.argsAs<SingleViewArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SingleView(
          args.vendor,
          args.topListing,
          key: args.key,
        ),
      );
    },
    VenusesSingleView.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.VenusesSingleView(),
      );
    },
    AboutUsPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AboutUsPage(),
      );
    },
    AddListingPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AddListingPage(),
      );
    },
    AllListingPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AllListingPage(),
      );
    },
    CategoryListingPage.name: (routeData) {
      final args = routeData.argsAs<CategoryListingPageArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CategoryListingPage(
          args.category,
          key: args.key,
        ),
      );
    },
    ComingSoonPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ComingSoonPage(),
      );
    },
    ContactUsPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ContactUsPage(),
      );
    },
    DressingRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.DressingScreen(),
      );
    },
    FavListingPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.FavListingPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomePage(),
      );
    },
    Login.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.Login(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ProfilePage(),
      );
    },
    SearchingPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SearchingResultsPage(),
      );
    },
    VenuesRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.VenuesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SearchSingleView]
class SearchSingleView extends _i18.PageRouteInfo<SearchSingleViewArgs> {
  SearchSingleView({
    required _i19.SearchResultItem? item,
    _i20.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SearchSingleView.name,
          args: SearchSingleViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchSingleView';

  static const _i18.PageInfo<SearchSingleViewArgs> page =
      _i18.PageInfo<SearchSingleViewArgs>(name);
}

class SearchSingleViewArgs {
  const SearchSingleViewArgs({
    required this.item,
    this.key,
  });

  final _i19.SearchResultItem? item;

  final _i20.Key? key;

  @override
  String toString() {
    return 'SearchSingleViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i2.SingleView]
class SingleView extends _i18.PageRouteInfo<SingleViewArgs> {
  SingleView({
    required _i21.Vendor? vendor,
    required _i22.TopListing? topListing,
    _i20.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SingleView.name,
          args: SingleViewArgs(
            vendor: vendor,
            topListing: topListing,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SingleView';

  static const _i18.PageInfo<SingleViewArgs> page =
      _i18.PageInfo<SingleViewArgs>(name);
}

class SingleViewArgs {
  const SingleViewArgs({
    required this.vendor,
    required this.topListing,
    this.key,
  });

  final _i21.Vendor? vendor;

  final _i22.TopListing? topListing;

  final _i20.Key? key;

  @override
  String toString() {
    return 'SingleViewArgs{vendor: $vendor, topListing: $topListing, key: $key}';
  }
}

/// generated route for
/// [_i3.VenusesSingleView]
class VenusesSingleView extends _i18.PageRouteInfo<void> {
  const VenusesSingleView({List<_i18.PageRouteInfo>? children})
      : super(
          VenusesSingleView.name,
          initialChildren: children,
        );

  static const String name = 'VenusesSingleView';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AboutUsPage]
class AboutUsPage extends _i18.PageRouteInfo<void> {
  const AboutUsPage({List<_i18.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AddListingPage]
class AddListingPage extends _i18.PageRouteInfo<void> {
  const AddListingPage({List<_i18.PageRouteInfo>? children})
      : super(
          AddListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AddListingPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AllListingPage]
class AllListingPage extends _i18.PageRouteInfo<void> {
  const AllListingPage({List<_i18.PageRouteInfo>? children})
      : super(
          AllListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AllListingPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CategoryListingPage]
class CategoryListingPage extends _i18.PageRouteInfo<CategoryListingPageArgs> {
  CategoryListingPage({
    required String category,
    _i20.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          CategoryListingPage.name,
          args: CategoryListingPageArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListingPage';

  static const _i18.PageInfo<CategoryListingPageArgs> page =
      _i18.PageInfo<CategoryListingPageArgs>(name);
}

class CategoryListingPageArgs {
  const CategoryListingPageArgs({
    required this.category,
    this.key,
  });

  final String category;

  final _i20.Key? key;

  @override
  String toString() {
    return 'CategoryListingPageArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [_i8.ComingSoonPage]
class ComingSoonPage extends _i18.PageRouteInfo<void> {
  const ComingSoonPage({List<_i18.PageRouteInfo>? children})
      : super(
          ComingSoonPage.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ContactUsPage]
class ContactUsPage extends _i18.PageRouteInfo<void> {
  const ContactUsPage({List<_i18.PageRouteInfo>? children})
      : super(
          ContactUsPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.DressingScreen]
class DressingRoute extends _i18.PageRouteInfo<void> {
  const DressingRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.FavListingPage]
class FavListingPage extends _i18.PageRouteInfo<void> {
  const FavListingPage({List<_i18.PageRouteInfo>? children})
      : super(
          FavListingPage.name,
          initialChildren: children,
        );

  static const String name = 'FavListingPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomePage]
class HomePage extends _i18.PageRouteInfo<void> {
  const HomePage({List<_i18.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.Login]
class Login extends _i18.PageRouteInfo<void> {
  const Login({List<_i18.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfilePage]
class ProfilePage extends _i18.PageRouteInfo<void> {
  const ProfilePage({List<_i18.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SearchingPage]
class SearchingPage extends _i18.PageRouteInfo<void> {
  const SearchingPage({List<_i18.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SearchingResultsPage]
class SearchingResultsPage extends _i18.PageRouteInfo<void> {
  const SearchingResultsPage({List<_i18.PageRouteInfo>? children})
      : super(
          SearchingResultsPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.VenuesScreen]
class VenuesRoute extends _i18.PageRouteInfo<void> {
  const VenuesRoute({List<_i18.PageRouteInfo>? children})
      : super(
          VenuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenuesRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
