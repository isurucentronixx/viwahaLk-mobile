// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

final isActivatedProvider = StateProvider<bool>((ref) => false);
final isLocationActivatedProvider = StateProvider<bool>((ref) => false);
final subCategoriesProvider = StateProvider<List<SubCategories?>>((ref) => []);
final subLocationsProvider = StateProvider<List<SubLocation?>>((ref) => []);
final selectedMainCategoryProvider = StateProvider<String>((ref) => "");
final selectedMainLocationProvider = StateProvider<String>((ref) => "");
final selectedPriceRangeProvider = StateProvider<String>((ref) => "");
final selectedAmenitiesProvider = StateProvider<List<String>>((ref) => []);
final searchingKeywords = StateProvider<String>((ref) => "");
final selectedOrderProvider = StateProvider<String>((ref) => "");
final selectedSortProvider = StateProvider<String>((ref) => "");
final selectedRatingProvider = StateProvider<String>((ref) => "");
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
  List<S2Choice<SubCategories>>? subCat2 = [];
  List<S2Choice<Location>>? location2 = [];

  Location _location = const Location(
    location_en: 'Select one',
  );
  double _currentHeight = 0;
  final double _expandedHeight = 450;

  final TextEditingController? _textEditingController = TextEditingController();
  final FocusNode _texrFocusNode = FocusNode();
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
  String _price = 'Select One';
  String _orderBy = 'Select One';
  String _sortBy = 'Select One';
  String _ratings = 'Select One';
  List<String> _amenities = ['Select'];
  final GlobalKey<DropdownSearchState<String>> _locationDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _categoryDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _priceDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _amenitiesDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _sortByDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _orderByDropdownSearchKey =
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
    ref.refresh(selectedAmenitiesProvider);
    ref.refresh(searchingKeywords);
    ref.refresh(selectedPriceRangeProvider);
    ref.read(categoriesProvider).forEach((element) {
      element.sub_categories!.forEach((element) {
        subCat2!.add(S2Choice<SubCategories>(
            value: SubCategories(
                id: int.parse(element!.category_id.toString()),
                category_id: element.category_id,
                sub_category: element.sub_category,
                created_at: element.created_at,
                updated_at: element.updated_at,
                web_category: element.web_category),
            title: element.sub_category));
      });
    });

    ref.read(locationsProvider).forEach((element) {
      location2!.add(S2Choice<Location>(
          value: Location(
              id: element.id,
              location_id: element.location_id,
              location_en: element.location_en,
              location_si: element.location_si,
              location_ta: element.location_ta),
          title: element.location_en));
    });
  }

  void _expandOnChanged() {
    var isExpanded = _currentHeight == _expandedHeight;
    setState(() {
      _currentHeight = isExpanded ? 0 : _expandedHeight;
    });
  }

  @override
  void dispose() {
    _texrFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
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
    List<S2Choice<String>>? priceData = [
      S2Choice<String>(value: '1000', title: 'UNDER 1000'),
      S2Choice<String>(value: '1000 - 1500', title: '1000 - 1500'),
      S2Choice<String>(value: '1500 - 2000', title: '1500 - 2000'),
      S2Choice<String>(value: '2000 - 3000', title: '2000 - 3000'),
      S2Choice<String>(value: '3000+', title: '3000+'),
    ];
    List<S2Choice<String>>? amenitiesData = [
      S2Choice<String>(value: 'Accommodations', title: 'Accommodations'),
      S2Choice<String>(value: 'Bar Services', title: 'Bar Services'),
      S2Choice<String>(value: 'Catering services', title: 'Catering services'),
      S2Choice<String>(value: 'Get Ready Rooms', title: 'Get Ready Rooms'),
      S2Choice<String>(value: 'Outside Vendors', title: 'Outside Vendors'),
      S2Choice<String>(value: 'Wifi', title: 'Wifi'),
    ];
    List<S2Choice<String>>? orderByData = [
      S2Choice<String>(value: 'asc', title: 'Accending'),
      S2Choice<String>(value: 'desc', title: 'Decending'),
    ];
    List<S2Choice<String>>? sortByData = [
      S2Choice<String>(value: 'title', title: 'Title'),
      S2Choice<String>(value: 'rating', title: 'Rating'),
      S2Choice<String>(value: 'date', title: 'Date'),
    ];
    List<S2Choice<String>>? ratingsData = [
      S2Choice<String>(value: '', title: 'ALL RATINGS'),
      S2Choice<String>(value: '4', title: 'RATED 4'),
      S2Choice<String>(value: '4p', title: 'RATED 4+'),
      S2Choice<String>(value: '4.5p', title: 'RATED 4.5+'),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              ref.read(isSearchingProvider.notifier).state = true;
            });
            AutoRouter.of(context).push(const SearchingResultsPage());
          },
          label: const Text('search').tr(),
          icon: const Icon(Icons.search),
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
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _textEditingController,
                                  focusNode: _texrFocusNode,
                                  onChanged: (value) {
                                    ref.read(searchingKeywords.notifier).state =
                                        value.toString();
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Type here to search',
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SmartSelect<Location>.single(
                            modalFilterAuto: true,
                            modalFilter: true,
                            title: 'all_location'.tr(),
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
                        // const SizedBox(height: 5.0),
                        ref.watch(isLocationActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SmartSelect<SubLocation>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'sub_location'.tr(),
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
                        // const SizedBox(height: 5.0),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SmartSelect<Categories>.single(
                            modalFilterAuto: true,
                            modalFilter: true,
                            title: 'all_category'.tr(),
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
                        // const SizedBox(height: 5.0),
                        ref.watch(isActivatedProvider)
                            ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SmartSelect<SubCategories>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'sub_category'.tr(),
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
                        // const SizedBox(height: 5.0),
                        GestureDetector(
                          onTap: _expandOnChanged,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.025,
                                right:
                                    MediaQuery.of(context).size.width * 0.025),
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                              width: double.infinity,
                              // color: Colors.green,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.filter_alt_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Text(
                                    'MORE FILTERS',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          _currentHeight == 0
                                              ? Icons.keyboard_arrow_down
                                              : Icons.keyboard_arrow_up,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        // this is the body which expands and collapses by height change
                        AnimatedContainer(
                          height: _currentHeight,
                          width: MediaQuery.of(context).size.width * 0.95,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.all(5.0),
                              //       child: SmartSelect<SubCategories>.single(
                              //         modalFilterAuto: true,
                              //         modalFilter: true,
                              //         title: LocaleKeys.all_category.tr(),
                              //         selectedValue: _subCat,
                              //         choiceItems: subCat2,
                              //         onChange: (selected) {
                              //           setState(() {
                              //             ref.refresh(
                              //                 selectedMainLocationProvider);
                              //             ref
                              //                 .read(
                              //                     isSearchingProvider.notifier)
                              //                 .state = true;
                              //             _categoryDropdownSearchKey
                              //                 .currentState
                              //                 ?.clear();
                              //             ref
                              //                 .read(selectedSubCategoryProvider
                              //                     .notifier)
                              //                 .state = selected.value;

                              //             AutoRouter.of(context).push(
                              //                 const SearchingResultsPage());
                              //           });
                              //         },
                              //         modalType: S2ModalType.bottomSheet,
                              //         tileBuilder: (context, state) {
                              //           return ElevatedButton.icon(
                              //               onPressed: () => state.showModal(),
                              //               icon: const Icon(Icons.category),
                              //               label: Text(
                              //                   LocaleKeys.all_category.tr()));
                              //         },
                              //       ),
                              //     ),
                              //     Padding(
                              //       padding: const EdgeInsets.all(5.0),
                              //       child: SmartSelect<Location>.single(
                              //         modalFilterAuto: true,
                              //         modalFilter: true,
                              //         title: LocaleKeys.all_location.tr(),
                              //         selectedValue: _location,
                              //         choiceItems: location2,
                              //         onChange: (selected) {
                              //           setState(() {
                              //             ref.refresh(
                              //                 selectedSubCategoryProvider);
                              //             ref
                              //                 .read(
                              //                     isSearchingProvider.notifier)
                              //                 .state = true;
                              //             _locationDropdownSearchKey
                              //                 .currentState
                              //                 ?.clear();
                              //             ref
                              //                     .read(
                              //                         selectedMainLocationProvider
                              //                             .notifier)
                              //                     .state =
                              //                 selected.value.location_en!;

                              //             AutoRouter.of(context).push(
                              //                 const SearchingResultsPage());
                              //           });
                              //         },
                              //         modalType: S2ModalType.bottomSheet,
                              //         tileBuilder: (context, state) {
                              //           return ElevatedButton.icon(
                              //               onPressed: () => state.showModal(),
                              //               icon: const Icon(Icons.location_on),
                              //               label: Text(
                              //                   LocaleKeys.all_location.tr()));
                              //         },
                              //       ),
                              //     ),
                              //   ],
                              // ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                child: SmartSelect<String>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'SORT BY',
                                  selectedValue: _sortBy,
                                  choiceItems: sortByData,
                                  onChange: (selected) {
                                    setState(() {
                                      _sortBy = selected.title.toString();
                                      ref
                                          .read(selectedSortProvider.notifier)
                                          .state = selected.value;
                                      _sortByDropdownSearchKey.currentState
                                          ?.clear();
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
                                      subtitle: Text(_sortBy.toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: SmartSelect<String>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'ORDER BY',
                                  selectedValue: _orderBy,
                                  choiceItems: orderByData,
                                  onChange: (selected) {
                                    setState(() {
                                      _orderBy = selected.title.toString();
                                      ref
                                          .read(selectedOrderProvider.notifier)
                                          .state = selected.value;
                                      _orderByDropdownSearchKey.currentState
                                          ?.clear();
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
                                      subtitle: Text(_orderBy.toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SmartSelect<String>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'PRICE',
                                  selectedValue: _price,
                                  choiceItems: priceData,
                                  onChange: (selected) {
                                    setState(() {
                                      _price = selected.title.toString();
                                      ref
                                          .read(selectedPriceRangeProvider
                                              .notifier)
                                          .state = selected.value.toString();
                                      _priceDropdownSearchKey.currentState
                                          ?.clear();
                                    });
                                    print(_price);
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
                                      subtitle: Text(_price.toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SmartSelect<String>.multiple(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'AMENITIES',
                                  selectedValue: _amenities,
                                  choiceItems: amenitiesData,
                                  placeholder: 'Select One or More',
                                  onChange: (selected) {
                                    setState(() {
                                      _amenities = selected.value;
                                      ref
                                          .read(selectedAmenitiesProvider
                                              .notifier)
                                          .state = selected.value;
                                      _amenitiesDropdownSearchKey.currentState
                                          ?.clear();
                                    });
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            state.title.toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontFamily: "verdana_regular",
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          subtitle: Text(_amenities.join(", ")),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down),
                                          onTap: state.showModal,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SmartSelect<String>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'RATINGS',
                                  selectedValue: _ratings,
                                  choiceItems: ratingsData,
                                  onChange: (selected) {
                                    setState(() {
                                      _ratings = selected.title.toString();
                                      ref
                                          .read(selectedRatingProvider.notifier)
                                          .state = selected.value.toString();
                                      _priceDropdownSearchKey.currentState
                                          ?.clear();
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
                                      subtitle: Text(_ratings.toString()),
                                      trailing:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onTap: state.showModal,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
