import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_exceptions.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/features/login/login_state_provider.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/screens/login/login.dart';
import 'package:viwaha_lk/services/auth_service.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService(ref.read(dioClientProvider));
});

final userProvider = StateProvider<UserModel>((ref) => const UserModel());
final isloginProvider = StateProvider<bool>((ref) => false);
final isLoadingLoginProvider = StateProvider<bool>((ref) => false);
// final isLoadingLoginProvider = StateProvider<bool>((ref) {
//   return true;
// });

class LoginController {
  final Ref ref;
  final LoginService loginService;

  LoginController(this.ref, this.loginService);

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
      ref.read(loginViewStateProvider.notifier).state = const AsyncValue.data(
          "Invalid credentials or Unable to login for some other reason. Please try again...");
      ref.read(loginViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      rethrow;
    }
  }

  Future<UserModel> userRegister(userDetails) async {
    try {
      final res = await loginService.requestUserApiRequest(userDetails);

      if (res['responseCode'] == "1") {
        ref.read(usernameProvider.notifier).state = userDetails['email'];
        ref.read(passwordProvider.notifier).state = userDetails['password'];
        ref.refresh(loginProvider);
      } else {}

      // ignore: use_build_context_synchronously
      final user = UserModel.fromJson(res);
      return user;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<UserModel> fetchGoogleUser(
      {required String? displayName,
      required String? email,
      required String? photoUrl}) async {
    try {
      final res = await loginService.fetchLoginGoogleApiRequest(
          displayName: displayName, email: email, photoUrl: photoUrl);

      // ignore: use_build_context_synchronously
      final user = UserModel.fromJson(res);

      return user;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<UserModel> fetchAppleUser({
    required String? displayName,
    required String? email,
  }) async {
    try {
      final res = await loginService.fetchLoginAppleApiRequest(
        displayName: displayName,
        email: email,
      );

      final user = UserModel.fromJson(res);

      return user;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}
