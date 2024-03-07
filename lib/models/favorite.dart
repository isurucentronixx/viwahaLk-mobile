// ignore_for_file: unnecessary_import, library_private_types_in_public_api

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/services/functions.dart';

import '../appColor.dart';

class FavoriteIcon extends ConsumerStatefulWidget {
  final String listingId;
  final bool isFav;
  const FavoriteIcon(this.listingId, this.isFav, {super.key});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends ConsumerState<FavoriteIcon> {
  bool isFavorite = false;
  @override
  void initState() {
    // TODO: implement initState

    if (widget.isFav) {
      isFavorite = true;
      if (!ref.read(tempFavProvider).contains(widget.listingId.toString())) {
        ref.read(tempFavProvider).add(widget.listingId.toString());
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(postControllerProvider);

    return GestureDetector(
        onTap: () {
          if (ref.watch(isloginProvider)) {
            setState(() {
              isFavorite = !isFavorite;
              if (isFavorite) {
                ref.read(tempFavProvider).add(widget.listingId.toString());
              } else {
                ref.read(tempFavProvider).remove(widget.listingId.toString());
              }

              controller.addFavorite(widget.listingId).then((value) => {
                    ref.refresh(favListingProvider),
                    (ScaffoldMessenger.of(context))
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Success!',
                          message: value['responseMsg'],
                          inMaterialBanner: true,
                          contentType: ContentType.success,
                          color: const Color(0xff21B6A8),
                        ),
                      )),
                  });
            });
          } else {
            (ScaffoldMessenger.of(context))
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Warning!',
                  message: "please login and make your changes",
                  inMaterialBanner: true,
                  contentType: ContentType.warning,
                ),
              ));
          }
        },
        child: ref.watch(tempFavProvider).contains(widget.listingId.toString())
            ? const Icon(
                Icons.favorite,
                color: ViwahaColor.primary,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.white,
                // weight: 400,
                // shadows: <Shadow>[
                //   Shadow(
                //       color: Colors.white,
                //       blurRadius: 2.0,
                //       offset: Offset.zero),
                //   Shadow(
                //       color: Colors.white,
                //       blurRadius: 2.0,
                //       offset: Offset.zero),
                //   Shadow(
                //       color: Colors.white,
                //       blurRadius: 2.0,
                //       offset: Offset.zero),
                //   Shadow(
                //       color: Colors.white, blurRadius: 2.0, offset: Offset.zero)
                // ],
              ));
  }
}
