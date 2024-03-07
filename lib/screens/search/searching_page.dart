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

@RoutePage()
class SearchingPage extends ConsumerStatefulWidget {
  const SearchingPage({super.key});
  @override
  _SearchingPageState createState() => _SearchingPageState();
}

class _SearchingPageState extends ConsumerState<SearchingPage> {
  List<S2Choice<SubCategories>>? subCat2 = [];
  List<S2Choice<Location>>? location2 = [];

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
          backgroundColor: ViwahaColor.primary,
          title: const Text('Search'),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FloatingActionButton.extended(
              elevation: 0,
              onPressed: () {
                setState(() {
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
                  _price = 'Select One';
                  _orderBy = 'Select One';
                  _sortBy = 'Select One';
                  _ratings = 'Select One';
                  _amenities = ['Select'];
                  _mainLocation = const Location(
                    location_en: 'Select one',
                  );
                  _subLocation = const SubLocation(
                    sub_location_en: 'Select one',
                  );
                  _mainCat = const Categories(
                    category: 'Select one',
                  );
                  _subCat = const SubCategories(
                    sub_category: 'Select one',
                  );

                  subCat2 = [];
                  location2 = [];
                  _textEditingController!.clear();
                });
              },
              label: const Text('Clear'),
              icon: const Icon(Icons.clear_rounded),
            ),
            const SizedBox(
              width: 8,
            ),
            FloatingActionButton.extended(
              elevation: 0,
              onPressed: () {
                setState(() {
                  ref.read(isSearchingProvider.notifier).state = true;
                });
                AutoRouter.of(context).push(const SearchingResultsPage());
              },
              label: const Text('Apply'),
              icon: const Icon(Icons.search),
            )
          ]),
        ),
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: ViwahaColor.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                TextFormField(
                                  scrollPadding: EdgeInsets.zero,
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  controller: _textEditingController,
                                  focusNode: _texrFocusNode,
                                  onChanged: (value) {
                                    ref.read(searchingKeywords.notifier).state =
                                        value.toString();
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Type here to search',
                                    labelStyle:
                                        TextStyle(color: ViwahaColor.primary),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: ViwahaColor.primary,
                                    ),
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
                                title: Align(
                                  alignment: const Alignment(-1.3, 0),
                                  child: Text(
                                    state.title.toString(),
                                    style: const TextStyle(
                                      color: ViwahaColor.primary,
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.location_on_outlined,
                                  color: ViwahaColor.primary,
                                ),
                                subtitle: Align(
                                    alignment: const Alignment(-1.3, 0),
                                    child: Text(
                                        _mainLocation.location_en.toString())),
                                trailing: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ViwahaColor.primary,
                                ),
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
                                      title: Align(
                                        alignment: const Alignment(-1.4, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.location_city_outlined,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                        alignment: const Alignment(-1.3, 0),
                                        child: Text(_subLocation.sub_location_en
                                            .toString()),
                                      ),
                                      trailing: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ViwahaColor.primary,
                                      ),
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
                                title: Align(
                                  alignment: const Alignment(-1.3, 0),
                                  child: Text(
                                    state.title.toString(),
                                    style: const TextStyle(
                                      color: ViwahaColor.primary,
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                leading: const Icon(
                                  Icons.library_books_outlined,
                                  color: ViwahaColor.primary,
                                ),
                                subtitle: Align(
                                    alignment: const Alignment(-1.3, 0),
                                    child: Text(_mainCat.category.toString())),
                                trailing: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ViwahaColor.primary,
                                ),
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
                                      title: Align(
                                        alignment: const Alignment(-1.4, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.list,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                          alignment: const Alignment(-1.3, 0),
                                          child: Text(
                                              _subCat.sub_category.toString())),
                                      trailing: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ViwahaColor.primary,
                                      ),
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
                                border: Border.all(color: ViwahaColor.primary),
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
                                      size: 24,
                                      Icons.filter_list,
                                      color: ViwahaColor.primary,
                                    ),
                                  ),
                                  const Text(
                                    'More Filter',
                                    style:
                                        TextStyle(color: ViwahaColor.primary),
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
                                          color: ViwahaColor.primary,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        AnimatedContainer(
                          height: _currentHeight,
                          width: MediaQuery.of(context).size.width * 0.95,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: ViwahaColor.primary),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                child: SmartSelect<String>.single(
                                  modalFilterAuto: true,
                                  modalFilter: true,
                                  title: 'Sort by',
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
                                      title: Align(
                                        alignment: const Alignment(-1.3, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.sort_by_alpha_outlined,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                          alignment: const Alignment(-1.3, 0),
                                          child: Text(_sortBy.toString())),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ViwahaColor.primary),
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
                                  title: 'Order by',
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
                                      title: Align(
                                        alignment: const Alignment(-1.3, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.sort,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                          alignment: const Alignment(-1.3, 0),
                                          child: Text(_orderBy.toString())),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ViwahaColor.primary),
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
                                  title: 'Price',
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
                                  },
                                  modalType: S2ModalType.bottomSheet,
                                  tileBuilder: (context, state) {
                                    return ListTile(
                                      title: Align(
                                        alignment: const Alignment(-1.3, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.attach_money_sharp,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                          alignment: const Alignment(-1.3, 0),
                                          child: Text(_price.toString())),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ViwahaColor.primary),
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
                                  title: 'Amenities',
                                  selectedValue: _amenities,
                                  choiceItems: amenitiesData,
                                  placeholder: 'Select one or more',
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
                                          title: Align(
                                            alignment: const Alignment(-1.3, 0),
                                            child: Text(
                                              state.title.toString(),
                                              style: const TextStyle(
                                                color: ViwahaColor.primary,
                                                fontSize: 18,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          leading: const Icon(
                                            Icons.emoji_transportation_rounded,
                                            color: ViwahaColor.primary,
                                          ),
                                          subtitle: Align(
                                              alignment:
                                                  const Alignment(-1.3, 0),
                                              child:
                                                  Text(_amenities.join(", "))),
                                          trailing: const Icon(
                                              Icons.keyboard_arrow_down,
                                              color: ViwahaColor.primary),
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
                                  title: 'Ratings',
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
                                      title: Align(
                                        alignment: const Alignment(-1.3, 0),
                                        child: Text(
                                          state.title.toString(),
                                          style: const TextStyle(
                                            color: ViwahaColor.primary,
                                            fontSize: 18,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      leading: const Icon(
                                        Icons.star_border_outlined,
                                        color: ViwahaColor.primary,
                                      ),
                                      subtitle: Align(
                                          alignment: const Alignment(-1.3, 0),
                                          child: Text(_ratings.toString())),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ViwahaColor.primary),
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
