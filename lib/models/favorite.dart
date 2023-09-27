// ignore_for_file: unnecessary_import, library_private_types_in_public_api

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

            controller.addFavorite(widget.listingId).then((value) => {
                  print('ADDED......'),
                  
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

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.success,
                        color: ViwahaColor.primary,
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

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.success,
                color: ViwahaColor.primary,
              ),
            ));
        }
      },
      child: Icon(
        Icons.favorite,
        color: isFavorite ? ViwahaColor.primary : Colors.white,
      ),
    );
  }
}
