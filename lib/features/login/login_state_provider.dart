import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/login/login.dart';

final loginViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));


class LoginNotifier extends StateNotifier<UserModel> {
  final Ref ref;
  String username;
  String password;

  LoginNotifier(
      {required this.ref, required this.username, required this.password})
      : super(const UserModel()) {
    fetchUser(ref: ref, password: password, username: username);
  }

  Future fetchUser({
    required Ref ref,
    required String username,
    required String password,
  }) async {
    final appRouter = ref.watch(appRouterProvider);
    try {
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
          ref.read(loginViewStateProvider.notifier).state = AsyncValue.data(
              "Hi ${state.user!.firstname.toString()}, Welcome to the Viwaha mobile app. let's make your celebrations great.");
          ref.read(loginViewStateProvider.notifier).state =
              const AsyncValue.data(null);
          appRouter.push(const HomePage());
        } else {
          ref.read(loginViewStateProvider.notifier).state = const AsyncValue
                  .data(
              "Invalid credentials or Unable to login for some other reason. Please try again...");
          ref.read(loginViewStateProvider.notifier).state =
              const AsyncValue.data(null);
          print("Invalid credintials");
        }
      });
    } catch (e) {}
  }
}
