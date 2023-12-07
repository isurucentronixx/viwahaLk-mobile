// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/features/login/login_state_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/auth/user.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");

@RoutePage()
class Login extends ConsumerStatefulWidget {
  final bool onHome;
  const Login(this.onHome, {super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    final controller = ref.read(loginControllerProvider);
    final state = ref.watch(loginViewStateProvider);

    ref.listen<AsyncValue>(loginViewStateProvider, (_, state) {
      state.whenData((items) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: ref.read(isloginProvider)
                ? 'Login Successful'
                : 'Failed please try again!',
            message: items,
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: ref.read(isloginProvider)
                ? const Color(0xff21B6A8)
                : Colors.redAccent,
          ),
        );
        (items == null ? null : ScaffoldMessenger.of(context))!
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      });
    });

    return LoadingOverlay(
      isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: !widget.onHome
            ? AppBar(
                title: const Text('Login'),
              )
            : null,
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Assets.lib.assets.images.colorLogo.image(),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                const SizedBox(
                  child: Center(),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    focusNode: FocusNode(canRequestFocus: false),
                    // controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      // usernameController.text = value;
                      ref.read(usernameProvider.notifier).state = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Username';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    focusNode: FocusNode(canRequestFocus: false),
                    // controller: passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      // passwordController.text = value;

                      ref.read(passwordProvider.notifier).state = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Password';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ref.read(loginViewStateProvider.notifier).state =
                            const AsyncValue.loading();
                        // ref.read(usernameProvider.notifier).state =
                        //     usernameController.text;
                        // ref.read(passwordProvider.notifier).state =
                        //     passwordController.text;

                        ref.refresh(loginProvider);
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: Text(LocaleKeys.sign_in.tr()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Perform login logic here
                      AutoRouter.of(context).push(const Register());
                    },
                    icon: const Icon(Icons.app_registration),
                    label: Text(LocaleKeys.create_account.tr()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "OR",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
                ),
                const SizedBox(height: 20.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Perform Google sign-in logic here
                          googleSignIn(context, ref);
                        },
                        icon: SizedBox(
                            width: 20,
                            child: Assets.lib.assets.images.googleLogo.image()),
                        label: Text(LocaleKeys.sign_with_google.tr()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    // FractionallySizedBox(
                    //   widthFactor: 0.8,
                    //   child: ElevatedButton.icon(
                    //     onPressed: () {
                    //       // AutoRouter.of(context).push(FacebookLogin());
                    //       // loginWithFacebook(context);
                    //     },
                    //     icon: SizedBox(
                    //         width: 20,
                    //         child: Assets.lib.assets.images.facebook.image()),
                    //     label: const Text('Sign in with Facebook'),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: Colors.white,
                    //       foregroundColor: Colors.black,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8.0),
                    //       ),
                    //       side: const BorderSide(
                    //         color: Colors.blue,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future googleSignIn(BuildContext context, WidgetRef ref) async {
  final controller = ref.read(loginControllerProvider);
  final appRouter = ref.watch(appRouterProvider);
  final user = await GoogleSignInApi.login();
  if (user != null) {
    final res = await controller.fetchGoogleUser(
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoUrl);

    ref.read(userProvider.notifier).state = res;
    ref.read(isloginProvider.notifier).state = true;

    // ignore: use_build_context_synchronously
    AutoRouter.of(context).push(const HomePage());
  } else {}
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
