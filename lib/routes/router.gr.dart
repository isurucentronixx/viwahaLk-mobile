// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i36;
import 'package:flutter/material.dart' as _i37;
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart' as _i39;
import 'package:viwaha_lk/models/search/search_result_item.dart' as _i38;
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart'
    as _i40;
import 'package:viwaha_lk/models/venues/single_venues.dart' as _i1;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i2;
import 'package:viwaha_lk/screens/add_listing/add_listing.dart' as _i3;
import 'package:viwaha_lk/screens/add_listing/edit_listing.dart' as _i4;
import 'package:viwaha_lk/screens/all_listing/all_listing.dart' as _i5;
import 'package:viwaha_lk/screens/category_listings/category_listing.dart'
    as _i6;
import 'package:viwaha_lk/screens/coming_soon.dart' as _i7;
import 'package:viwaha_lk/screens/contact_us_view.dart' as _i8;
import 'package:viwaha_lk/screens/dashboard/checklist.dart' as _i9;
import 'package:viwaha_lk/screens/dashboard/checklist_view.dart' as _i10;
import 'package:viwaha_lk/screens/dashboard/couple_dashboard.dart' as _i11;
import 'package:viwaha_lk/screens/dashboard/dashboard.dart' as _i12;
import 'package:viwaha_lk/screens/dashboard/guest_list.dart' as _i13;
import 'package:viwaha_lk/screens/dashboard/guest_list_view.dart' as _i14;
import 'package:viwaha_lk/screens/dressing_view.dart' as _i15;
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart' as _i16;
import 'package:viwaha_lk/screens/home_view.dart' as _i17;
import 'package:viwaha_lk/screens/login.dart' as _i21;
import 'package:viwaha_lk/screens/login/change_password.dart' as _i18;
import 'package:viwaha_lk/screens/login/login.dart' as _i19;
import 'package:viwaha_lk/screens/login/register.dart' as _i20;
import 'package:viwaha_lk/screens/messages/messages.dart' as _i22;
import 'package:viwaha_lk/screens/my_listings/my_listings.dart' as _i23;
import 'package:viwaha_lk/screens/profile/edit_profile.dart' as _i24;
import 'package:viwaha_lk/screens/profile/my_profile.dart' as _i25;
import 'package:viwaha_lk/screens/profile/profile.dart' as _i26;
import 'package:viwaha_lk/screens/profile/user_dashboard.dart' as _i28;
import 'package:viwaha_lk/screens/profile/vendor_profile.dart' as _i29;
import 'package:viwaha_lk/screens/reviews/reviews.dart' as _i27;
import 'package:viwaha_lk/screens/search/searching_page.dart' as _i30;
import 'package:viwaha_lk/screens/search/searching_result.dart' as _i31;
import 'package:viwaha_lk/screens/single_page/search_single_view.dart' as _i32;
import 'package:viwaha_lk/screens/single_page/single_view.dart' as _i33;
import 'package:viwaha_lk/screens/splash_screen/splash_screen.dart' as _i34;
import 'package:viwaha_lk/screens/venues_screen.dart' as _i35;

abstract class $AppRouter extends _i36.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    VenusesSingleView.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.VenusesSingleView(),
      );
    },
    AboutUsPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AboutUsPage(),
      );
    },
    AddListingPage.name: (routeData) {
      final args = routeData.argsAs<AddListingPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    EditListingPage.name: (routeData) {
      final args = routeData.argsAs<EditListingPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EditListingPage(
          args.item,
          key: args.key,
        ),
      );
    },
    AllListingPage.name: (routeData) {
      final args = routeData.argsAs<AllListingPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AllListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    CategoryListingPage.name: (routeData) {
      final args = routeData.argsAs<CategoryListingPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CategoryListingPage(
          args.category,
          key: args.key,
        ),
      );
    },
    ComingSoonPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ComingSoonPage(),
      );
    },
    ContactUsPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ContactUsPage(),
      );
    },
    CoupleDashboardToDoList.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CoupleDashboardToDoList(),
      );
    },
    ToDoList.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ToDoList(),
      );
    },
    CoupleDashboard.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.CoupleDashboard(),
      );
    },
    CoupleInfoSection.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.CoupleInfoSection(),
      );
    },
    CoupleDashboardGuestList.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.CoupleDashboardGuestList(),
      );
    },
    GuestListView.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.GuestListView(),
      );
    },
    DressingRoute.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.DressingScreen(),
      );
    },
    FavListingPage.name: (routeData) {
      final args = routeData.argsAs<FavListingPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.FavListingPage(
          args.isAppBar,
          key: args.key,
        ),
      );
    },
    HomePage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.HomePage(),
      );
    },
    ChangePasswordPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ChangePasswordPage(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.Login(
          args.onHome,
          key: args.key,
        ),
      );
    },
    Register.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.Register(),
      );
    },
    LoginOld.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.LoginOld(),
      );
    },
    MessagesPage.name: (routeData) {
      final args = routeData.argsAs<MessagesPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.MessagesPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    MyListingPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.MyListingPage(),
      );
    },
    EditProfilePage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.EditProfilePage(),
      );
    },
    MyProfilePage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.MyProfilePage(),
      );
    },
    ProfilePage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.ProfilePage(),
      );
    },
    ReviewsPage.name: (routeData) {
      final args = routeData.argsAs<ReviewsPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.ReviewsPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    UserDashboardPage.name: (routeData) {
      final args = routeData.argsAs<UserDashboardPageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.UserDashboardPage(
          args.userId,
          key: args.key,
        ),
      );
    },
    VendorProfilePage.name: (routeData) {
      final args = routeData.argsAs<VendorProfilePageArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.VendorProfilePage(
          args.userId,
          key: args.key,
        ),
      );
    },
    SearchingPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SearchingPage(),
      );
    },
    SearchingResultsPage.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.SearchingResultsPage(),
      );
    },
    SearchSingleView.name: (routeData) {
      final args = routeData.argsAs<SearchSingleViewArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.SearchSingleView(
          args.item,
          args.type,
          key: args.key,
        ),
      );
    },
    SingleView.name: (routeData) {
      final args = routeData.argsAs<SingleViewArgs>();
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.SingleView(
          args.vendor,
          args.topListing,
          key: args.key,
          type: args.type,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.SplashScreen(),
      );
    },
    VenuesRoute.name: (routeData) {
      return _i36.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.VenuesScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.VenusesSingleView]
class VenusesSingleView extends _i36.PageRouteInfo<void> {
  const VenusesSingleView({List<_i36.PageRouteInfo>? children})
      : super(
          VenusesSingleView.name,
          initialChildren: children,
        );

  static const String name = 'VenusesSingleView';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AboutUsPage]
class AboutUsPage extends _i36.PageRouteInfo<void> {
  const AboutUsPage({List<_i36.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddListingPage]
class AddListingPage extends _i36.PageRouteInfo<AddListingPageArgs> {
  AddListingPage({
    required bool isAppBar,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          AddListingPage.name,
          args: AddListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddListingPage';

  static const _i36.PageInfo<AddListingPageArgs> page =
      _i36.PageInfo<AddListingPageArgs>(name);
}

class AddListingPageArgs {
  const AddListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i37.Key? key;

  @override
  String toString() {
    return 'AddListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i4.EditListingPage]
class EditListingPage extends _i36.PageRouteInfo<EditListingPageArgs> {
  EditListingPage({
    required _i38.SearchResultItem? item,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          EditListingPage.name,
          args: EditListingPageArgs(
            item: item,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditListingPage';

  static const _i36.PageInfo<EditListingPageArgs> page =
      _i36.PageInfo<EditListingPageArgs>(name);
}

class EditListingPageArgs {
  const EditListingPageArgs({
    required this.item,
    this.key,
  });

  final _i38.SearchResultItem? item;

  final _i37.Key? key;

  @override
  String toString() {
    return 'EditListingPageArgs{item: $item, key: $key}';
  }
}

/// generated route for
/// [_i5.AllListingPage]
class AllListingPage extends _i36.PageRouteInfo<AllListingPageArgs> {
  AllListingPage({
    required bool isAppBar,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          AllListingPage.name,
          args: AllListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AllListingPage';

  static const _i36.PageInfo<AllListingPageArgs> page =
      _i36.PageInfo<AllListingPageArgs>(name);
}

class AllListingPageArgs {
  const AllListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i37.Key? key;

  @override
  String toString() {
    return 'AllListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i6.CategoryListingPage]
class CategoryListingPage extends _i36.PageRouteInfo<CategoryListingPageArgs> {
  CategoryListingPage({
    required String category,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          CategoryListingPage.name,
          args: CategoryListingPageArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListingPage';

  static const _i36.PageInfo<CategoryListingPageArgs> page =
      _i36.PageInfo<CategoryListingPageArgs>(name);
}

class CategoryListingPageArgs {
  const CategoryListingPageArgs({
    required this.category,
    this.key,
  });

  final String category;

  final _i37.Key? key;

  @override
  String toString() {
    return 'CategoryListingPageArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [_i7.ComingSoonPage]
class ComingSoonPage extends _i36.PageRouteInfo<void> {
  const ComingSoonPage({List<_i36.PageRouteInfo>? children})
      : super(
          ComingSoonPage.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ContactUsPage]
class ContactUsPage extends _i36.PageRouteInfo<void> {
  const ContactUsPage({List<_i36.PageRouteInfo>? children})
      : super(
          ContactUsPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactUsPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CoupleDashboardToDoList]
class CoupleDashboardToDoList extends _i36.PageRouteInfo<void> {
  const CoupleDashboardToDoList({List<_i36.PageRouteInfo>? children})
      : super(
          CoupleDashboardToDoList.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardToDoList';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ToDoList]
class ToDoList extends _i36.PageRouteInfo<void> {
  const ToDoList({List<_i36.PageRouteInfo>? children})
      : super(
          ToDoList.name,
          initialChildren: children,
        );

  static const String name = 'ToDoList';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CoupleDashboard]
class CoupleDashboard extends _i36.PageRouteInfo<void> {
  const CoupleDashboard({List<_i36.PageRouteInfo>? children})
      : super(
          CoupleDashboard.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboard';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CoupleInfoSection]
class CoupleInfoSection extends _i36.PageRouteInfo<void> {
  const CoupleInfoSection({List<_i36.PageRouteInfo>? children})
      : super(
          CoupleInfoSection.name,
          initialChildren: children,
        );

  static const String name = 'CoupleInfoSection';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CoupleDashboardGuestList]
class CoupleDashboardGuestList extends _i36.PageRouteInfo<void> {
  const CoupleDashboardGuestList({List<_i36.PageRouteInfo>? children})
      : super(
          CoupleDashboardGuestList.name,
          initialChildren: children,
        );

  static const String name = 'CoupleDashboardGuestList';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i14.GuestListView]
class GuestListView extends _i36.PageRouteInfo<void> {
  const GuestListView({List<_i36.PageRouteInfo>? children})
      : super(
          GuestListView.name,
          initialChildren: children,
        );

  static const String name = 'GuestListView';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i15.DressingScreen]
class DressingRoute extends _i36.PageRouteInfo<void> {
  const DressingRoute({List<_i36.PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i16.FavListingPage]
class FavListingPage extends _i36.PageRouteInfo<FavListingPageArgs> {
  FavListingPage({
    required bool isAppBar,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          FavListingPage.name,
          args: FavListingPageArgs(
            isAppBar: isAppBar,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FavListingPage';

  static const _i36.PageInfo<FavListingPageArgs> page =
      _i36.PageInfo<FavListingPageArgs>(name);
}

class FavListingPageArgs {
  const FavListingPageArgs({
    required this.isAppBar,
    this.key,
  });

  final bool isAppBar;

  final _i37.Key? key;

  @override
  String toString() {
    return 'FavListingPageArgs{isAppBar: $isAppBar, key: $key}';
  }
}

/// generated route for
/// [_i17.HomePage]
class HomePage extends _i36.PageRouteInfo<void> {
  const HomePage({List<_i36.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ChangePasswordPage]
class ChangePasswordPage extends _i36.PageRouteInfo<void> {
  const ChangePasswordPage({List<_i36.PageRouteInfo>? children})
      : super(
          ChangePasswordPage.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i19.Login]
class Login extends _i36.PageRouteInfo<LoginArgs> {
  Login({
    required bool onHome,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(
            onHome: onHome,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i36.PageInfo<LoginArgs> page = _i36.PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({
    required this.onHome,
    this.key,
  });

  final bool onHome;

  final _i37.Key? key;

  @override
  String toString() {
    return 'LoginArgs{onHome: $onHome, key: $key}';
  }
}

/// generated route for
/// [_i20.Register]
class Register extends _i36.PageRouteInfo<void> {
  const Register({List<_i36.PageRouteInfo>? children})
      : super(
          Register.name,
          initialChildren: children,
        );

  static const String name = 'Register';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i21.LoginOld]
class LoginOld extends _i36.PageRouteInfo<void> {
  const LoginOld({List<_i36.PageRouteInfo>? children})
      : super(
          LoginOld.name,
          initialChildren: children,
        );

  static const String name = 'LoginOld';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i22.MessagesPage]
class MessagesPage extends _i36.PageRouteInfo<MessagesPageArgs> {
  MessagesPage({
    required String userId,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          MessagesPage.name,
          args: MessagesPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesPage';

  static const _i36.PageInfo<MessagesPageArgs> page =
      _i36.PageInfo<MessagesPageArgs>(name);
}

class MessagesPageArgs {
  const MessagesPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i37.Key? key;

  @override
  String toString() {
    return 'MessagesPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i23.MyListingPage]
class MyListingPage extends _i36.PageRouteInfo<void> {
  const MyListingPage({List<_i36.PageRouteInfo>? children})
      : super(
          MyListingPage.name,
          initialChildren: children,
        );

  static const String name = 'MyListingPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i24.EditProfilePage]
class EditProfilePage extends _i36.PageRouteInfo<void> {
  const EditProfilePage({List<_i36.PageRouteInfo>? children})
      : super(
          EditProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'EditProfilePage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i25.MyProfilePage]
class MyProfilePage extends _i36.PageRouteInfo<void> {
  const MyProfilePage({List<_i36.PageRouteInfo>? children})
      : super(
          MyProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'MyProfilePage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ProfilePage]
class ProfilePage extends _i36.PageRouteInfo<void> {
  const ProfilePage({List<_i36.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i27.ReviewsPage]
class ReviewsPage extends _i36.PageRouteInfo<ReviewsPageArgs> {
  ReviewsPage({
    required String userId,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          ReviewsPage.name,
          args: ReviewsPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewsPage';

  static const _i36.PageInfo<ReviewsPageArgs> page =
      _i36.PageInfo<ReviewsPageArgs>(name);
}

class ReviewsPageArgs {
  const ReviewsPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i37.Key? key;

  @override
  String toString() {
    return 'ReviewsPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i28.UserDashboardPage]
class UserDashboardPage extends _i36.PageRouteInfo<UserDashboardPageArgs> {
  UserDashboardPage({
    required String userId,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          UserDashboardPage.name,
          args: UserDashboardPageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDashboardPage';

  static const _i36.PageInfo<UserDashboardPageArgs> page =
      _i36.PageInfo<UserDashboardPageArgs>(name);
}

class UserDashboardPageArgs {
  const UserDashboardPageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i37.Key? key;

  @override
  String toString() {
    return 'UserDashboardPageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i29.VendorProfilePage]
class VendorProfilePage extends _i36.PageRouteInfo<VendorProfilePageArgs> {
  VendorProfilePage({
    required String userId,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          VendorProfilePage.name,
          args: VendorProfilePageArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VendorProfilePage';

  static const _i36.PageInfo<VendorProfilePageArgs> page =
      _i36.PageInfo<VendorProfilePageArgs>(name);
}

class VendorProfilePageArgs {
  const VendorProfilePageArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i37.Key? key;

  @override
  String toString() {
    return 'VendorProfilePageArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i30.SearchingPage]
class SearchingPage extends _i36.PageRouteInfo<void> {
  const SearchingPage({List<_i36.PageRouteInfo>? children})
      : super(
          SearchingPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i31.SearchingResultsPage]
class SearchingResultsPage extends _i36.PageRouteInfo<void> {
  const SearchingResultsPage({List<_i36.PageRouteInfo>? children})
      : super(
          SearchingResultsPage.name,
          initialChildren: children,
        );

  static const String name = 'SearchingResultsPage';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i32.SearchSingleView]
class SearchSingleView extends _i36.PageRouteInfo<SearchSingleViewArgs> {
  SearchSingleView({
    required _i38.SearchResultItem? item,
    required String? type,
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
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

  static const _i36.PageInfo<SearchSingleViewArgs> page =
      _i36.PageInfo<SearchSingleViewArgs>(name);
}

class SearchSingleViewArgs {
  const SearchSingleViewArgs({
    required this.item,
    required this.type,
    this.key,
  });

  final _i38.SearchResultItem? item;

  final String? type;

  final _i37.Key? key;

  @override
  String toString() {
    return 'SearchSingleViewArgs{item: $item, type: $type, key: $key}';
  }
}

/// generated route for
/// [_i33.SingleView]
class SingleView extends _i36.PageRouteInfo<SingleViewArgs> {
  SingleView({
    required _i39.Vendor? vendor,
    required _i40.TopListing? topListing,
    _i37.Key? key,
    String? type,
    List<_i36.PageRouteInfo>? children,
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

  static const _i36.PageInfo<SingleViewArgs> page =
      _i36.PageInfo<SingleViewArgs>(name);
}

class SingleViewArgs {
  const SingleViewArgs({
    required this.vendor,
    required this.topListing,
    this.key,
    this.type,
  });

  final _i39.Vendor? vendor;

  final _i40.TopListing? topListing;

  final _i37.Key? key;

  final String? type;

  @override
  String toString() {
    return 'SingleViewArgs{vendor: $vendor, topListing: $topListing, key: $key, type: $type}';
  }
}

/// generated route for
/// [_i34.SplashScreen]
class SplashRoute extends _i36.PageRouteInfo<void> {
  const SplashRoute({List<_i36.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}

/// generated route for
/// [_i35.VenuesScreen]
class VenuesRoute extends _i36.PageRouteInfo<void> {
  const VenuesRoute({List<_i36.PageRouteInfo>? children})
      : super(
          VenuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenuesRoute';

  static const _i36.PageInfo<void> page = _i36.PageInfo<void>(name);
}
