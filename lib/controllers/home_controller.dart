import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_exceptions.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/services/home_service.dart';
import 'package:viwaha_lk/models/locations/location.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref.read(dioClientProvider));
});

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController(ref.read(homeServiceProvider));
});

final isLoadingHomeProvider = StateProvider<bool>((ref) {
  return true;
});

class HomeController {
  final HomeService homeService;

  HomeController(this.homeService);

  Future<List<Vendor>> fetchVendorList() async {
    try {
      final res = await homeService.fetchVendorListApiRequest();

      final vendor = (res as List).map((e) => Vendor.fromJson(e)).toList();
      return vendor;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<TopListing>> fetchTopWeddingList() async {
    try {
      final res = await homeService.fetchTopWeddingListApiRequest();
      final topListing =
          (res as List).map((e) => TopListing.fromJson(e)).toList();
      return topListing;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Categories>> fetchCategoryList() async {
    try {
      final res = await homeService.fetchCategoryListApiRequest();
      final categories =
          (res as List).map((e) => Categories.fromJson(e)).toList();
      return categories;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Location>> fetchLocationList() async {
    try {
      final res = await homeService.fetchLocationListApiRequest();
      final locations = (res as List).map((e) => Location.fromJson(e)).toList();
      return locations;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchSearchResultList(
      String location, String category, String keyword) async {
    try {
      final res = await homeService.fetchSearchResultListApiRequest(
          location, category, keyword);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchAllListing() async {
    try {
      final res = await homeService.fetchAllListingApiRequest();
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  List<String> getTumbImage(String? serializedData) {
    // Remove the initial 'a:11:' part from the string
    String serializedString = serializedData!.substring(6);
    // Replace the semicolons, colons, and quotes to format it as a valid JSON
    RegExp regex = RegExp('"([^"]+)"');
    Iterable<Match> matches = regex.allMatches(serializedString);
    List<String> filteredTextList =
        matches.map((match) => match.group(1)!).toList();

    return filteredTextList;
  }
}