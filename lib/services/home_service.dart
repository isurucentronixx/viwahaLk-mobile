import 'dart:math';

import 'package:dio/dio.dart';
import 'package:viwaha_lk/core/network/constant/endpoints.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeService {
  final DioClient _dioClient;

  HomeService(this._dioClient);

  Future fetchVendorListApiRequest() async {
    try {
      // final res =
      //     await http.get(Uri.parse(Endpoints.baseUrl + Endpoints.getVendorListUrl));
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getVendorListUrl);
      // log(response.data);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchTopWeddingListApiRequest() async {
    try {
      final res =
          await _dioClient.get(Endpoints.baseUrl + Endpoints.getTopListUrl);

      print(res);
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
}
