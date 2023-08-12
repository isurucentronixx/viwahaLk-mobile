// ignore_for_file: unused_import, unused_field

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/services/functions.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/card/card_model.dart';
import 'package:viwaha_lk/models/card/searching_card_item.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/image/image.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/venues/venues_list.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_select/awesome_select.dart';

final mainImageProvider = StateProvider<String>((ref) => '');
final mainImageNameProvider = StateProvider<String>((ref) => '');
final imageGalleryProvider = StateProvider<List<ImageObject>>((ref) => []);
final imageNameGalleryProvider = StateProvider<List<String>>((ref) => []);

final adTitleProvider = StateProvider<String>((ref) => '');
final adAddressProvider = StateProvider<String>((ref) => '');
final adGoogleAddressProvider = StateProvider<String>((ref) => '');
final adPriceProvider = StateProvider<String>((ref) => '');
final adOwnerNameProvider = StateProvider<String>((ref) => '');
final adEmailProvider = StateProvider<String>((ref) => '');
final adPhoneProvider = StateProvider<String>((ref) => '');
final adWhatsappProvider = StateProvider<String>((ref) => '');
final adDesignationProvider = StateProvider<String>((ref) => '');
final adCompanyProvider = StateProvider<String>((ref) => '');
final adWebSiteProvider = StateProvider<String>((ref) => '');
final adFacebookProvider = StateProvider<String>((ref) => '');
final adInstagramProvider = StateProvider<String>((ref) => '');
final adYoutubeProvider = StateProvider<String>((ref) => '');
final adLinkedinProvider = StateProvider<String>((ref) => '');
final adDescProvider = StateProvider<String>((ref) => '');
final adVideoLinkProvider = StateProvider<String>((ref) => '');

final isLoadingMainImageProvider = StateProvider<bool>((ref) => false);
final isLoadingGalleryProvider = StateProvider<bool>((ref) => false);
final isLoadingAddListingProvider = StateProvider<bool>((ref) => false);
final isLoadingEditProfileProvider = StateProvider<bool>((ref) => false);
final isLoadingChangePasswordProvider = StateProvider<bool>((ref) => false);
@RoutePage()
class EditListingPage extends ConsumerStatefulWidget {
  const EditListingPage({super.key});
  @override
  _EditListingPageState createState() => _EditListingPageState();
}

class _EditListingPageState extends ConsumerState<EditListingPage> {
  final picker = ImagePicker();
  String _cat = 'Select one';
  String _subCat = 'Select one';
  String _location = 'Select one';
  String _subLocation = 'Select one';
  String _alwaysOpen = 'Select one';
  String _openInHollyday = 'Select one';
  String _mondayOpen = 'Select one';
  String _mondayClose = 'Select one';
  String _tuesdayOpen = 'Select one';
  String _tuesdayClose = 'Select one';
  String _wednesdayOpen = 'Select one';
  String _wednesdayClose = 'Select one';
  String _thursdayOpen = 'Select one';
  String _thursdayClose = 'Select one';
  String _fridayOpen = 'Select one';
  String _fridayClose = 'Select one';
  String _saturedayOpen = 'Select one';
  String _saturedayClose = 'Select one';
  String _sundayOpen = 'Select one';
  String _sundayClose = 'Select one';

  bool am1 = false;
  bool am2 = false;
  bool am3 = false;
  bool am4 = false;
  bool am5 = false;
  bool am6 = false;
  bool am7 = false;
  bool am8 = false;
  bool am9 = false;
  bool am10 = false;
  bool am11 = false;
  bool am12 = false;

  List<String> amenities = [];

  bool askPrice = false;
  bool negotiable = false;

  List<S2Choice<String>>? subCategoryData = [];
  List<S2Choice<String>>? subLocationData = [];
  List<S2Choice<String>>? timeData = [
    S2Choice<String>(title: '1:00 AM', value: '1:00 AM'),
    S2Choice<String>(title: '2:00 AM', value: '2:00 AM'),
    S2Choice<String>(title: '3:00 AM', value: '3:00 AM'),
    S2Choice<String>(title: '4:00 AM', value: '4:00 AM'),
    S2Choice<String>(title: '5:00 AM', value: '5:00 AM'),
    S2Choice<String>(title: '6:00 AM', value: '6:00 AM'),
    S2Choice<String>(title: '7:00 AM', value: '7:00 AM'),
    S2Choice<String>(title: '8:00 AM', value: '8:00 AM'),
    S2Choice<String>(title: '9:00 AM', value: '9:00 AM'),
    S2Choice<String>(title: '10:00 AM', value: '10:00 AM'),
    S2Choice<String>(title: '11:00 AM', value: '11:00 AM'),
    S2Choice<String>(title: '12:00 AM', value: '12:00 AM'),
    S2Choice<String>(title: '1:00 PM', value: '1:00 PM'),
    S2Choice<String>(title: '2:00 PM', value: '2:00 PM'),
    S2Choice<String>(title: '3:00 PM', value: '3:00 PM'),
    S2Choice<String>(title: '4:00 PM', value: '4:00 PM'),
    S2Choice<String>(title: '5:00 PM', value: '5:00 PM'),
    S2Choice<String>(title: '6:00 PM', value: '6:00 PM'),
    S2Choice<String>(title: '7:00 PM', value: '7:00 PM'),
    S2Choice<String>(title: '8:00 PM', value: '8:00 PM'),
    S2Choice<String>(title: '9:00 PM', value: '9:00 PM'),
    S2Choice<String>(title: '10:00 PM', value: '10:00 PM'),
    S2Choice<String>(title: '11:00 PM', value: '11:00 PM'),
    S2Choice<String>(title: '12:00 PM', value: '12:00 PM'),
    S2Choice<String>(title: 'Closed', value: 'Closed'),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(postControllerProvider);
    List<S2Choice<String>>? mainCategoryData = ref
        .watch(categoriesProvider)
        .map((e) => S2Choice<String>(
            value: e.category.toString(), title: e.category.toString()))
        .toList();
    List<S2Choice<String>>? mainLocationData = ref
        .watch(locationsProvider)
        .map((e) => S2Choice<String>(
            value: e.location_en.toString(), title: e.location_en.toString()))
        .toList();

    @override
    initState() {
      // at the beginning, all users are shown
      super.initState();
    }

    imageUpload(File image, String name, String type) async {
      if (type == "gallery") {
        ref.read(isLoadingGalleryProvider.notifier).state = true;
      } else {
        ref.read(isLoadingMainImageProvider.notifier).state = true;
      }

      final res = await controller.imageUpload(image, name);
      setState(() {
        if (type == "gallery") {
          ref.read(imageNameGalleryProvider).add(name);
          ref.read(isLoadingGalleryProvider.notifier).state = false;
        } else {
          ref.read(mainImageNameProvider.notifier).state = name;
          ref.read(isLoadingMainImageProvider.notifier).state = false;
        }
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ref.watch(isLoadingAddListingProvider)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AddFieldMainWidget(
                          icon: Icons.info_outline,
                          title: "General Information",
                          description: "General information about your self",
                          inputList: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'Category',
                                  selectedValue: _cat,
                                  choiceItems: mainCategoryData,
                                  onChange: (selected) {
                                    setState(() {
                                      _cat = selected.value;
                                      subCategoryData = ref
                                          .watch(categoriesProvider)
                                          .where((element) =>
                                              element.category ==
                                              selected.value)
                                          .first
                                          .sub_categories!
                                          .map((e) => S2Choice<String>(
                                              value: e!.sub_category.toString(),
                                              title: e.sub_category
                                                  .toString()
                                                  .toString()))
                                          .toList();
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_cat),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'Sub Category',
                                  selectedValue: _subCat,
                                  choiceItems: subCategoryData,
                                  onChange: (selected) {
                                    setState(() {
                                      _subCat = selected.value;
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_subCat),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
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
                                    ref.read(adTitleProvider.notifier).state =
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
                                  hintText: "This name will appear on your ad.",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'AD Title',
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
                          icon: Icons.location_searching_outlined,
                          title: "Add Location",
                          description:
                              "Address information about your listing location",
                          inputList: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'Distric',
                                  selectedValue: _location,
                                  choiceItems: mainLocationData,
                                  onChange: (selected) {
                                    setState(() {
                                      _location = selected.value;
                                      subLocationData = ref
                                          .watch(locationsProvider)
                                          .where((element) =>
                                              element.location_en ==
                                              selected.value)
                                          .first
                                          .sub_locations!
                                          .map((e) => S2Choice<String>(
                                              value:
                                                  e!.sub_location_en.toString(),
                                              title: e.sub_location_en
                                                  .toString()
                                                  .toString()))
                                          .toList();
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_location),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'City',
                                  selectedValue: _subLocation,
                                  choiceItems: subLocationData,
                                  onChange: (selected) {
                                    setState(() {
                                      _subLocation = selected.value;
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_subLocation),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
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
                                    ref.read(adAddressProvider.notifier).state =
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
                                  hintText: "Your bussiness address",
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
                                        .read(adGoogleAddressProvider.notifier)
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
                                  hintText: "Your google bussiness address",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Google Location Address',
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
                          icon: Icons.menu_book_outlined,
                          title: "Full Details",
                          description:
                              "Write full details information about listing",
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
                                    ref.read(adPriceProvider.notifier).state =
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
                                  hintText: "Price range - LKR 0.00",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Price',
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
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: askPrice,
                                  onChanged: (value) {
                                    setState(() {
                                      askPrice = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  'Ask Price ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: negotiable,
                                  onChanged: (value) {
                                    setState(() {
                                      value = value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Negotiable ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
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
                                        .read(adOwnerNameProvider.notifier)
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
                                  hintText: "Your name",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Owner Name',
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
                                    ref.read(adEmailProvider.notifier).state =
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
                                  hintText: "Email address",
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
                                    ref.read(adPhoneProvider.notifier).state =
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
                                  hintText: "Phone number",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Phone',
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
                                        .read(adWhatsappProvider.notifier)
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
                                  hintText: "Ex:0710000000",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Whatsapp (without +94)',
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
                                        .read(adDesignationProvider.notifier)
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
                                  hintText: "Your position",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Designation (optional)',
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
                                    ref.read(adCompanyProvider.notifier).state =
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
                                  hintText: "Your company Name",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Company (optional)',
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
                                    ref.read(adWebSiteProvider.notifier).state =
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
                                  hintText: "https://www.example.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Website (optional)',
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
                                        .read(adFacebookProvider.notifier)
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
                                  hintText: "https://www.facebook.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Facebook (optional)',
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
                                        .read(adInstagramProvider.notifier)
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
                                  hintText: "https://wwww.instagram.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Instagram (optional)',
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
                                    ref.read(adYoutubeProvider.notifier).state =
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
                                  hintText: "https://www.youtube.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Youtube (optional)',
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
                                        .read(adLinkedinProvider.notifier)
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
                                  hintText: "https://linkedin.com",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Linkedin (optional)',
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
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    ref.read(adDescProvider.notifier).state =
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
                                      "Write something about your Ad informations",
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
                      AddFieldMainWidget(
                          icon: Icons.card_giftcard_outlined,
                          title: "Amenities",
                          description:
                              "Check full detail information aboutfacilities",
                          inputList: [
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am1,
                                  onChanged: (value) {
                                    setState(() {
                                      am1 = value!;
                                      if (value) {
                                        amenities.add('Elevator in Building');
                                      } else {
                                        amenities
                                            .remove('Elevator in Building');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Elevator in Building ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am2,
                                  onChanged: (value) {
                                    setState(() {
                                      am2 = value!;
                                      if (value) {
                                        amenities.add('Friendly Workspace');
                                      } else {
                                        amenities.remove('Friendly Workspace');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Friendly Workspace ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am3,
                                  onChanged: (value) {
                                    setState(() {
                                      am3 = value!;
                                      if (value) {
                                        amenities.add('Instant Book');
                                      } else {
                                        amenities.remove('Instant Book');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Instant Book ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am4,
                                  onChanged: (value) {
                                    setState(() {
                                      am4 = value!;
                                      if (value) {
                                        amenities.add('Wifi');
                                      } else {
                                        amenities.remove('Wifi');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Wifi ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am5,
                                  onChanged: (value) {
                                    setState(() {
                                      am5 = value!;
                                      if (value) {
                                        amenities
                                            .add('Free Parking on Premises');
                                      } else {
                                        amenities
                                            .remove('Free Parking on Premises');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Free Parking on Premises ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am6,
                                  onChanged: (value) {
                                    setState(() {
                                      am6 = value!;
                                      if (value) {
                                        amenities.add('Free Parking on Street');
                                      } else {
                                        amenities
                                            .remove('Free Parking on Street');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Free Parking on Street ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am7,
                                  onChanged: (value) {
                                    setState(() {
                                      am7 = value!;
                                      if (value) {
                                        amenities.add('Smoking allowed');
                                      } else {
                                        amenities.remove('Smoking allowed');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Smoking allowed ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am8,
                                  onChanged: (value) {
                                    setState(() {
                                      am8 = value!;
                                      if (value) {
                                        amenities.add('Events');
                                      } else {
                                        amenities.remove('Events');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Events ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am9,
                                  onChanged: (value) {
                                    setState(() {
                                      am9 = value!;
                                      if (value) {
                                        amenities.add('Electricity');
                                      } else {
                                        amenities.remove('Electricity');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Electricity ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am10,
                                  onChanged: (value) {
                                    setState(() {
                                      am10 = value!;
                                      if (value) {
                                        amenities.add('Security Cameras');
                                      } else {
                                        amenities.remove('Security Cameras');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Security Cameras ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am11,
                                  onChanged: (value) {
                                    setState(() {
                                      am11 = value!;
                                      if (value) {
                                        amenities.add('Intercom');
                                      } else {
                                        amenities.remove('Intercom');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Intercom ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: am12,
                                  onChanged: (value) {
                                    setState(() {
                                      am12 = value!;
                                      if (value) {
                                        amenities.add('Door Attendant');
                                      } else {
                                        amenities.remove('Door Attendant');
                                      }
                                    });
                                  },
                                ),
                                const Text(
                                  'Door Attendant ',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                              ],
                            ),
                          ]),
                      AddFieldMainWidget(
                          icon: Icons.image_sharp,
                          title: "Main Image ",
                          description:
                              "[Valid formats : jpg, jpeg, png][Max size : 5Mb] NOTE: If you upload image here, this will be thumbnail image",
                          inputList: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      File image;
                                      picker
                                          .pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 50,
                                              maxWidth: 800,
                                              maxHeight: 800)
                                          .then((value) => {
                                                if (value != null)
                                                  {
                                                    image = File(value.path),
                                                    imageUpload(image,
                                                        value.name, "main"),
                                                    ref
                                                        .read(mainImageProvider
                                                            .notifier)
                                                        .state = image.path,
                                                  }
                                              });
                                    },
                                    child: Container(
                                      color: ViwahaColor.transparent,
                                      width: 50,
                                      height: 50,
                                      child: Assets
                                          .lib.assets.images.photography
                                          .image(),
                                    ),
                                  ),
                                  ref.watch(isLoadingMainImageProvider)
                                      ? Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ViwahaColor.primary),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : ref.watch(mainImageProvider).isEmpty
                                          ? Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ViwahaColor.primary),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Assets
                                                  .lib.assets.images.colorLogo
                                                  .image(),
                                            )
                                          : Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: Image.file(File(
                                                              ref.watch(
                                                                  mainImageProvider)))
                                                          .image),
                                                  border: Border.all(
                                                      color:
                                                          ViwahaColor.primary),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                            )
                                ],
                              ),
                            )
                          ]),
                      AddFieldMainWidget(
                          icon: Icons.image_search,
                          title: "Add Gallery ",
                          description:
                              "NOTE: First uploaded image will be the thumbnail image ",
                          inputList: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      File image;
                                      picker
                                          .pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 50,
                                              maxWidth: 800,
                                              maxHeight: 800)
                                          .then((value) => {
                                                if (value != null)
                                                  {
                                                    image = File(value.path),
                                                    imageUpload(image,
                                                        value.name, "gallery"),
                                                    setState(() {
                                                      ref
                                                          .read(
                                                              imageGalleryProvider)
                                                          .add(ImageObject(
                                                              path:
                                                                  value.path));
                                                    })
                                                  }
                                              });
                                    },
                                    child: Container(
                                      color: ViwahaColor.transparent,
                                      width: 50,
                                      height: 50,
                                      child: Assets
                                          .lib.assets.images.photography
                                          .image(),
                                    ),
                                  ),
                                  ref.watch(isLoadingGalleryProvider)
                                      ? Container(
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ViwahaColor.primary),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10))),
                                          child: const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : ref.watch(imageGalleryProvider).isEmpty
                                          ? Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          ViwahaColor.primary),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Assets
                                                  .lib.assets.images.colorLogo
                                                  .image(),
                                            )
                                          : SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: SingleChildScrollView(
                                                child: ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: ref
                                                        .watch(
                                                            imageGalleryProvider)
                                                        .length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Container(
                                                          width: 130,
                                                          height: 130,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: Image.file(File(ref
                                                                          .watch(imageGalleryProvider)[
                                                                              index]
                                                                          .path
                                                                          .toString()))
                                                                      .image),
                                                              border: Border.all(
                                                                  color: ViwahaColor
                                                                      .primary),
                                                              borderRadius:
                                                                  const BorderRadius.all(
                                                                      Radius.circular(10))),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                ],
                              ),
                            )
                          ]),
                      AddFieldMainWidget(
                          icon: Icons.video_camera_back_outlined,
                          title: "Add Video",
                          description:
                              "Copy and paste the youtube or facebook video link",
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
                                        .read(adVideoLinkProvider.notifier)
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
                                  hintText: "https://youtube.com/video",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontFamily: "verdana_regular",
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelText: 'Youtube video link',
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
                          icon: Icons.share_arrival_time_outlined,
                          title: "Opening Hours",
                          description:
                              "Select full detail information about opening time",
                          inputList: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'Always Open',
                                  selectedValue: _alwaysOpen,
                                  choiceItems: [
                                    S2Choice<String>(title: 'No', value: 'No'),
                                    S2Choice<String>(title: 'Yes', value: 'Yes')
                                  ],
                                  onChange: (selected) {
                                    setState(() {
                                      _alwaysOpen = selected.value;
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_alwaysOpen),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: SmartSelect<String>.single(
                                  title: 'Open in holidays',
                                  selectedValue: _openInHollyday,
                                  choiceItems: [
                                    S2Choice<String>(title: 'No', value: 'No'),
                                    S2Choice<String>(title: 'Yes', value: 'Yes')
                                  ],
                                  onChange: (selected) {
                                    setState(() {
                                      _openInHollyday = selected.value;
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Text(
                                        state.title.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                          fontFamily: "verdana_regular",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      subtitle: Text(_openInHollyday),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _mondayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _mondayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_mondayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _mondayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _mondayClose = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_mondayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Monday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _tuesdayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _tuesdayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_tuesdayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _tuesdayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _tuesdayClose = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_tuesdayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Tuesday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _wednesdayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _wednesdayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_wednesdayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _wednesdayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _wednesdayClose =
                                                    selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_wednesdayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Wednesday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _thursdayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _thursdayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_thursdayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _thursdayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _thursdayClose = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_thursdayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Thursday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _fridayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _fridayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_fridayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _fridayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _fridayClose = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_fridayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Friday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _saturedayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _saturedayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_saturedayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _saturedayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _saturedayClose =
                                                    selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_saturedayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Saturday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  padding: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ViwahaColor.primary, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Opening Time',
                                            selectedValue: _sundayOpen,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _sundayOpen = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_sundayOpen),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: SmartSelect<String>.single(
                                            title: 'Closing Time',
                                            selectedValue: _sundayClose,
                                            choiceItems: timeData,
                                            onChange: (selected) {
                                              setState(() {
                                                _sundayClose = selected.value;
                                              });
                                            },
                                            modalType: S2ModalType.bottomSheet,
                                            tileBuilder: (context, state) {
                                              return ListTile(
                                                title: Text(
                                                  state.title.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                    fontFamily:
                                                        "verdana_regular",
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                subtitle: Text(_sundayClose),
                                                trailing: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                onTap: state.showModal,
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 10, left: 10, right: 10),
                                    color: Colors.white,
                                    child: const Text(
                                      'Sunday',
                                      style: TextStyle(
                                          color: ViwahaColor.primary,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
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
                                    .read(isLoadingAddListingProvider.notifier)
                                    .state = true;

                                var newList = {
                                  "userId": "8",
                                  "title": ref.read(adTitleProvider),
                                  "category": _subCat,
                                  "address": ref.read(adAddressProvider),
                                  "location": _subLocation,
                                  "googleplace":
                                      ref.read(adGoogleAddressProvider),
                                  "video": ref.read(adVideoLinkProvider),
                                  "video1": "",
                                  "video2": "",
                                  "video3": "",
                                  "video4": "",
                                  "video5": "",
                                  "name": ref.read(adOwnerNameProvider),
                                  "email": ref.read(adEmailProvider),
                                  "phone": ref.read(adPhoneProvider),
                                  "whatsapp": ref.read(adWhatsappProvider),
                                  "website": ref.read(adWebSiteProvider),
                                  "designation":
                                      ref.read(adDesignationProvider),
                                  "amenities": amenities.toString(),
                                  "company": ref.read(adCompanyProvider),
                                  "facebook": ref.read(adFacebookProvider),
                                  "instagram": ref.read(adInstagramProvider),
                                  "youtube": ref.read(adYoutubeProvider),
                                  "linkedin": ref.read(adLinkedinProvider),
                                  "description": ref.read(adDescProvider),
                                  "saturdayOpenTime":
                                      _saturedayOpen == "Select one"
                                          ? ""
                                          : _saturedayOpen,
                                  "saturdayCloseTime":
                                      _saturedayClose == "Select one"
                                          ? ""
                                          : _saturedayClose,
                                  "sundayOpenTime": _sundayOpen == "Select one"
                                      ? ""
                                      : _sundayOpen,
                                  "sundayCloseTime":
                                      _sundayClose == "Select one"
                                          ? ""
                                          : _sundayClose,
                                  "mondayOpenTime": _mondayOpen == "Select one"
                                      ? ""
                                      : _mondayOpen,
                                  "mondayCloseTime":
                                      _mondayClose == "Select one"
                                          ? ""
                                          : _mondayClose,
                                  "tuesdayOpenTime":
                                      _tuesdayOpen == "Select one"
                                          ? ""
                                          : _tuesdayOpen,
                                  "tuesdayCloseTime":
                                      _tuesdayClose == "Select one"
                                          ? ""
                                          : _tuesdayClose,
                                  "wednesdayOpenTime":
                                      _wednesdayOpen == "Select one"
                                          ? ""
                                          : _wednesdayOpen,
                                  "wednesdayCloseTime":
                                      _wednesdayClose == "Select one"
                                          ? ""
                                          : _wednesdayClose,
                                  "thursdayOpenTime":
                                      _thursdayOpen == "Select one"
                                          ? ""
                                          : _thursdayOpen,
                                  "thursdayCloseTime":
                                      _thursdayClose == "Select one"
                                          ? ""
                                          : _thursdayClose,
                                  "fridayOpenTime": _fridayOpen == "Select one"
                                      ? ""
                                      : _fridayOpen,
                                  "fridayCloseTime":
                                      _fridayClose == "Select one"
                                          ? ""
                                          : _fridayClose,
                                  "alwaysOpen": _alwaysOpen == "Select one"
                                      ? ""
                                      : _alwaysOpen,
                                  "openHoliday": _openInHollyday == "Select one"
                                      ? ""
                                      : _openInHollyday,
                                  "mainLocation": _location,
                                  "mainCategory": _cat,
                                  "price": ref.read(adPriceProvider),
                                  "askPrice": askPrice == false ? 0 : 1,
                                  "negotiable": negotiable == false ? 0 : 1,
                                  "duplicate": "",
                                  "uniqueImageName11": "",
                                  "gallery_images":
                                      ref.read(imageNameGalleryProvider),
                                  "file1": ref.read(mainImageNameProvider)
                                };
                                controller.addNewListing(newList); 
                                // PostData.addNewListing(newList);
                              },
                              icon: const Icon(Icons.add_box_outlined),
                              label: const Text('ADD YOUR LISTING'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ));
  }
}
