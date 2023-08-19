import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/constant/endpoints.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'dart:async';

class HomeService {
  final DioClient _dioClient;

  HomeService(this._dioClient);

  Future fetchVendorListApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getVendorListUrl);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchTopWeddingListApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getTopListUrl);

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
      String location, String category, String keyword) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl + Endpoints.getAllListing}?location=$location&category=$category&keyword=$keyword');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchAllListingApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getAllListing);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchFavListingApiRequest({required Ref ref}) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl}${Endpoints.getFavListing}${ref.watch(userProvider).user!.id}');
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

  Future fetchCategoryListingApiRequest(String category) async {
    try {
      final res = await _dioClient.get(
          '${Endpoints.baseUrl + Endpoints.getAllListing}?location=&category=$category&keyword=');
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
