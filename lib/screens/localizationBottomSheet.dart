import 'dart:ui';

import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

List<String> lngItem = ['en', 'si', 'ta'];
Future<void>? changeLng(BuildContext context, String lng, WidgetRef ref) async {
  final appRouter = ref.watch(appRouterProvider);
  context.setLocale(Locale(lng));
  Navigator.pop(context);

  appRouter.push(const HomePage());
}

localizationBottomSheet(BuildContext context, WidgetRef ref) {
  showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Colors.white),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Choose your preferred language",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: const Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                        ListView.builder(
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: lngItem.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  changeLng(
                                      context, lngItem[index].toString(), ref);
                                },
                                child: cardContent(
                                  lngItem[index].toString(),
                                ),
                              );
                            })
                      ])),
                ],
              ),
            ),
          );
        });
      });
}

Widget cardContent(String lng) {
  return Container(
    height: 40,
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(lng.toString(),
        //     style: const TextStyle(color: Colors.grey, fontSize: 16)),
        Text(
          lng == 'en'
              ? 'English'
              : lng == 'si'
                  ? 'සිංහල'
                  : 'தமிழ்',
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        // CountryFlag.fromCountryCode(
        //   lng == 'en'
        //       ? 'GB'
        //       : lng == 'si'
        //           ? 'LK'
        //           : 'IN',
        //   height: 35,
        //   width: 35,
        //   borderRadius: 25,
        // )
      ],
    ),
  );
}
