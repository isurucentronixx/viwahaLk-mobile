// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
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
  Location _mainLocation = const Location(
    location_en: 'Select one',
  );
  SubLocation _subLocation = const SubLocation(
    sub_location_en: 'Select one',
  );
  Categories _mainCat = const Categories(
    category: 'Select one',
  );
  SubCategories _subCat = const SubCategories(
    sub_category: 'Select one',
  );
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

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(categoriesProvider);
    List<S2Choice<Location>>? locationsData = ref
        .watch(locationsProvider)
        .map((e) =>
            S2Choice<Location>(value: e, title: e.location_en.toString()))
        .toList();
    List<S2Choice<SubLocation>>? subLocationsData = ref
        .watch(subLocationsProvider)
        .map((e) => S2Choice<SubLocation>(
            value: e!, title: e.sub_location_en.toString()))
        .toList();

    List<S2Choice<Categories>>? catData = ref
        .watch(categoriesProvider)
        .map(
            (e) => S2Choice<Categories>(value: e, title: e.category.toString()))
        .toList();
    List<S2Choice<SubCategories>>? subCatData = ref
        .watch(subCategoriesProvider)
        .map((e) => S2Choice<SubCategories>(
            value: e!, title: e.sub_category.toString()))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Image(
                        width: 250,
                        image:
                            Assets.lib.assets.images.colorLogo.image().image),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SmartSelect<Location>.single(
                            modalFilterAuto: true,
                            modalFilter: true,
                            title: 'Locations',
                            selectedValue: _mainLocation,
                            choiceItems: locationsData,
                            onChange: (selected) {
                              setState(() {
                                _mainLocation = selected.value;
                                _locationDropdownSearchKey.currentState
                                    ?.clear();
                                ref.refresh(selectedSubLocationProvider);
                                if (selected != null) {
                                  final selectedLocation =
                                      locationsData.firstWhere((location) =>
                                          location.value.location_en ==
                                          selected.value.location_en);
                                  ref
                                          .read(subLocationsProvider.notifier)
                                          .state =
                                      selectedLocation.value.sub_locations ??
                                          [];
                                  ref
                                          .read(selectedMainLocationProvider
                                              .notifier)
                                          .state =
                                      selectedLocation.value.location_en!;
                                  _subLocation = const SubLocation(
                                      sub_location_en: 'Select One');

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
                                subtitle:
                                    Text(_mainLocation.location_en.toString()),
                                trailing: const Icon(Icons.keyboard_arrow_down),
                                onTap: state.showModal,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ref.watch(isLocationActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SmartSelect<SubLocation>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'Sub Locations',
                                  selectedValue: _subLocation,
                                  choiceItems: subLocationsData,
                                  onChange: (selected) {
                                    setState(() {
                                      if (selected != null) {
                                        _subLocation = selected.value;
                                        final selectedSubLocation = ref
                                            .watch(subLocationsProvider)
                                            .firstWhere((location) =>
                                                location!.sub_location_en ==
                                                selected.value.sub_location_en);

                                        ref
                                            .read(selectedSubLocationProvider
                                                .notifier)
                                            .state = selectedSubLocation!;
                                      }
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
                                      subtitle: Text(_subLocation
                                          .sub_location_en
                                          .toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SmartSelect<Categories>.single(
                            modalFilterAuto: true,
                            modalFilter: true,
                            title: 'Categories',
                            selectedValue: _mainCat,
                            choiceItems: catData,
                            onChange: (selected) {
                              setState(() {
                                _mainCat = selected.value;
                                _categoryDropdownSearchKey.currentState
                                    ?.clear();
                                ref.refresh(selectedSubCategoryProvider);
                                if (selected != null) {
                                  final selectedCat = catData.firstWhere(
                                      (catData) =>
                                          catData.value.category ==
                                          selected.value.category);
                                  ref
                                          .read(subCategoriesProvider.notifier)
                                          .state =
                                      selectedCat.value.sub_categories ?? [];
                                  ref
                                      .read(
                                          selectedMainCategoryProvider.notifier)
                                      .state = selectedCat.value.category!;
                                  _subCat = const SubCategories(
                                      sub_category: 'Select One');

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
                                subtitle: Text(_mainCat.category.toString()),
                                trailing: const Icon(Icons.keyboard_arrow_down),
                                onTap: state.showModal,
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ref.watch(isActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SmartSelect<SubCategories>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'Sub Categories',
                                  selectedValue: _subCat,
                                  choiceItems: subCatData,
                                  onChange: (selected) {
                                    setState(() {
                                      if (selected != null) {
                                        _subCat = selected.value;
                                        final selectedSubCat = ref
                                            .watch(subCategoriesProvider)
                                            .firstWhere((cat) =>
                                                cat!.sub_category ==
                                                selected.value.sub_category);

                                        ref
                                            .read(selectedSubCategoryProvider
                                                .notifier)
                                            .state = selectedSubCat!;
                                      }
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
                                      subtitle:
                                          Text(_subCat.sub_category.toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 10.0),
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
