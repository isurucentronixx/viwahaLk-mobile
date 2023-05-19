import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';

@RoutePage()
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                      // Perform Facebook sign-in logic here
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
