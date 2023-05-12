import 'package:auto_route/auto_route.dart';
import 'package:viwaha_lk/screens/home_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}

class MaterialAutoRouter {
  const MaterialAutoRouter(
      {required String replaceInRouteName, required List<AutoRoute> routes});
}
