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
import '../../models/menu_item.dart';
import '../../models/releted_items/releted.dart';

@RoutePage()
class SingleView extends ConsumerStatefulWidget {
  final Vendor? vendor;
  final TopListing? topListing;
  final String? type;
  const SingleView(this.vendor, this.topListing, {super.key, this.type});

  @override
  _SingleViewState createState() => _SingleViewState();
}

class _SingleViewState extends ConsumerState<SingleView> {
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    filteredItems.addAll(items);
  }

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
        title: Text(widget.vendor?.title ?? widget.topListing!.title!),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SliderView(
              widget.vendor?.images.toString() ??
                  widget.topListing!.images.toString(),
              widget.type.toString(),
              widget.vendor?.main_category.toString() ??
                  widget.topListing!.main_category.toString(),
            ),
            const SizedBox(height: 20),
            SingleItemOverview(
                widget.vendor?.datetime.toString() ??
                    widget.topListing!.datetime.toString(),
                widget.vendor?.location.toString() ??
                    widget.topListing!.location.toString(),
                widget.vendor?.title.toString() ??
                    widget.topListing!.title.toString(),
                widget.vendor?.views.toString() ??
                    widget.topListing!.views!.toString(),
                widget.type.toString(),
                widget.vendor?.id.toString() ??
                    widget.topListing!.id!.toString(),
                const SearchResultItem()),
            '${widget.vendor?.main_category.toString() ?? widget.topListing!.main_category!.toString()}' ==
                    "Proposal"
                ? SingleItemProposal(widget.vendor ?? widget.topListing)
                : '${widget.vendor?.amenities.toString() ?? widget.topListing!.amenities!.toString()}' !=
                        ""
                    ? SingleItemAmenities(widget.vendor?.amenities.toString() ??
                        widget.topListing!.amenities.toString())
                    : const SizedBox(),
            SingleItemDescription(
                widget.vendor?.description.toString() ??
                    widget.topListing!.description.toString(),
                widget.vendor?.main_category.toString() ??
                    widget.topListing!.main_category.toString()),
            SingleItemContactInfo(
              widget.vendor?.main_category.toString() ??
                  widget.topListing!.main_category.toString(),
              widget.vendor?.phone.toString() ??
                  widget.topListing!.phone.toString(),
              widget.vendor?.phone.toString() ??
                  widget.topListing!.phone.toString(),
              widget.vendor?.address.toString() ??
                  widget.topListing!.address.toString(),
              widget.vendor?.email.toString() ??
                  widget.topListing!.email.toString(),
            ),
            SingleItemMap(widget.vendor?.address.toString() ??
                widget.topListing!.address.toString()),
            SingleItemLatest(widget.vendor != null ? 'vendor' : 'topListing')
          ],
        ),
      ),
    );
  }
}
