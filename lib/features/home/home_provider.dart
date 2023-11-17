import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_state_provider.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/main_slider/main_slider_model.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/services/home_service.dart';

final isSearchingProvider = StateProvider<bool>((ref) => false);
final selectedSubCategoryProvider =
    StateProvider<SubCategories>((ref) => const SubCategories());
final selectedSubLocationProvider =
    StateProvider<SubLocation>((ref) => const SubLocation());
final selectedMainCategoryProvider = StateProvider<String>((ref) => "");
final selectedMainLocationProvider = StateProvider<String>((ref) => "");

final isActivatedProvider = StateProvider<bool>((ref) => false);
final isLocationActivatedProvider = StateProvider<bool>((ref) => false);
final subCategoriesProvider = StateProvider<List<SubCategories?>>((ref) => []);
final subLocationsProvider = StateProvider<List<SubLocation?>>((ref) => []);

final selectedPriceRangeProvider = StateProvider<String>((ref) => "");
final selectedAmenitiesProvider = StateProvider<List<String>>((ref) => []);
final searchingKeywords = StateProvider<String>((ref) => "");
final selectedOrderProvider = StateProvider<String>((ref) => "");
final selectedSortProvider = StateProvider<String>((ref) => "date");
final selectedRatingProvider = StateProvider<String>((ref) => "");

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

final mainSliderImageProvider =
    StateNotifierProvider<MainSliderImageNotifier, List<MainSlider>>((ref) {
  return MainSliderImageNotifier(ref: ref);
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

final myListingProvider =
    StateNotifierProvider<MyListingProviderNotifier, List<SearchResultItem>>(
        (ref) {
  return MyListingProviderNotifier(ref: ref);
});

final categoryListingProvider = StateNotifierProvider<
    CategoryListingProviderNotifier, List<SearchResultItem>>((ref) {
  return CategoryListingProviderNotifier(ref: ref);
});

final localizationServiceProvider = Provider<LocalizationService>((ref) {
  return LocalizationService();
});

class LocalizationService {
  final EasyLocalization easyLocalization;

  LocalizationService()
      : easyLocalization = EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('si'), Locale('ta')],
          path:
              'assets/translations', // Change this to your translations folder
          fallbackLocale: const Locale('en'), child: Container(),
        );

  void changeLocale(Locale locale, BuildContext context) {
    context.setLocale(locale);
  }
}
