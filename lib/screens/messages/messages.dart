// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:viwaha_lk/screens/cards/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/profile/profile_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

@RoutePage()
class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({super.key});
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).user;
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
        title: const Text("Messages"),
      ),
      body: ref.watch(isloginProvider)
          ? SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        TextField(
                          maxLines: 10,
                          decoration: const InputDecoration(
                            labelText: 'Message',
                            hintText: 'Enter a small message here',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            // Handle changes in the entered text
                            // You can update the state or perform other actions here
                          },
                        ),
                      ],
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ViwahaColor.primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () async {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 8),
                            Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
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
