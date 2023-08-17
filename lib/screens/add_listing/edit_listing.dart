// ignore_for_file: unused_import, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
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

@RoutePage()
class EditListingPage extends ConsumerStatefulWidget {
  const EditListingPage(this.item, {super.key});
  final SearchResultItem? item;
  @override
  _EditListingPageState createState() => _EditListingPageState();
}

class _EditListingPageState extends ConsumerState<EditListingPage> {
  final picker = ImagePicker();

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
  String _cat = 'Select One';
  String _subCat = 'Select One';
  String _location = 'Select One';
  String _subLocation = 'Select One';
  String _alwaysOpen = 'Select One';
  String _openInHollyday = 'Select One';
  String _mondayOpen = 'Select One';
  String _mondayClose = 'Select One';
  String _tuesdayOpen = 'Select One';
  String _tuesdayClose = 'Select One';
  String _wednesdayOpen = 'Select One';
  String _wednesdayClose = 'Select One';
  String _thursdayOpen = 'Select One';
  String _thursdayClose = 'Select One';
  String _fridayOpen = 'Select One';
  String _fridayClose = 'Select One';
  String _saturedayOpen = 'Select One';
  String _saturedayClose = 'Select One';
  String _sundayOpen = 'Select One';
  String _sundayClose = 'Select One';

  @override
  void initState() {
    // TODO: implement initState
    final SearchResultItem? item = widget.item;
    // List<String> amList = json.decode(item!.amenities.toString());
    List<dynamic> decodedAmenities =
        json.decode('["Elevator in Building", "Wifi"]');
    List<String> stringAmenities =
        decodedAmenities.map((item) => item.toString()).toList();
    print(stringAmenities);
    _cat = item!.main_category ?? 'Select One';
    _subCat = widget.item!.category ?? 'Select One';
    _location = widget.item!.main_location ?? 'Select One';
    _subLocation = widget.item!.location ?? 'Select One';
    _alwaysOpen = widget.item!.always_open ?? 'Select One';
    _openInHollyday = widget.item!.open_holiday ?? 'Select One';
    _mondayOpen = widget.item!.monday_open_time ?? 'Select One';
    _mondayClose = widget.item!.monday_close_time ?? 'Select One';
    _tuesdayOpen = widget.item!.tuesday_open_time ?? 'Select One';
    _tuesdayClose = widget.item!.tuesday_close_time ?? 'Select One';
    _wednesdayOpen = widget.item!.wednesday_open_time ?? 'Select One';
    _wednesdayClose = widget.item!.wednesday_close_time ?? 'Select One';
    _thursdayOpen = widget.item!.thursday_open_time ?? 'Select One';
    _thursdayClose = widget.item!.thursday_close_time ?? 'Select One';
    _fridayOpen = widget.item!.friday_open_time ?? 'Select One';
    _fridayClose = widget.item!.friday_close_time ?? 'Select One';
    _saturedayOpen = widget.item!.saturday_open_time ?? 'Select One';
    _saturedayClose = widget.item!.saturday_close_time ?? 'Select One';
    _sundayOpen = widget.item!.sunday_open_time ?? 'Select One';
    _sundayClose = widget.item!.sunday_close_time ?? 'Select One';

    am1 = stringAmenities.contains("Elevator in Building") ? true : false;
    am2 = stringAmenities.contains("Friendly Workspace") ? true : false;
    am3 = stringAmenities.contains("Instant Book") ? true : false;
    am4 = stringAmenities.contains("Wifi") ? true : false;
    am5 = stringAmenities.contains("Free Parking on Premises") ? true : false;
    am6 = stringAmenities.contains("Free Parking on Street") ? true : false;
    am7 = stringAmenities.contains("Smoking allowed") ? true : false;
    am8 = stringAmenities.contains("Events") ? true : false;
    am9 = stringAmenities.contains("Electricity") ? true : false;
    am10 = stringAmenities.contains("Security Cameras") ? true : false;
    am11 = stringAmenities.contains("Intercom") ? true : false;
    am12 = stringAmenities.contains("Door Attendant") ? true : false;

    askPrice = widget.item!.ask_price == "1" ? true : false;
    negotiable = widget.item!.negotiable == "1" ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider).user;
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
                                initialValue: widget.item!.title != null
                                    ? widget.item!.title.toString()
                                    : '',
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
                                initialValue: widget.item!.address != null
                                    ? widget.item!.address.toString()
                                    : '',
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
                                initialValue: widget.item!.price != null
                                    ? widget.item!.price.toString()
                                    : '',
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
                                initialValue:
                                    '${user!.firstname} ${user.lastname}',
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
                                initialValue: widget.item!.email != null
                                    ? widget.item!.email.toString()
                                    : '',
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
                                initialValue: widget.item!.phone != null
                                    ? widget.item!.phone.toString()
                                    : '',
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
                                initialValue: widget.item!.whatsapp != null
                                    ? widget.item!.whatsapp.toString()
                                    : '',
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
                                initialValue: widget.item!.designation != null
                                    ? widget.item!.designation.toString()
                                    : '',
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
                                initialValue: widget.item!.company != null
                                    ? widget.item!.company.toString()
                                    : '',
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
                                initialValue: widget.item!.website != null
                                    ? widget.item!.website.toString()
                                    : '',
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
                                initialValue: widget.item!.facebook != null
                                    ? widget.item!.facebook.toString()
                                    : '',
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
                                initialValue: widget.item!.instagram != null
                                    ? widget.item!.instagram.toString()
                                    : '',
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
                                initialValue: widget.item!.youtube != null
                                    ? widget.item!.youtube.toString()
                                    : '',
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
                                initialValue: widget.item!.linkedin != null
                                    ? widget.item!.linkedin.toString()
                                    : '',
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
                              child: TextFormField(
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
                                initialValue: widget.item!.description != null
                                    ? widget.item!.description.toString()
                                    : '',
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
                                initialValue: widget.item!.video != null
                                    ? widget.item!.video.toString()
                                    : '',
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
