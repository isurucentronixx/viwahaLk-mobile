import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_state_provider.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/services/home_service.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref.read(dioClientProvider));
});

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController(ref.read(homeServiceProvider));
});

final vendorsProvider =
    StateNotifierProvider<VendorNotifier, List<Vendor>>((ref) {
  return VendorNotifier(ref: ref);
});

final topListingProvider =
    StateNotifierProvider<TopListingNotifier, List<TopListing>>((ref) {
  return TopListingNotifier(ref: ref);
});

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, List<Categories>>((ref) {
  return CategoriesNotifier(ref: ref);
});

final locationsProvider =
    StateNotifierProvider<LocationsNotifier, List<Location>>((ref) {
  return LocationsNotifier(ref: ref);
});

final searchResultProvider =
    StateNotifierProvider<SearchResultNotifier, List<SearchResultItem>>((ref) {
  return SearchResultNotifier(
    ref: ref,
  );
});

final allListingProvider =
    StateNotifierProvider<AllListingProviderNotifier, List<SearchResultItem>>(
        (ref) {
  return AllListingProviderNotifier(ref: ref);
});

final favListingProvider =
    StateNotifierProvider<FavListingProviderNotifier, List<SearchResultItem>>(
        (ref) {
  return FavListingProviderNotifier(ref: ref);
});

final categoryListingProvider =
    StateNotifierProvider<CategoryListingProviderNotifier, List<SearchResultItem>>(
        (ref) {
  return CategoryListingProviderNotifier(ref: ref);
});
 