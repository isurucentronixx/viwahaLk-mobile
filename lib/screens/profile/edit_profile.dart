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

final userFisrtNameProvider = StateProvider<String>((ref) => '');
final userLastNameProvider = StateProvider<String>((ref) => '');
final userCompanyProvider = StateProvider<String>((ref) => '');
final userDesignationProvider = StateProvider<String>((ref) => '');
final userBirthdayProvider = StateProvider<String>((ref) => '');
final userEmailProvider = StateProvider<String>((ref) => '');
final userTelephoneNumberProvider = StateProvider<String>((ref) => '');
final userWhatsappProvider = StateProvider<String>((ref) => '');
final userAddressProvider = StateProvider<String>((ref) => '');

final userFbLinkProvider = StateProvider<String>((ref) => '');
final userInstaLinkProvider = StateProvider<String>((ref) => '');
final userYtLinkProvider = StateProvider<String>((ref) => '');
final userTwiterLinkProvider = StateProvider<String>((ref) => '');
final userLinkedinLinkProvider = StateProvider<String>((ref) => '');
final userWebNameProvider = StateProvider<String>((ref) => '');
final userDescriptionProvider = StateProvider<String>((ref) => '');

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
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
        title: const Text("Edit My Profile"),
      ),
      body: ref.watch(isloginProvider)
          ? ref.watch(isLoadingEditProfileProvider)
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Form(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          /// -- IMAGE
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: SizedBox(
                                  child: Image.network(
                                    user!.image.toString(),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: SizedBox(
                                            width: 120,
                                            height: 120,
                                            child: child,
                                          ),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            // value: progress.cumulativeBytesLoaded /
                                            //     progress.expectedTotalBytes!.toDouble(),
                                            ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text('Failed to load image'),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          AddFieldMainWidget(
                              icon: Icons.info_outline,
                              title: "General Information",
                              description:
                                  "General information about your self",
                              inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    initialValue: user.firstname.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(
                                                userFisrtNameProvider.notifier)
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'First Name',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userLastNameProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.lastname.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Last Name',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userCompanyProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.company.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Company',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userDesignationProvider
                                                .notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.designation.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Designation',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userBirthdayProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.birthday.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Birthday',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userEmailProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.email.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Email',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userTelephoneNumberProvider
                                                .notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.phone.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Telephone Number',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userWhatsappProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.phonenumber.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Whatsapp',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userAddressProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.address.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                      labelText: 'Address',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                              ]),
                          AddFieldMainWidget(
                              icon: Icons.info_outline,
                              title: "Edit Links",
                              description: "Social information about your self",
                              inputList: [
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
                                            .read(userFbLinkProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.facebook.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Facebook',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(
                                                userInstaLinkProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.instagram.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Instagram',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userYtLinkProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.youtube.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Youtube',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(
                                                userTwiterLinkProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.twitter.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Twitter',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userLinkedinLinkProvider
                                                .notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.linkedin.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Linkedin',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
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
                                            .read(userWebNameProvider.notifier)
                                            .state = value;
                                      });
                                    },
                                    initialValue: user.website.toString(),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon
                                      prefixIcon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "This link will appear on your profile.",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Website',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    validator: null,
                                  ),
                                ),
                              ]),

                          AddFieldMainWidget(
                              icon: Icons.info_outline,
                              title: "Edit Description",
                              description: "Other information about anything",
                              inputList: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextFormField(
                                    initialValue: user.about.toString(),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        ref
                                            .read(userDescriptionProvider
                                                .notifier)
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      hintText:
                                          "Write something about your self informations",
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelText: 'Description',
                                      labelStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: "verdana_regular",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    // validator: null,
                                  ),
                                ),
                              ]),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Perform login logic here
                                    ref
                                        .read(isLoadingEditProfileProvider
                                            .notifier)
                                        .state = true;

                                    var editedDetails = {
                                      "userId": user.id,
                                      "firstname": ref
                                              .watch(userFisrtNameProvider)
                                              .isNotEmpty
                                          ? ref.watch(userFisrtNameProvider)
                                          : user.firstname,
                                      "lastname": ref
                                              .watch(userLastNameProvider)
                                              .isNotEmpty
                                          ? ref.watch(userLastNameProvider)
                                          : user.lastname,
                                      "whatsappnumber": ref
                                              .watch(userWhatsappProvider)
                                              .isNotEmpty
                                          ? ref.watch(userWhatsappProvider)
                                          : user.phonenumber,
                                      "email": ref
                                              .watch(userEmailProvider)
                                              .isNotEmpty
                                          ? ref.watch(userEmailProvider)
                                          : user.email,
                                      "image": user.image,
                                      "address": ref
                                              .watch(userAddressProvider)
                                              .isNotEmpty
                                          ? ref.watch(userAddressProvider)
                                          : user.address,
                                      "website": ref
                                              .watch(userWebNameProvider)
                                              .isNotEmpty
                                          ? ref.watch(userWebNameProvider)
                                          : user.website,
                                      "company": ref
                                              .watch(userCompanyProvider)
                                              .isNotEmpty
                                          ? ref.watch(userCompanyProvider)
                                          : user.company,
                                      "designation": ref
                                              .watch(userDesignationProvider)
                                              .isNotEmpty
                                          ? ref.watch(userDesignationProvider)
                                          : user.designation,
                                      "birthday": ref
                                              .watch(userBirthdayProvider)
                                              .isNotEmpty
                                          ? ref.watch(userBirthdayProvider)
                                          : user.birthday,
                                      "phone": ref
                                              .watch(
                                                  userTelephoneNumberProvider)
                                              .isNotEmpty
                                          ? ref.watch(
                                              userTelephoneNumberProvider)
                                          : user.phone,
                                      "facebook": ref
                                              .watch(userFbLinkProvider)
                                              .isNotEmpty
                                          ? ref.watch(userFbLinkProvider)
                                          : user.facebook,
                                      "instagram": ref
                                              .watch(userInstaLinkProvider)
                                              .isNotEmpty
                                          ? ref.watch(userInstaLinkProvider)
                                          : user.instagram,
                                      "twitter": ref
                                              .watch(userTwiterLinkProvider)
                                              .isNotEmpty
                                          ? ref.watch(userTwiterLinkProvider)
                                          : user.twitter,
                                      "linkedin": ref
                                              .watch(userLinkedinLinkProvider)
                                              .isNotEmpty
                                          ? ref.watch(userLinkedinLinkProvider)
                                          : user.linkedin,
                                      "youtube": ref
                                              .watch(userYtLinkProvider)
                                              .isNotEmpty
                                          ? ref.watch(userYtLinkProvider)
                                          : user.youtube,
                                      "about": ref
                                              .watch(userDescriptionProvider)
                                              .isNotEmpty
                                          ? ref.watch(userDescriptionProvider)
                                          : user.about
                                    };

                                    controller.editMyProfile(editedDetails);
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