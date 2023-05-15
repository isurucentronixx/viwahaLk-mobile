import 'package:viwaha_lk/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});
