// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i26;
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart' as _i27;
import 'package:viwaha_lk/models/search/search_result_item.dart' as _i25;
import 'package:viwaha_lk/models/single_page/search_single_view.dart' as _i1;
import 'package:viwaha_lk/models/single_page/single_view.dart' as _i2;
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart'
    as _i28;
import 'package:viwaha_lk/models/venues/single_venues.dart' as _i3;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i13;
import 'package:viwaha_lk/screens/add_listing/add_listing.dart' as _i11;
import 'package:viwaha_lk/screens/all_listing/all_listing.dart' as _i4;
import 'package:viwaha_lk/screens/category_listings/category_listing.dart'
    as _i14;
import 'package:viwaha_lk/screens/coming_soon.dart' as _i12;
import 'package:viwaha_lk/screens/contact_us_view.dart' as _i15;
import 'package:viwaha_lk/screens/dashboard/checklist.dart' as _i23;
import 'package:viwaha_lk/screens/dashboard/checklist_view.dart' as _i18;
import 'package:viwaha_lk/screens/dashboard/couple_dashboard.dart' as _i22;
import 'package:viwaha_lk/screens/dashboard/dashboard.dart' as _i20;
import 'package:viwaha_lk/screens/dashboard/guest_list.dart' as _i21;
import 'package:viwaha_lk/screens/dashboard/guest_list_view.dart' as _i19;
import 'package:viwaha_lk/screens/dressing_view.dart' as _i6;
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart' as _i17;
import 'package:viwaha_lk/screens/home_view.dart' as _i5;
import 'package:viwaha_lk/screens/login/login.dart' as _i8;
import 'package:viwaha_lk/screens/profile/profile.dart' as _i16;
import 'package:viwaha_lk/screens/search/searching_page.dart' as _i9;
import 'package:viwaha_lk/screens/search/searching_result.dart' as _i10;
import 'package:viwaha_lk/screens/venues_screen.dart' as _i7;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    SearchSingleView.name: (routeData) {
      final args = routeData.argsAs<SearchSingleViewArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SearchSingleView(
          args.item,
          key: args.key,
        ),
      );
    },
    SingleView.name: (routeData) {
      final args = routeData.argsAs<SingleViewArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SingleView(
          args.vendor,
          args.topListing,
          key: args.key,
        ),
      );
    },
    VenusesSingleView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.VenusesSingleView(),
      );
    },
    AllListingPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AllListingPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    DressingRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DressingScreen(),
      );
    },
    VenuesRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.VenuesScreen(),
      );
    },
    Login.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Login(),
      );
    },
    SearchingPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SearchingResultsPage(),
      );
    },
    AddListingPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.AddListingPage(),
      );
    },
    ComingSoonPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ComingSoonPage(),
      );
    },
    AboutUsPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.AboutUsPage(),
      );
    },
    CategoryListingPage.name: (routeData) {
      final args = routeData.argsAs<CategoryListingPageArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.CategoryListingPage(
          args.category,
          key: args.key,
        ),
      );
    },
    ContactUsPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ContactUsPage(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    FavListingPage.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.FavListingPage(),
      );
    },
    ToDoList.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ToDoList(),
      );
    },
    GuestListView.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.GuestListView(),
      );
    },
    CoupleInfoSection.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.CoupleInfoSection(),
      );
    },
    CoupleDashboardGuestList.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.CoupleDashboardGuestList(),
      );
    },
    CoupleDashboard.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.CoupleDashboard(),
      );
    },
    CoupleDashboardToDoList.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.CoupleDashboardToDoList(),
      );
    },
  };
}

/// generated route for
/// [_i1.SearchSingleView]
class SearchSingleView extends _i24.PageRouteInfo<SearchSingleViewArgs> {
  SearchSingleView({
    required _i25.SearchResultItem? item,
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SearchSingleView.name,
          args: SearchSingleViewArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchSingleView';

  static const _i24.PageInfo<SearchSingleViewArgs> page =
      _i24.PageInfo<SearchSingleViewArgs>(name);
}

class SearchSingleViewArgs {
  const SearchSingleViewArgs({
    required this.item,
    this.key,
  });

  final _i25.SearchResultItem? item;

  final _i26.Key? key;

  @override
  String toString() {
    return 'SearchSingleViewArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i2.SingleView]
class SingleView extends _i24.PageRouteInfo<SingleViewArgs> {
  SingleView({
    required _i27.Vendor? vendor,
    required _i28.TopListing? topListing,
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
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

  static const _i24.PageInfo<SingleViewArgs> page =
      _i24.PageInfo<SingleViewArgs>(name);
}

class SingleViewArgs {
  const SingleViewArgs({
    required this.vendor,
    required this.topListing,
    this.key,
  });

  final _i27.Vendor? vendor;

  final _i28.TopListing? topListing;

  final _i26.Key? key;

  @override
  String toString() {
    return 'SingleViewArgs{vendor: $vendor, topListing: $topListing, key: $key}';
  }
}

/// generated route for
/// [_i3.VenusesSingleView]
class VenusesSingleView extends _i24.PageRouteInfo<void> {
  const VenusesSingleView({List<_i24.PageRouteInfo>? children})
      : super(
          VenusesSingleView.name,
          initialChildren: children,
        );

  static const String name = 'VenusesSingleView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AllListingPage]
class AllListingPage extends _i24.PageRouteInfo<void> {
  const AllListingPage({List<_i24.PageRouteInfo>? children})
      : super(
          AllListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AllListingPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomePage extends _i24.PageRouteInfo<void> {
  const HomePage({List<_i24.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DressingScreen]
class DressingRoute extends _i24.PageRouteInfo<void> {
  const DressingRoute({List<_i24.PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i7.VenuesScreen]
class VenuesRoute extends _i24.PageRouteInfo<void> {
  const VenuesRoute({List<_i24.PageRouteInfo>? children})
      : super(
          VenuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenuesRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Login]
class Login extends _i24.PageRouteInfo<void> {
  const Login({List<_i24.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SearchingPage]
class SearchingPage extends _i24.PageRouteInfo<void> {
  const SearchingPage({List<_i24.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SearchingResultsPage]
class SearchingResultsPage extends _i24.PageRouteInfo<void> {
  const SearchingResultsPage({List<_i24.PageRouteInfo>? children})
      : super(
          SearchingResultsPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.AddListingPage]
class AddListingPage extends _i24.PageRouteInfo<void> {
  const AddListingPage({List<_i24.PageRouteInfo>? children})
      : super(
          AddListingPage.name,
          initialChildren: children,
        );

  static const String name = 'AddListingPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ComingSoonPage]
class ComingSoonPage extends _i24.PageRouteInfo<void> {
  const ComingSoonPage({List<_i24.PageRouteInfo>? children})
      : super(
          ComingSoonPage.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.AboutUsPage]
class AboutUsPage extends _i24.PageRouteInfo<void> {
  const AboutUsPage({List<_i24.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CategoryListingPage]
class CategoryListingPage extends _i24.PageRouteInfo<CategoryListingPageArgs> {
  CategoryListingPage({
    required String category,
    _i26.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CategoryListingPage.name,
          args: CategoryListingPageArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListingPage';

  static const _i24.PageInfo<CategoryListingPageArgs> page =
      _i24.PageInfo<CategoryListingPageArgs>(name);
}

class CategoryListingPageArgs {
  const CategoryListingPageArgs({
    required this.category,
    this.key,
  });

  final String category;

  final _i26.Key? key;

  @override
  String toString() {
    return 'CategoryListingPageArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [_i15.ContactUsPage]
class ContactUsPage extends _i24.PageRouteInfo<void> {
  const ContactUsPage({List<_i24.PageRouteInfo>? children})
      : super(
          ContactUsPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfilePage]
class ProfilePage extends _i24.PageRouteInfo<void> {
  const ProfilePage({List<_i24.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.FavListingPage]
class FavListingPage extends _i24.PageRouteInfo<void> {
  const FavListingPage({List<_i24.PageRouteInfo>? children})
      : super(
          FavListingPage.name,
          initialChildren: children,
        );

  static const String name = 'FavListingPage';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ToDoList]
class ToDoList extends _i24.PageRouteInfo<void> {
  const ToDoList({List<_i24.PageRouteInfo>? children})
      : super(
          ToDoList.name,
          initialChildren: children,
        );

  static const String name = 'ToDoList';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.GuestListView]
class GuestListView extends _i24.PageRouteInfo<void> {
  const GuestListView({List<_i24.PageRouteInfo>? children})
      : super(
          GuestListView.name,
          initialChildren: children,
        );

  static const String name = 'GuestListView';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.CoupleInfoSection]
class CoupleInfoSection extends _i24.PageRouteInfo<void> {
  const CoupleInfoSection({List<_i24.PageRouteInfo>? children})
      : super(
          CoupleInfoSection.name,
          initialChildren: children,
        );

  static const String name = 'CoupleInfoSection';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.CoupleDashboardGuestList]
class CoupleDashboardGuestList extends _i24.PageRouteInfo<void> {
  const CoupleDashboardGuestList({List<_i24.PageRouteInfo>? children})
      : super(
          CoupleDashboardGuestList.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardGuestList';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.CoupleDashboard]
class CoupleDashboard extends _i24.PageRouteInfo<void> {
  const CoupleDashboard({List<_i24.PageRouteInfo>? children})
      : super(
          CoupleDashboard.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboard';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.CoupleDashboardToDoList]
class CoupleDashboardToDoList extends _i24.PageRouteInfo<void> {
  const CoupleDashboardToDoList({List<_i24.PageRouteInfo>? children})
      : super(
          CoupleDashboardToDoList.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardToDoList';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
