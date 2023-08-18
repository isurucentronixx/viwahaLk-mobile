// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");

@RoutePage()
class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordReController = TextEditingController();
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    final controller = ref.read(loginControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: ref.watch(isloginProvider)
          ? AppBar(
              title: const Text('Register'),
            )
          : null,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40.0),
                    SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Assets.lib.assets.images.colorLogo.image(),
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
                const SizedBox(
                  child: Center(),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                    ),
                    onChanged: (value) {
                      firstnameController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Firstname';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                    ),
                    onChanged: (value) {
                      lastnameController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Lastname';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-Mail',
                    ),
                    onChanged: (value) {
                      emailController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your E-Mail';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    // controller: passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      passwordController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Password';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    // controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Re-Enter Password',
                    ),
                    onChanged: (value) {
                      passwordReController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter your Password';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40.0),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Perform register logic here
                      if (_formKey.currentState!.validate()) {
                        var userDetails = {
                          "firstname": firstnameController.text,
                          "lastname": lastnameController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "repeatPassword": passwordReController.text,
                        };

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

                        controller.userRegister(userDetails);
                      }
                    },
                    icon: const Icon(Icons.app_registration),
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
                    label: const Text('Sign up with Google'),
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
                const SizedBox(height: 40.0),
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
    print(user.toString());
    final res = await controller.fetchGoogleUser(
        displayName: user.displayName,
        email: user.email,
        photoUrl: user.photoUrl);

    ref.read(userProvider.notifier).state = res;
    ref.read(isloginProvider.notifier).state = true;
    AutoRouter.of(context).push(const HomePage());
    // appRouter.push(const HomePage());
  } else {}
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
