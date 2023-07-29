import 'package:viwaha_lk/core/network/constant/endpoints.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'dart:async';

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
}
