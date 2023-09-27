import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/main_slider/main_slider_model.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

class VendorNotifier extends StateNotifier<List<Vendor>> {
  final Ref ref;

  VendorNotifier({required this.ref}) : super([]) {
    fetchVendors(ref: ref);
  }

  Future fetchVendors({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchVendorList(ref.read(isloginProvider)
            ? ref.read(userProvider).user!.id
            : '')
        .then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;
      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class TopListingNotifier extends StateNotifier<List<TopListing>> {
  final Ref ref;

  TopListingNotifier({required this.ref}) : super([]) {
    fetchTopListing(ref: ref);
  }

  Future fetchTopListing({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchTopWeddingList(ref.read(isloginProvider)
            ? ref.read(userProvider).user!.id.toString()
            : '')
        .then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;
      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class MainSliderImageNotifier extends StateNotifier<List<MainSlider>> {
  final Ref ref;

  MainSliderImageNotifier({required this.ref}) : super([]) {
    fetchSliderImage(ref: ref);
  }

  Future fetchSliderImage({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchSliderImagesList()
        .then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;
    });
  }
}

class CategoriesNotifier extends StateNotifier<List<Categories>> {
  final Ref ref;

  CategoriesNotifier({required this.ref}) : super([]) {
    fetchCategories(ref: ref);
  }

  Future fetchCategories({required Ref ref}) async {
    await ref.read(homeControllerProvider).fetchCategoryList().then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;
      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class LocationsNotifier extends StateNotifier<List<Location>> {
  final Ref ref;

  LocationsNotifier({required this.ref}) : super([]) {
    fetchLocations(ref: ref);
  }

  Future fetchLocations({required Ref ref}) async {
    await ref.read(homeControllerProvider).fetchLocationList().then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;
      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class SearchResultNotifier extends StateNotifier<List<SearchResultItem>> {
  final Ref ref;

  SearchResultNotifier({
    required this.ref,
  }) : super([]) {
    fetchSearchResult(ref: ref);
  }

  Future fetchSearchResult({required Ref ref}) async {
    String location = ref.watch(selectedSubLocationProvider).sub_location_en ??
        ref.watch(selectedMainLocationProvider);
    String category = ref.watch(selectedSubCategoryProvider).sub_category ??
        ref.watch(selectedMainCategoryProvider);
    String keyword = "";

    await ref
        .read(homeControllerProvider)
        .fetchSearchResultList(
            location,
            category,
            keyword,
            ref.read(isloginProvider)
                ? '${ref.read(userProvider).user!.id.toString()}'
                : '')
        .then((value) {
      // Setting current `state` to the fetched list of products.
      if (mounted) {
        state = value;
      }

      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class AllListingProviderNotifier extends StateNotifier<List<SearchResultItem>> {
  final Ref ref;

  AllListingProviderNotifier({required this.ref}) : super([]) {
    fetchAllListing(ref: ref);
  }

  Future fetchAllListing({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchAllListing(ref.read(isloginProvider)
            ? ref.read(userProvider).user!.id.toString()
            : '')
        .then((value) {
      // Setting current `state` to the fetched list of products.
      if (mounted) {
        state = value;
      }

      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class FavListingProviderNotifier extends StateNotifier<List<SearchResultItem>> {
  final Ref ref;

  FavListingProviderNotifier({required this.ref}) : super([]) {
    fetchFavListing(ref: ref);
  }

  Future fetchFavListing({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchFavListing(ref: ref)
        .then((value) {
      // Setting current `state` to the fetched list of products.
      if (mounted) {
        state = value;
      }

      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class MyListingProviderNotifier extends StateNotifier<List<SearchResultItem>> {
  final Ref ref;

  MyListingProviderNotifier({required this.ref}) : super([]) {
    fetchMyListing(ref: ref);
  }

  Future fetchMyListing({required Ref ref}) async {
    await ref
        .read(homeControllerProvider)
        .fetchMyListing(ref: ref)
        .then((value) {
      // Setting current `state` to the fetched list of products.
      if (mounted) {
        state = value;
      }

      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}

class CategoryListingProviderNotifier
    extends StateNotifier<List<SearchResultItem>> {
  final Ref ref;

  CategoryListingProviderNotifier({required this.ref}) : super([]) {
    fetchCategoryListing(ref: ref);
  }

  Future fetchCategoryListing({required Ref ref}) async {
    String category = ref.watch(selectedMainCategoryProvider);
    await ref
        .read(homeControllerProvider)
        .fetchCategoryListing(
            ref.read(isloginProvider)
                ? ref.read(userProvider).user!.id.toString()
                : '',
            category)
        .then((value) {
      // Setting current `state` to the fetched list of products.
      if (mounted) {
        state = value;
      }

      // Setting isLoading to `false`.
      ref.read(isLoadingHomeProvider.notifier).state = false;
    });
  }
}
