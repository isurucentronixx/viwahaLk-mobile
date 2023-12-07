// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class LoginOld extends StatefulWidget {
  const LoginOld({Key? key}) : super(key: key);

  @override
  _LoginOldState createState() => _LoginOldState();
}

class _LoginOldState extends State<LoginOld> {
  bool _isLoggedIn = false;
  Map<String, dynamic> _userObj = {};

  Future<void> authenticateWithViwaha(String facebookAccessToken) async {
    final url =
        Uri.parse('https://viwahaapp.nikhilaholdings.lk/login/facebook');
    final response = await http.post(
      url,
      body: {'access_token': facebookAccessToken},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final name = data['name'];
      final email = data['email'];
      final profilePicture = data['picture']['data']['url'];

      setState(() {
        _isLoggedIn = true;
        _userObj = {
          'name': name,
          'email': email,
          'picture': {
            'data': {'url': profilePicture}
          },
        };
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
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
            const FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: ElevatedButton.icon(
                onPressed: () {},
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
    );
  }
}
