import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/latest_items/latest.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/screens/single_page/single_page_content/single_page_content.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import '../../models/menu_item.dart';

@RoutePage()
class SearchSingleView extends ConsumerStatefulWidget {
  final SearchResultItem? item;
  final String? type;
  const SearchSingleView(this.item, this.type, {super.key});

  @override
  _searchSingleViewState createState() => _searchSingleViewState();
}

class _searchSingleViewState extends ConsumerState<SearchSingleView> {
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   _searchController.addListener(_onSearchChanged);
  //   filteredItems.addAll(items);
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }

  void _onSearchChanged() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(singleListingViewStateProvider);
    ref.listen<AsyncValue>(singleListingViewStateProvider, (_, state) {
      state.whenData((items) {
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Status!',
            message: items,
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: ViwahaColor.primary,
          ),
        );
        (items == null ? null : ScaffoldMessenger.of(context))!
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      });
    });
    return LoadingOverlay(
      isLoading: state.maybeWhen(loading: () => true, orElse: () => false),
      color: Colors.white,
      child: Scaffold(
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
          title: Text(widget.item!.title.toString()),
        ),
        drawer: const DrawerMenu(),
        body: ref.watch(isDeletingListProvider)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SliderView(
                        widget.item!.images.toString(), widget.type.toString()),
                    const SizedBox(height: 20),
                    SingleItemOverview(
                        widget.item!.datetime.toString(),
                        widget.item!.location.toString(),
                        widget.item!.title.toString(),
                        widget.item!.views.toString(),
                        widget.type.toString(),
                        widget.item!.id.toString(),
                        widget.item),
                    // SingleItemAmenities(widget.item!.amenities.toString()),
                    SingleItemDescription(widget.item!.description.toString()),
                    SingleItemContactInfo(
                        widget.item!.phone.toString(),
                        widget.item!.whatsapp.toString(),
                        widget.item!.address.toString(),
                        widget.item!.email.toString()),
                    SingleItemMap(widget.item!.address.toString()),
                    const SingleItemLatest('topListing')
                  ],
                ),
              ),
      ),
    );
  }
}
