import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

class LoginNotifier extends StateNotifier<UserModel> {
  final Ref ref;
  String username;
  String password;

  LoginNotifier(
      {required this.ref, required this.username, required this.password})
      : super(const UserModel()) {
    fetchUser(ref: ref, password: password, username: username);
  }

  Future fetchUser(
      {required Ref ref,
      required String username,
      required String password}) async {
    final appRouter = ref.watch(appRouterProvider);

    await ref
        .read(loginControllerProvider)
        .fetchUser(username: username, password: password)
        .then((value) {
      // Setting current `state` to the fetched list of products.
      state = value;

      // Setting isLoading to `false`.
      ref.read(isLoadingLoginProvider.notifier).state = false;
      if (int.parse(state.responseCode.toString()) == 1) {
        ref.read(userProvider.notifier).state = value;
        ref.read(isloginProvider.notifier).state = true;
        appRouter.push(const HomePage());
      } else {
        print("Invalid credintials");
      }
    });
  }
}
