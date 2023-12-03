import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/reviews/reviews.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';

final reviewNameProvider = StateProvider<String>((ref) => '');
final reviewEmailProvider = StateProvider<String>((ref) => '');
final reviewMessageProvider = StateProvider<String>((ref) => '');
final reviewRatingProvider = StateProvider<String>((ref) => '');
final tempReviewsProvider = StateProvider<List<Reviews>>((ref) => []);

showReviewForm(BuildContext context, WidgetRef ref, String? replyId,
    {required String userId,
    required String listingId,
    required dynamic item}) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      final controller = ref.watch(postControllerProvider);
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "Add Review",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {Navigator.pop(context)},
                        child: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          readOnly: true,
                          initialValue:
                              '${ref.read(userProvider).user!.firstname}  ${ref.read(userProvider).user!.lastname ?? ''}',
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(reviewNameProvider.notifier).state = value;
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
                            hintText: "This name will appear on your review.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Name',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          readOnly: true,
                          initialValue:
                              ref.read(userProvider).user!.email ?? '',
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(reviewEmailProvider.notifier).state =
                                value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            //add prefix icon
                            prefixIcon: const Icon(
                              Icons.mail_outline_rounded,
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
                            hintText: "This email will appear on your review.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          validator: null,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          // minLines: 3,
                          maxLines: 6,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(reviewMessageProvider.notifier).state =
                                value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            //add prefix icon
                            prefixIcon: const Icon(
                              Icons.description_outlined,
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
                            hintText: "Write your review here.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Review',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: RatingBar.builder(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            ref.read(reviewRatingProvider.notifier).state =
                                rating.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      )
                    ],
                  ),
                )),
                // Adding a footer button
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity, // Full width
                    child: ElevatedButton(
                      onPressed: () async {
                        ref
                            .read(singleListingViewStateProvider.notifier)
                            .state = const AsyncValue.loading();
                        var formDetails = {
                          "id": userId,
                          "listing_id": listingId,
                          "reply_id": replyId,
                          "name":
                              '${ref.read(userProvider).user!.firstname}  ${ref.read(userProvider).user!.lastname ?? ''}',
                          "email": ref.read(userProvider).user!.email,
                          "message": ref.read(reviewMessageProvider),
                          "rating": ref.read(reviewRatingProvider),
                        };
                        Navigator.pop(context);
                        await controller.reviewAdd(formDetails, listingId);

                        // if (ref.read(isLoadingProvider) == true) {
                        // ref
                        //     .read(singleListingViewStateProvider.notifier)
                        //     .state =
                        // const AsyncValue.data(
                        //     "Successfully submitted your review.");
                        // router.push(SearchSingleView(
                        //     item: ref
                        //         .watch(findItemProvider)
                        //         .where((element) =>
                        //             listingId.toString() ==
                        //             element.id.toString())
                        //         .first,
                        //     type: "all"));
                        // }
                      },
                      child: const Text('Add Review'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
