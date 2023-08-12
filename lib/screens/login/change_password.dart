// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/auth/user_model.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/card/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/services/functions.dart';

final currentPasswordProvider = StateProvider<String>((ref) => '');
final newPasswordProvider = StateProvider<String>((ref) => '');
final retypeNewpasswordProvider = StateProvider<String>((ref) => '');

@RoutePage()
class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _changePasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).user;
    final controller = ref.watch(postControllerProvider);
    final router = AppRouter();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  child: Assets.lib.assets.images.logo.image(),
                ),
              ),
            ],
          ),
        ],
        title: const Text("Change Password"),
      ),
      body: ref.watch(isloginProvider)
          ? ref.watch(isLoadingChangePasswordProvider)
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Form(
                    key: _changePasswordFormKey,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.20),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ref
                                      .read(currentPasswordProvider.notifier)
                                      .state = value;
                                });
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                //add prefix icon
                                prefixIcon: const Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ViwahaColor.primary, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.grey,
                                hintText:
                                    "This name will appear on your profile.",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                                labelText: 'Current Password',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your Current Password';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ref.read(newPasswordProvider.notifier).state =
                                      value;
                                });
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                //add prefix icon
                                prefixIcon: const Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ViwahaColor.primary, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.grey,
                                hintText:
                                    "This name will appear on your profile.",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                                labelText: 'New Password',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your New Password';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ref
                                      .read(retypeNewpasswordProvider.notifier)
                                      .state = value;
                                });
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                //add prefix icon
                                prefixIcon: const Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ViwahaColor.primary, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Colors.grey,
                                hintText:
                                    "This name will appear on your profile.",
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                                labelText: 'Retype New Password',
                                labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please re-enter your New Password';
                                }
                              },
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_changePasswordFormKey.currentState!
                                        .validate()) {
                                      ref
                                          .read(isLoadingChangePasswordProvider
                                              .notifier)
                                          .state = true;
                                      var passwords = {
                                        "userId": user!.id.toString(),
                                        "password":
                                            ref.read(newPasswordProvider),
                                        "currentPassword":
                                            ref.read(currentPasswordProvider),
                                      };
                                      controller.changePassword(passwords);
                                    }
                                  },
                                  icon: const Icon(Icons.save_outlined),
                                  label: const Text('Save Changes '),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                )
          : Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton.icon(
                  onPressed: () {
                    AutoRouter.of(context).push(const Login());
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
            ),
    );
  }
}
