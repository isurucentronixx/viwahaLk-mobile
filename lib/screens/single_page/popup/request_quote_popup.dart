import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';
import 'package:viwaha_lk/services/functions.dart';

final quoteNameProvider = StateProvider<String>((ref) => '');
final quoteEmailProvider = StateProvider<String>((ref) => '');
final quoteMessageProvider = StateProvider<String>((ref) => '');
final quotePhoneProvider = StateProvider<String>((ref) => '');
final quoteDateProvider = StateProvider<String>((ref) => '');
final quoteGuestProvider = StateProvider<String>((ref) => '');

showRequestQuoteForm(BuildContext context, WidgetRef ref,
    {required String userId, required String listingId}) {
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
                        "Request Quote",
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(quoteNameProvider.notifier).state = value;
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
                            hintText: "This name will appear on your request.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'First & Last Name',
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(quoteEmailProvider.notifier).state = value;
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
                            hintText: "This email will appear on your request.",
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
                        child: TextFormField(
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(quotePhoneProvider.notifier).state = value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            //add prefix icon
                            prefixIcon: const Icon(
                              Icons.phone,
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
                            hintText:
                                "This number will appear on your request.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Phone Number',
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
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          focusNode: FocusNode(canRequestFocus: false),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            ref.read(quoteGuestProvider.notifier).state = value;
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            //add prefix icon
                            prefixIcon: const Icon(
                              Icons.people_alt_outlined,
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
                            hintText: "This count will appear on your request.",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                            ),
                            labelText: 'Guest',
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
                            ref.read(quoteMessageProvider.notifier).state =
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
                            labelText: 'Message',
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
                          "name": ref.read(quoteNameProvider),
                          "email": ref.read(quoteEmailProvider),
                          "message": ref.read(quoteMessageProvider),
                          "phone": ref.read(quotePhoneProvider),
                          "date": ref.read(quoteDateProvider),
                          "guest": ref.read(quoteGuestProvider),
                        };
                        Navigator.pop(context);
                        controller.requestQuote(formDetails);
                        // .then((value) => {
                        //       (ScaffoldMessenger.of(context))
                        //         ..hideCurrentSnackBar()
                        //         ..showSnackBar(SnackBar(
                        //           elevation: 0,
                        //           behavior: SnackBarBehavior.floating,
                        //           backgroundColor: Colors.transparent,
                        //           content: AwesomeSnackbarContent(
                        //             title: 'Success!',
                        //             message: value['responseMessage'],
                        //             inMaterialBanner: true,

                        //             /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        //             contentType: ContentType.success,
                        //             color: ViwahaColor.primary,
                        //           ),
                        //         )),
                        //     });
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
