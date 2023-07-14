// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i15;
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart' as _i16;
import 'package:viwaha_lk/models/search/search_result_item.dart' as _i14;
import 'package:viwaha_lk/models/single_page/search_single_view.dart' as _i1;
import 'package:viwaha_lk/models/single_page/single_view.dart' as _i2;
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart'
    as _i17;
import 'package:viwaha_lk/models/venues/single_venues.dart' as _i3;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i4;
import 'package:viwaha_lk/screens/add_listing/add_listing.dart' as _i5;
import 'package:viwaha_lk/screens/all_listing/all_listing.dart' as _i6;
import 'package:viwaha_lk/screens/dressing_view.dart' as _i7;
import 'package:viwaha_lk/screens/home_view.dart' as _i8;
import 'package:viwaha_lk/screens/login.dart' as _i9;
import 'package:viwaha_lk/screens/search/searching_page.dart' as _i10;
import 'package:viwaha_lk/screens/search/searching_result.dart' as _i11;
import 'package:viwaha_lk/screens/venues_screen.dart' as _i12;
import 'package:viwaha_lk/screens/dashboard/couple_dashboard.dart' as _i14;
import 'package:viwaha_lk/screens/dashboard/checklist.dart' as _i15;
import 'package:viwaha_lk/screens/dashboard/guest_list.dart' as _i16;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SearchSingleView.name: (routeData) {
      final args = routeData.argsAs<SearchSingleViewArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SearchSingleView(
          args.item,
          key: args.key,
        ),
      );
    },
    SingleView.name: (routeData) {
      final args = routeData.argsAs<SingleViewArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SingleView(
          args.vendor,
          args.topListing,
          key: args.key,
        ),
      );
    },
    VenusesSingleView.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.VenusesSingleView(),
      );
    },
    AboutUsPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AboutUsPage(),
      );
    },
    AddListingPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AddListingPage(),
      );
    },
    AllListingPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AllListingPage(),
      );
    },
    DressingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DressingScreen(),
      );
    },
    HomePage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    Login.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Login(),
      );
    },
    SearchingPage.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      final args = routeData.argsAs<SearchingResultsPageArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SearchingResultsPage(
          args.premiumVendors,
          args.topListing,
          key: args.key,
        ),
      );
    },
    VenuesRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.VenuesScreen(),
      );
    },
    CoupleDashboardRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CoupleDashboard(),
      );
    },
    CoupleDashboardToDoRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.CoupleDashboardToDoList(),
      );
    },
    CoupleDashboardGuestListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CoupleDashboardGuestList(),
      );
    },
  };
}

/// generated route for
/// [_i1.SearchSingleView]
class SearchSingleView extends _i13.PageRouteInfo<SearchSingleViewArgs> {
  SearchSingleView({
    required _i14.SearchResultItem? item,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SearchSingleView.name,
          args: SearchSingleViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchSingleView';

  static const _i13.PageInfo<SearchSingleViewArgs> page =
      _i13.PageInfo<SearchSingleViewArgs>(name);
}

class SearchSingleViewArgs {
  const SearchSingleViewArgs({
    required this.item,
    this.key,
  });

  final _i14.SearchResultItem? item;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SearchSingleViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i2.SingleView]
class SingleView extends _i13.PageRouteInfo<SingleViewArgs> {
  SingleView({
    required _i16.Vendor? vendor,
    required _i17.TopListing? topListing,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
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

  static const _i13.PageInfo<SingleViewArgs> page =
      _i13.PageInfo<SingleViewArgs>(name);
}

class SingleViewArgs {
  const SingleViewArgs({
    required this.vendor,
    required this.topListing,
    this.key,
  });

  final _i16.Vendor? vendor;

  final _i17.TopListing? topListing;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SingleViewArgs{vendor: $vendor, topListing: $topListing, key: $key}';
  }
}

/// generated route for
/// [_i3.VenusesSingleView]
class VenusesSingleView extends _i13.PageRouteInfo<void> {
  const VenusesSingleView({List<_i13.PageRouteInfo>? children})
      : super(
          VenusesSingleView.name,
          initialChildren: children,
        );

  static const String name = 'VenusesSingleView';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AboutUsPage]
class AboutUsPage extends _i13.PageRouteInfo<void> {
  const AboutUsPage({List<_i13.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AddListingPage]
class AddListingPage extends _i13.PageRouteInfo<void> {
  const AddListingPage({List<_i13.PageRouteInfo>? children})
      : super(
          AddListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AddListingPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AllListingPage]
class AllListingPage extends _i13.PageRouteInfo<void> {
  const AllListingPage({List<_i13.PageRouteInfo>? children})
      : super(
          AllListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AllListingPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DressingScreen]
class DressingRoute extends _i13.PageRouteInfo<void> {
  const DressingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomePage extends _i13.PageRouteInfo<void> {
  const HomePage({List<_i13.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Login]
class Login extends _i13.PageRouteInfo<void> {
  const Login({List<_i13.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SearchingPage]
class SearchingPage extends _i13.PageRouteInfo<void> {
  const SearchingPage({List<_i13.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SearchingResultsPage]
class SearchingResultsPage
    extends _i13.PageRouteInfo<SearchingResultsPageArgs> {
  SearchingResultsPage({
    required bool? premiumVendors,
    required bool? topListing,
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          SearchingResultsPage.name,
          args: SearchingResultsPageArgs(
            premiumVendors: premiumVendors,
            topListing: topListing,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i13.PageInfo<SearchingResultsPageArgs> page =
      _i13.PageInfo<SearchingResultsPageArgs>(name);
}

class SearchingResultsPageArgs {
  const SearchingResultsPageArgs({
    required this.premiumVendors,
    required this.topListing,
    this.key,
  });

  final bool? premiumVendors;

  final bool? topListing;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SearchingResultsPageArgs{premiumVendors: $premiumVendors, topListing: $topListing, key: $key}';
  }
}

/// generated route for
/// [_i12.VenuesScreen]
class VenuesRoute extends _i13.PageRouteInfo<void> {
  const VenuesRoute({List<_i13.PageRouteInfo>? children})
      : super(
          VenuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenuesRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CoupleDashboard]
class CoupleDashboardRoute extends _i13.PageRouteInfo<void> {
  const CoupleDashboardRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CoupleDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CoupleDashboardToDoList]
class CoupleDashboardToDoRoute extends _i13.PageRouteInfo<void> {
  const CoupleDashboardToDoRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CoupleDashboardToDoRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardToDoRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i15.CoupleDashboardGuestList]
class CoupleDashboardGuestListRoute extends _i13.PageRouteInfo<void> {
  const CoupleDashboardGuestListRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CoupleDashboardGuestListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardGuestListRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
