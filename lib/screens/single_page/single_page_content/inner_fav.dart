import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/services/functions.dart';

class InnerFavoriteIcon extends ConsumerStatefulWidget {
  final String listingId;
  final bool isFav;
  const InnerFavoriteIcon(this.listingId, this.isFav, {super.key});

  @override
  _InnerFavoriteIconState createState() => _InnerFavoriteIconState();
}

class _InnerFavoriteIconState extends ConsumerState<InnerFavoriteIcon> {
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
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: isFavorite
            ? const Icon(
                Icons.favorite,
                color: ViwahaColor.primary,
                size: 10,
              )
            : const Icon(
                Icons.favorite_border,
                color: ViwahaColor.primary,
                size: 20,
              ),
      ),
    );
  }
}
