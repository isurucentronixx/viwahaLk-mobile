import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/constant/endpoints.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'dart:async';

import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';

final loginServiceProvider =
    Provider((ref) => LoginService(ref.read(dioClientProvider)));

class LoginService {
  final DioClient _dioClient;

  LoginService(this._dioClient);

  Future fetchLoginApiRequest(
      {required String username, required String password}) async {
    final Uri uri = Uri.parse(Endpoints.baseUrl + Endpoints.loginUrl);
    final Map<String, dynamic> queryParameters = {
      'email': username,
      'password': password,
    };
    final String queryString = Uri(queryParameters: queryParameters).query;
    String url = "$uri?$queryString";
    try {
      final res = await _dioClient.post(url);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future requestUserApiRequest(userDetails) async {
    try {
      final res = await _dioClient
          .post(Endpoints.baseUrl + Endpoints.registerUrl, data: userDetails);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future fetchLoginGoogleApiRequest(
      {required String? displayName,
      required String? email,
      required String? photoUrl}) async {
    final Uri uri = Uri.parse("${Endpoints.baseUrl}auth/login_google");
    final Map<String, dynamic> queryParameters = {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl
    };
    final String queryString = Uri(queryParameters: queryParameters).query;
    String url = "$uri?$queryString";
    try {
      final res = await _dioClient.post(url);

      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
