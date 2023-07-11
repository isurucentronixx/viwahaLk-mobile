// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;
  Map<String, dynamic> _userObj = {};

  Future<void> loginWithFacebook(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ["public_profile", "email"],
    );

    switch (result.status) {
      case LoginStatus.success:
        final AccessToken accessToken = result.accessToken!;
        await authenticateWithViwaha(accessToken.token);
        break;
      case LoginStatus.cancelled:
        print('Facebook login cancelled.');
        break;
      case LoginStatus.failed:
        print('Facebook login failed: ${result.message}');
        break;
      default:
        break;
    }
  }

  Future<void> authenticateWithViwaha(String facebookAccessToken) async {
    final url =
        Uri.parse('https://viwahaapp.nikhilaholdings.lk/login/facebook');
    final response = await http.post(
      url,
      body: {'access_token': facebookAccessToken},
    );

    print({facebookAccessToken, " Thushn"});

    if (response.statusCode == 200) {
      // Successfully authenticated with the Viwaha App API
      print('Viwaha App login successful: ${response.body}');
      // Extract the necessary data from the API response and update the UI accordingly
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
    } else {
      // Failed to authenticate with the Viwaha App API
      print('Viwaha App login failed: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
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
                onPressed: () {
                  // Perform login logic here
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
                      loginWithFacebook(context);
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
    );
  }
}
