import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/constant/endpoints.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'dart:async';

class HomeService {
  final DioClient _dioClient;

  HomeService(this._dioClient);

  Future fetchVendorListApiRequest(userId) async {
    try {
      final res = await _dioClient.get(
          Endpoints.baseUrl + Endpoints.getVendorListUrl + userId.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchTopWeddingListApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get(Endpoints.baseUrl + Endpoints.getTopListUrl + userId);

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchSliderImagesRequest() async {
    try {
      final res = await _dioClient
          .get(Endpoints.baseUrl + Endpoints.getMainSliderImages);

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchCategoryListApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getCategoryUrl);

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchLocationListApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getLocationUrl);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchSearchResultListApiRequest(
      String location, String category, String keyword, String userId) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl + Endpoints.getAllListing + userId}&location=$location&category=$category&keyword=$keyword');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAllListingApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get(Endpoints.baseUrl + Endpoints.getAllListing + userId);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchFavListingApiRequest({required Ref ref}) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl}${Endpoints.getFavListing}' +
              ref.watch(userProvider).user!.id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchMyListingApiRequest({required Ref ref}) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl}${Endpoints.getMyListing}${ref.watch(userProvider).user!.id}');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchCategoryListingApiRequest(String userId, String category) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl + Endpoints.getAllListing + userId}/location=&category=$category&keyword=');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchUserDashboardCountsApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getDashboardCounts}$userId');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchUserMessagesApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getUserMessages}$userId');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchUserNotificationsApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getUserNotification}$userId');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchUserReviewsApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getUserReviews}$userId');

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchVendorApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getVendor}$userId');

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchVendorListingsApiRequest(String userId) async {
    try {
      final res = await _dioClient
          .get('${Endpoints.baseUrl + Endpoints.getVendorListings}$userId');

      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
