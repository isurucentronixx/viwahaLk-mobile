import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/login/login_state_provider.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/screens/login/login.dart';
import 'package:viwaha_lk/services/auth_service.dart';

final loginServiceProvider = Provider<LoginService>((ref) {
  return LoginService(ref.read(dioClientProvider));
});

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController(ref, ref.read(loginServiceProvider));
});

final loginProvider = StateNotifierProvider<LoginNotifier, UserModel>((ref) {
  return LoginNotifier(
    // username: ref.read(usernameProvider),
    // password: ref.read(passwordProvider),
    username: "lakmalajantha@gmail.com",
    password: "123456789Vi",
    ref: ref,
  );
});
