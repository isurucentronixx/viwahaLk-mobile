// ignore_for_file: library_private_types_in_public_api, unused_field, avoid_print

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

@RoutePage()
class Register extends ConsumerStatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends ConsumerState<Register> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordReController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(loginControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ViwahaColor.primary,
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      firstnameController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Firstname';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      lastnameController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Lastname';
                    } else {
                      return null;
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
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                  ),
                  onChanged: (value) {
                    setState(() {
                      emailController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your E-Mail';
                    } else {
                      return null;
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
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      passwordController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    } else {
                      return null;
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
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Re-Enter Password',
                  ),
                  onChanged: (value) {
                    setState(() {
                      passwordReController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter your Password';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 40.0),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton.icon(
                  onPressed: () async {
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
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString("loginType", "login");
                      controller.userRegister(userDetails);
                    }
                  },
                  icon: const Icon(Icons.app_registration),
                  label: Text(LocaleKeys.sign_up.tr()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
