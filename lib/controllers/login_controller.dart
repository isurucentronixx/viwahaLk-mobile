import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_exceptions.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/services/auth_service.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService(ref.read(dioClientProvider));
});

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController(ref.read(loginServiceProvider));
});


final userProvider = StateProvider<UserModel>((ref) => UserModel());
final isloginProvider = StateProvider<bool>((ref) => false);
final isLoadingLoginProvider = StateProvider<bool>((ref) {
  return true;
});

class LoginController {
  final LoginService loginService;

  LoginController(this.loginService);

  Future<UserModel> fetchUser(
      {required String username, required String password}) async {

    try {
      final res = await loginService.fetchLoginApiRequest(
          username: username, password: password);
    
      // ignore: use_build_context_synchronously
      final user = UserModel.fromJson(res);
      return user;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
