import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_exceptions.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/user_dashboard/user_dashboard.dart';
import 'package:viwaha_lk/models/user_dashboard/user_messages.dart';
import 'package:viwaha_lk/models/user_dashboard/user_notifications.dart';
import 'package:viwaha_lk/models/user_dashboard/user_reviews.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/services/home_service.dart';
import 'package:viwaha_lk/models/locations/location.dart';

final addListingViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

final profileViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));



final changePasswordViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref.read(dioClientProvider));
});



final isLoadingHomeProvider = StateProvider<bool>((ref) {
  return true;
});

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

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

  Future<List<SearchResultItem>> fetchFavListing({required Ref ref}) async {
    try {
      final res = await homeService.fetchFavListingApiRequest(ref: ref);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchMyListing({required Ref ref}) async {
    try {
      final res = await homeService.fetchMyListingApiRequest(ref: ref);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchCategoryListing(String category) async {
    try {
      final res = await homeService.fetchCategoryListingApiRequest(category);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<UserDashboard> fetchUserDashboardCounts(String userId) async {
    try {
      final res = await homeService.fetchUserDashboardCountsApiRequest(userId);
      final result = UserDashboard.fromJson(res);
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Message>> fetchUserMessages(String userId) async {
    try {
      final res = await homeService.fetchUserMessagesApiRequest(userId);
       final searchResult =
          (res as List).map((e) => Message.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<UserNotification>> fetchUserNotifications(String userId) async {
    try {
      final res = await homeService.fetchUserNotificationsApiRequest(userId);
       final searchResult =
          (res as List).map((e) => UserNotification.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
   Future<List<UserReviews>> fetchUserReviews(String userId) async {
    try {
      final res = await homeService.fetchUserReviewsApiRequest(userId);
       final searchResult =
          (res as List).map((e) => UserReviews.fromJson(e)).toList();
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
    if (filteredTextList.isEmpty) {
      filteredTextList = ["https://viwaha.lk/assets/img/logo/no_image.jpg"];
    }

    return filteredTextList;
  }
}
