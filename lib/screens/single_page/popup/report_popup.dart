import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';

final reportMainReasonProvider = StateProvider<String>((ref) => '');
final reportReasonProvider = StateProvider<String>((ref) => '');

showReportingForm(BuildContext context, WidgetRef ref,
    {required String userId, required String listingId}) {
  final GlobalKey<DropdownSearchState<String>> _reportingDropdownSearchKey =
      GlobalKey<DropdownSearchState<String>>();
  List<String> reasonCat = [
    "False information",
    "Wrong contact number",
    "Wrong address",
    "Wrong company name",
    "Wrong opening hours",
    "Poor customer service",
    "Unable to connect",
    "Other reason"
  ];
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
                        "Report Listing",
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
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownSearch<String>(
                          key: _reportingDropdownSearchKey,
                          popupProps: PopupProps.menu(
                            emptyBuilder: (context, searchEntry) =>
                                const Center(
                                    child: Center(
                              child: CircularProgressIndicator(),
                            )),
                            showSearchBox: true,
                            showSelectedItems: true,
                          ),
                          items: reasonCat,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Reason",
                              hintText: "Select a reason",
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
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            ref.read(reportMainReasonProvider.notifier).state =
                                value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          maxLines: 6,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(reportReasonProvider.notifier).state =
                                value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
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
                            hintText: "Write your reasons here.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Reason',
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
                      onPressed: () {
                        ref
                            .read(singleListingViewStateProvider.notifier)
                            .state = const AsyncValue.loading();
                        var formDetails = {
                          "user_id": userId,
                          "listing_id": listingId,
                          "reason": ref.read(reportReasonProvider),
                          "main_reason": ref.read(reportMainReasonProvider),
                        };
                        Navigator.pop(context);
                        controller.reportListing(formDetails);
                      },
                      child: const Text('Submit'),
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
