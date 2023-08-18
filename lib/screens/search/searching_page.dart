// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

final isActivatedProvider = StateProvider<bool>((ref) => false);
final isLocationActivatedProvider = StateProvider<bool>((ref) => false);
final subCategoriesProvider = StateProvider<List<SubCategories?>>((ref) => []);
final subLocationsProvider = StateProvider<List<SubLocation?>>((ref) => []);
final selectedMainCategoryProvider = StateProvider<String>((ref) => "");
final selectedMainLocationProvider = StateProvider<String>((ref) => "");
final selectedSubCategoryProvider =
    StateProvider<SubCategories>((ref) => const SubCategories());
final selectedSubLocationProvider =
    StateProvider<SubLocation>((ref) => const SubLocation());

@RoutePage()
class SearchingPage extends ConsumerStatefulWidget {
  const SearchingPage({super.key});
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends ConsumerState<SearchingPage> {
  final GlobalKey<DropdownSearchState<String>> _locationDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _categoryDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  @override
  void initState() {
    super.initState();
    ref.refresh(isActivatedProvider);
    ref.refresh(isLocationActivatedProvider);
    ref.refresh(subCategoriesProvider);
    ref.refresh(subLocationsProvider);
    ref.refresh(selectedMainCategoryProvider);
    ref.refresh(selectedMainLocationProvider);
    ref.refresh(selectedSubCategoryProvider);
    ref.refresh(selectedSubLocationProvider);
  }

  bool _premiumVendors = false;
  bool _topListing = false;
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(categoriesProvider);
    final locationsData = ref.watch(locationsProvider);
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
          title: const Text(''),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Center(
                        //     child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           _premiumVendors = !_premiumVendors;
                        //         });
                        //       },
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           SizedBox(
                        //             child: Text(
                        //               'Premium Vendors',
                        //               style: TextStyle(
                        //                   fontFamily: 'Lato',
                        //                   fontSize: 16,
                        //                   fontWeight: FontWeight.w400,
                        //                   color: Colors.black.withOpacity(0.5)),
                        //             ),
                        //           ),
                        //           Container(
                        //             width: 30,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                   color: ViwahaColor.primary,
                        //                   width: 3,
                        //                 ),
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.white),
                        //             child: _premiumVendors
                        //                 ? const Icon(
                        //                     Icons.check,
                        //                     size: 25.0,
                        //                     color: ViwahaColor.primary,
                        //                   )
                        //                 : const Icon(
                        //                     Icons.check_box_outline_blank,
                        //                     size: 25.0,
                        //                     color: Colors.white,
                        //                   ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           _topListing = !_topListing;
                        //         });
                        //       },
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           SizedBox(
                        //             child: Text(
                        //               'Top Listing',
                        //               style: TextStyle(
                        //                   fontFamily: 'Lato',
                        //                   fontSize: 16,
                        //                   fontWeight: FontWeight.w400,
                        //                   color: Colors.black.withOpacity(0.5)),
                        //             ),
                        //           ),
                        //           Container(
                        //             width: 30,
                        //             decoration: BoxDecoration(
                        //                 border: Border.all(
                        //                   color: ViwahaColor.primary,
                        //                   width: 3,
                        //                 ),
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.white),
                        //             child: _topListing
                        //                 ? const Icon(
                        //                     Icons.check,
                        //                     size: 25.0,
                        //                     color: ViwahaColor.primary,
                        //                   )
                        //                 : const Icon(
                        //                     Icons.check_box_outline_blank,
                        //                     size: 25.0,
                        //                     color: Colors.white,
                        //                   ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              emptyBuilder: (context, searchEntry) =>
                                  const Center(
                                      child: Center(
                                child: CircularProgressIndicator(),
                              )),

                              showSearchBox: true,
                              showSelectedItems: true,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: locationsData.map((location) {
                              return location.location_en.toString();
                            }).toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Locations",
                                hintText: "Select a Location",
                                hintStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                                labelStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: ViwahaColor.primary, width: 1.0),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _locationDropdownSearchKey.currentState
                                    ?.clear();
                                ref.refresh(selectedSubLocationProvider);
                                if (value != null) {
                                  final selectedLocation =
                                      locationsData.firstWhere((location) =>
                                          location.location_en == value);
                                  ref
                                          .read(subLocationsProvider.notifier)
                                          .state =
                                      selectedLocation.sub_locations ?? [];
                                  ref
                                      .read(
                                          selectedMainLocationProvider.notifier)
                                      .state = selectedLocation.location_en!;
                                  ref
                                      .read(
                                          isLocationActivatedProvider.notifier)
                                      .state = true;
                                } else {
                                  ref
                                      .read(subLocationsProvider.notifier)
                                      .state = [];
                                  ref
                                      .read(
                                          isLocationActivatedProvider.notifier)
                                      .state = false;
                                }
                              });
                            },
                          ),
                        ),
                        ref.watch(isLocationActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DropdownSearch<String>(
                                  key: _locationDropdownSearchKey,
                                  popupProps: PopupProps.menu(
                                    emptyBuilder: (context, searchEntry) =>
                                        const Center(
                                            child: Center(
                                      child: CircularProgressIndicator(),
                                    )),
                                    showSearchBox: true,
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: ref
                                      .watch(subLocationsProvider)
                                      .map((subLocations) {
                                    return subLocations!.sub_location_en
                                        .toString();
                                  }).toList(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Sub Locations",
                                      hintText: "Select a Sub Location",
                                      hintStyle: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        final selectedSubLocation = ref
                                            .watch(subLocationsProvider)
                                            .firstWhere((location) =>
                                                location!.sub_location_en ==
                                                value);

                                        ref
                                            .read(selectedSubLocationProvider
                                                .notifier)
                                            .state = selectedSubLocation!;
                                      }
                                    });
                                  },
                                ),
                              )
                            : const SizedBox(),

                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.menu(
                              emptyBuilder: (context, searchEntry) =>
                                  const Center(
                                      child: Center(
                                child: CircularProgressIndicator(),
                              )),
                              showSearchBox: true,
                              showSelectedItems: true,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            items: data.map((category) {
                              return category.category.toString();
                            }).toList(),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "Categories",
                                hintText: "Select a Category",
                                hintStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                                labelStyle: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5)),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: ViwahaColor.primary, width: 1.0),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  _categoryDropdownSearchKey.currentState
                                      ?.clear();
                                  ref.refresh(selectedSubCategoryProvider);
                                  final selectedCategory = data.firstWhere(
                                      (category) => category.category == value);
                                  ref
                                          .read(subCategoriesProvider.notifier)
                                          .state =
                                      selectedCategory.sub_categories ?? [];
                                  ref
                                      .read(
                                          selectedMainCategoryProvider.notifier)
                                      .state = selectedCategory.category!;
                                  ref.read(isActivatedProvider.notifier).state =
                                      true;
                                } else {
                                  ref
                                      .read(subCategoriesProvider.notifier)
                                      .state = [];
                                  ref.read(isActivatedProvider.notifier).state =
                                      false;
                                }
                              });
                            },
                          ),
                        ),
                        ref.watch(isActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: DropdownSearch<String>(
                                  key: _categoryDropdownSearchKey,
                                  popupProps: PopupProps.menu(
                                    emptyBuilder: (context, searchEntry) =>
                                        const Center(
                                            child: Center(
                                      child: CircularProgressIndicator(),
                                    )),
                                    showSearchBox: true,
                                    showSelectedItems: true,
                                    // disabledItemFn: (String s) => s.startsWith('I'),
                                  ),
                                  items: ref
                                      .watch(subCategoriesProvider)
                                      .map((subCategory) {
                                    return subCategory!.sub_category.toString();
                                  }).toList(),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Sub Categories",
                                      hintText: "Select a Sub Category",
                                      hintStyle: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5)),
                                      focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: ViwahaColor.primary,
                                            width: 1.0),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null) {
                                        final selectedSubCategory = ref
                                            .watch(subCategoriesProvider)
                                            .firstWhere((category) =>
                                                category!.sub_category ==
                                                value);

                                        ref
                                            .read(selectedSubCategoryProvider
                                                .notifier)
                                            .state = selectedSubCategory!;
                                      }
                                    });
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(const SearchingResultsPage());
                          // Perform login logic here
                        },
                        icon: const Icon(Icons.search),
                        label: const Text('Search Now'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
