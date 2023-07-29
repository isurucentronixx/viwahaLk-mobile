// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");

@RoutePage()
class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();

  // bool _isLoggedIn = false;
  // Map<String, dynamic> _userObj = {};

  // Future<void> loginWithFacebook(BuildContext context) async {
  //   final LoginResult result = await FacebookAuth.instance.login(
  //     permissions: ["public_profile", "email"],
  //   );

  //   switch (result.status) {
  //     case LoginStatus.success:
  //       final AccessToken accessToken = result.accessToken!;
  //       await authenticateWithViwaha(accessToken.token);
  //       break;
  //     case LoginStatus.cancelled:
  //       print('Facebook login cancelled.');
  //       break;
  //     case LoginStatus.failed:
  //       print('Facebook login failed: ${result.message}');
  //       break;
  //     default:
  //       break;
  //   }
  // }

  // Future<void> authenticateWithViwaha(String facebookAccessToken) async {
  //   final url =
  //       Uri.parse('https://viwahaapp.nikhilaholdings.lk/login/facebook');
  //   final response = await http.post(
  //     url,
  //     body: {'access_token': facebookAccessToken},
  //   );

  //   print({facebookAccessToken, " Thushn"});

  //   if (response.statusCode == 200) {
  //     // Successfully authenticated with the Viwaha App API
  //     print('Viwaha App login successful: ${response.body}');
  //     // Extract the necessary data from the API response and update the UI accordingly
  //     final data = jsonDecode(response.body);
  //     final name = data['name'];
  //     final email = data['email'];
  //     final profilePicture = data['picture']['data']['url'];

  //     setState(() {
  //       _isLoggedIn = true;
  //       _userObj = {
  //         'name': name,
  //         'email': email,
  //         'picture': {
  //           'data': {'url': profilePicture}
  //         },
  //       };
  //     });
  //   } else {
  //     // Failed to authenticate with the Viwaha App API
  //     print('Viwaha App login failed: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final loginNotifier = ref.watch(loginProvider.notifier);
    // final login = ref.read(loginProvider);

    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
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
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  // onChanged: (value) {
                  //   usernameController.text = value;
                  // },
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  // onChanged: (value) {
                  //   passwordController.text = value;
                  // },
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.watch(isLoadingLoginProvider)
                          ? showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Container(
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: ViwahaColor.primary,
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container();
                      ref.read(usernameProvider.notifier).state =
                          usernameController.text;
                      ref.read(passwordProvider.notifier).state =
                          passwordController.text;
                      print(ref.read(usernameProvider));

                      ref.refresh(loginProvider);
                    }
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In'),
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
                  },
                  icon: const Icon(Icons.create),
                  label: const Text('Create an account'),
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
              const Text('or'),
              const SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Perform Google sign-in logic here
                      },
                      icon: SizedBox(
                          width: 20,
                          child: Assets.lib.assets.images.googleLogo.image()),
                      label: const Text('Sign in with Google'),
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
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // AutoRouter.of(context).push(FacebookLogin());
                        // loginWithFacebook(context);
                      },
                      icon: SizedBox(
                          width: 20,
                          child: Assets.lib.assets.images.facebook.image()),
                      label: const Text('Sign in with Facebook'),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
