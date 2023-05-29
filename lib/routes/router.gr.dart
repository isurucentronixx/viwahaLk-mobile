// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:viwaha_lk/models/venues/single_venues.dart' as _i1;
import 'package:viwaha_lk/screens/about_us_view.dart' as _i6;
import 'package:viwaha_lk/screens/dressing_view.dart' as _i3;
import 'package:viwaha_lk/screens/home_view.dart' as _i2;
import 'package:viwaha_lk/screens/login.dart' as _i5;
import 'package:viwaha_lk/screens/venues_screen.dart' as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    VenusesSingleView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.VenusesSingleView(),
      );
    },
    HomePage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    DressingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DressingScreen(),
      );
    },
    VenuesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.VenuesScreen(),
      );
    },
    Login.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Login(),
      );
    },
    AboutUsPage.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AboutUsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.VenusesSingleView]
class VenusesSingleView extends _i7.PageRouteInfo<void> {
  const VenusesSingleView({List<_i7.PageRouteInfo>? children})
      : super(
          VenusesSingleView.name,
          initialChildren: children,
        );

  static const String name = 'VenusesSingleView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage({List<_i7.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DressingScreen]
class DressingRoute extends _i7.PageRouteInfo<void> {
  const DressingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DressingRoute.name,
          initialChildren: children,
        );

  static const String name = 'DressingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.VenuesScreen]
class VenuesRoute extends _i7.PageRouteInfo<void> {
  const VenuesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          VenuesRoute.name,
          initialChildren: children,
        );

  static const String name = 'VenuesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Login]
class Login extends _i7.PageRouteInfo<void> {
  const Login({List<_i7.PageRouteInfo>? children})
      : super(
          Login.name,
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AboutUsPage]
class AboutUsPage extends _i7.PageRouteInfo<void> {
  const AboutUsPage({List<_i7.PageRouteInfo>? children})
      : super(
          AboutUsPage.name,
          initialChildren: children,
        );

  static const String name = 'AboutUsPage';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
