import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/reviews/reviews.dart';
import 'package:viwaha_lk/screens/latest_items/latest.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/screens/other_latest_items/other_latest.dart';
import 'package:viwaha_lk/screens/single_page/single_page_content/single_page_content.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

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
  bool isVendor = false;
  String googlePlace = "";
  List<Reviews> reviews = [];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    filteredItems.addAll(items);
    if (widget.vendor != null) {
      setState(() {
        isVendor = true;
      });
    }

    setState(() {
      if (isVendor) {
        if (widget.vendor!.googleplace == '') {
          googlePlace =
              '${widget.vendor!.location},${widget.vendor!.main_location}';
        } else if (widget.vendor!.googleplace == null) {
          googlePlace =
              '${widget.vendor!.location},${widget.vendor!.main_location}';
        } else {
          googlePlace = widget.vendor!.googleplace!;
        }

        reviews.addAll(widget.vendor!.reviews!);
      } else {
        if (widget.topListing!.googleplace == '') {
          googlePlace =
              '${widget.topListing!.location},${widget.topListing!.main_location}';
        } else if (widget.topListing!.googleplace == null) {
          googlePlace =
              '${widget.topListing!.location},${widget.topListing!.main_location}';
        } else {
          googlePlace = widget.topListing!.googleplace!;
        }
        reviews.addAll(widget.topListing!.reviews!);
      }
    });
  }

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
        bool isSuccessfull =
            items.toString() == "Requesting failed" ? false : true;
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: isSuccessfull ? 'Successfully' : 'Unsuccessfully',
            message: items,
            inMaterialBanner: true,
            contentType: ContentType.success,
            color: isSuccessfull ? const Color(0xff21B6A8) : Colors.red,
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
          backgroundColor: ViwahaColor.primary,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomePage());
                    },
                    child: SizedBox(
                      width: 100,
                      child: Assets.lib.assets.images.logo.image(),
                    ),
                  ),
                ),
              ],
            ),
          ],
          title: Text(widget.vendor?.title ?? widget.topListing!.title!),
        ),
        // drawer: const DrawerMenu(),
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
                  widget.vendor ?? widget.topListing,
                  widget.vendor?.boosted.toString() ??
                      widget.topListing!.boosted.toString()),
              (widget.vendor?.main_category.toString() ??
                          widget.topListing!.main_category!.toString()) ==
                      "Proposal"
                  ? SingleItemProposal(widget.vendor ?? widget.topListing)
                  : (widget.vendor?.amenities.toString() ??
                              widget.topListing!.amenities!.toString()) !=
                          ""
                      ? SingleItemAmenities(
                          widget.vendor?.amenities.toString() ??
                              widget.topListing!.amenities.toString())
                      : const SizedBox(),
              SingleItemDescription(
                  widget.vendor?.description.toString() ??
                      widget.topListing!.description.toString(),
                  widget.vendor?.main_category.toString() ??
                      widget.topListing!.main_category.toString(),
                  widget.vendor?.video.toString() ??
                      widget.topListing!.video.toString()),
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
                widget.vendor?.facebook.toString() ??
                    widget.topListing!.facebook.toString(),
                widget.vendor?.whatsapp.toString() ??
                    widget.topListing!.whatsapp.toString(),
                widget.vendor?.instagram.toString() ??
                    widget.topListing!.instagram.toString(),
                widget.vendor?.linkedin.toString() ??
                    widget.topListing!.linkedin.toString(),
                widget.vendor?.user_id.toString() ??
                    widget.topListing!.user_id.toString(),
              ),
              SingleItemOpeningHours(widget.vendor ?? widget.topListing),
              SingleItemMap(googlePlace),
              if (reviews.isNotEmpty)
                SingleItemReviews(
                    reviews,
                    widget.vendor?.average_rating.toString() ??
                        widget.topListing!.average_rating.toString(),
                    widget.vendor?.id.toString() ??
                        widget.topListing!.id.toString(),
                    ref,
                    widget.vendor ?? widget.topListing),
              SingleItemLatest(widget.vendor != null ? 'vendor' : 'topListing'),
              SingleItemOtherLatest(
                  widget.vendor != null ? 'vendor' : 'topListing')
            ],
          ),
        ),
      ),
    );
  }
}
