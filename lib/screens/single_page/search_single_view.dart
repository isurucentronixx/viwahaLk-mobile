import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/reviews/reviews.dart';
import 'package:viwaha_lk/screens/latest_items/latest.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/screens/other_latest_items/other_latest.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';
import 'package:viwaha_lk/screens/single_page/single_page_content/single_page_content.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';

@RoutePage()
class SearchSingleView extends ConsumerStatefulWidget {
  final SearchResultItem? item;
  final String? type;
  const SearchSingleView(this.item, this.type, {super.key});

  @override
  _searchSingleViewState createState() => _searchSingleViewState();
}

class _searchSingleViewState extends ConsumerState<SearchSingleView> {
  List<Reviews> reviews = [];
  List<String> items = ['Car', 'Photography'];
  List<String> filteredItems = [];

  final TextEditingController _searchController = TextEditingController();
  String googlePlace = "";
  void _onSearchChanged() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchText))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if (widget.item!.googleplace == '') {
        googlePlace = '${widget.item!.location},${widget.item!.main_location}';
      } else if (widget.item!.googleplace == null) {
        googlePlace = '${widget.item!.location},${widget.item!.main_location}';
      } else {
        googlePlace = widget.item!.googleplace!;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    reviews.addAll(ref.watch(reviewsProvider));
    final appRouter = ref.watch(appRouterProvider);
    final picker = ImagePicker();
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
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
          title: Text(widget.item!.title.toString()),
          // title: Text(widget.item!.main_category == "Proposal"
          // ? widget.item!.name.toString()
          // : widget.item!.title.toString())
        ),
        // drawer: const DrawerMenu(),
        body: ref.watch(isDeletingListProvider)
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    widget.item!.main_category.toString() == "Proposal"
                        ? ref.read(userProvider).user?.membership.toString() !=
                                "1"
                            ? GestureDetector(
                                onTap: () {
                                  ref.refresh(membershipBillProvider);
                                  if (ref.read(isloginProvider)) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (stfContext, stfSetState) {
                                            return AlertDialog(
                                              content: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      'Bank Receipt',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    const Text(
                                                      '(Maximum image size 1 Mb)',
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            File image;
                                                            picker
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery,
                                                                    imageQuality:
                                                                        50,
                                                                    maxWidth:
                                                                        800,
                                                                    maxHeight:
                                                                        800)
                                                                .then(
                                                                    (value) => {
                                                                          if (value !=
                                                                              null)
                                                                            {
                                                                              image = File(value.path),
                                                                              stfSetState(
                                                                                () {
                                                                                  ref.watch(membershipBillProvider.notifier).state = value.path;
                                                                                },
                                                                              )
                                                                            }
                                                                        });
                                                          },
                                                          child: Container(
                                                            color: ViwahaColor
                                                                .transparent,
                                                            width: 50,
                                                            height: 50,
                                                            child: Assets
                                                                .lib
                                                                .assets
                                                                .images
                                                                .photography
                                                                .image(),
                                                          ),
                                                        ),
                                                        ref
                                                                .watch(
                                                                    membershipBillProvider)
                                                                .isEmpty
                                                            ? Container(
                                                                width: 150,
                                                                height: 150,
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: ViwahaColor
                                                                            .primary),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(10))),
                                                                child: Assets
                                                                    .lib
                                                                    .assets
                                                                    .images
                                                                    .colorLogo
                                                                    .image(),
                                                              )
                                                            : Container(
                                                                width: 150,
                                                                height: 150,
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        image: Image.file(File(ref.watch(membershipBillProvider)))
                                                                            .image),
                                                                    border: Border.all(
                                                                        color: ViwahaColor
                                                                            .primary),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(10))),
                                                              )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blueGrey),
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: const Text('Upload'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                        });
                                  } else {
                                    appRouter.push(Login(onHome: false));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: ViwahaColor.primary),
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 20),
                                          child: Icon(
                                            Icons.lock_person_outlined,
                                            size: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Get membership to see more details',
                                              textAlign: TextAlign.center,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        //
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                        : const SizedBox(),
                    const SizedBox(height: 20),
                    SliderView(
                        widget.item!.images.toString(),
                        widget.type.toString(),
                        widget.item!.main_category.toString()),
                    SingleItemOverview(
                        widget.item!.datetime.toString(),
                        widget.item!.location.toString(),
                        widget.item!.title.toString(),
                        widget.item!.views.toString(),
                        widget.type.toString(),
                        widget.item!.id.toString(),
                        widget.item,
                        widget.item!.boosted.toString()),
                    widget.item!.main_category == "Proposal"
                        ? SingleItemProposal(widget.item)
                        : widget.item!.amenities.toString() != ""
                            ? SingleItemAmenities(
                                widget.item!.amenities.toString())
                            : const SizedBox(),
                    SingleItemDescription(
                        widget.item!.description.toString(),
                        widget.item!.main_category.toString(),
                        widget.item!.video.toString()),
                    SingleItemContactInfo(
                      widget.item!.main_category.toString(),
                      widget.item!.phone.toString(),
                      widget.item!.whatsapp.toString(),
                      widget.item!.address.toString(),
                      widget.item!.email.toString(),
                      widget.item!.facebook.toString(),
                      widget.item!.whatsapp.toString(),
                      widget.item!.instagram.toString(),
                      widget.item!.linkedin.toString(),
                      widget.item!.user_id.toString(),
                    ),
                    if (widget.item!.main_category.toString() != "Proposal")
                      SingleItemOpeningHours(widget.item!),
                    SingleItemMap(googlePlace),
                    if (reviews.isNotEmpty)
                      SingleItemReviews(
                          reviews,
                          widget.item!.average_rating.toString(),
                          widget.item!.id.toString(),
                          ref,
                          widget.item!),
                    const SingleItemLatest('topListing'),
                    const SingleItemOtherLatest('topListing')
                  ],
                ),
              ),
      ),
    );
  }
}
