import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

@RoutePage()
class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  List<S2Choice<SubCategories>>? subCat2 = [];
  List<S2Choice<Location>>? location2 = [];

  SubCategories _subCat = const SubCategories(
    sub_category: 'Select one',
  );
  Location _location = const Location(
    location_en: 'Select one',
  );
  final GlobalKey<DropdownSearchState<String>> _categoryDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  final GlobalKey<DropdownSearchState<String>> _locationDropdownSearchKey =
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More Filters"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SmartSelect<SubCategories>.single(
                  modalFilterAuto: true,
                  modalFilter: true,
                  title: LocaleKeys.all_category.tr(),
                  selectedValue: _subCat,
                  choiceItems: subCat2,
                  onChange: (selected) {
                    setState(() {
                      ref.refresh(selectedMainLocationProvider);
                      ref.read(isSearchingProvider.notifier).state = true;
                      _categoryDropdownSearchKey.currentState?.clear();
                      ref.read(selectedSubCategoryProvider.notifier).state =
                          selected.value;

                      AutoRouter.of(context).push(const SearchingResultsPage());
                    });
                  },
                  modalType: S2ModalType.bottomSheet,
                  tileBuilder: (context, state) {
                    return ElevatedButton.icon(
                        onPressed: () => state.showModal(),
                        icon: const Icon(Icons.category),
                        label: Text(LocaleKeys.all_category.tr()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SmartSelect<Location>.single(
                  modalFilterAuto: true,
                  modalFilter: true,
                  title: LocaleKeys.all_location.tr(),
                  selectedValue: _location,
                  choiceItems: location2,
                  onChange: (selected) {
                    setState(() {
                      ref.refresh(selectedSubCategoryProvider);
                      ref.read(isSearchingProvider.notifier).state = true;
                      _locationDropdownSearchKey.currentState?.clear();
                      ref.read(selectedMainLocationProvider.notifier).state =
                          selected.value.location_en!;

                      AutoRouter.of(context).push(const SearchingResultsPage());
                    });
                  },
                  modalType: S2ModalType.bottomSheet,
                  tileBuilder: (context, state) {
                    return ElevatedButton.icon(
                        onPressed: () => state.showModal(),
                        icon: const Icon(Icons.location_on),
                        label: Text(LocaleKeys.all_location.tr()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
