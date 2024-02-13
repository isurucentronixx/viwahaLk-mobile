import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
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
      child: Padding(
          padding: const EdgeInsets.all(4.0),
          child:
              // isFavorite
              ref.watch(tempFavProvider).contains(widget.listingId.toString())
                  ? const Icon(
                      Icons.favorite,
                      color: ViwahaColor.primary,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: ViwahaColor.primary,
                      weight: 400,
                      shadows: <Shadow>[
                        Shadow(
                            color: ViwahaColor.primary,
                            blurRadius: 1.0,
                            offset: Offset.zero),
                        Shadow(
                            color: ViwahaColor.primary,
                            blurRadius: 1.0,
                            offset: Offset.zero),
                        Shadow(
                            color: ViwahaColor.primary,
                            blurRadius: 1.0,
                            offset: Offset.zero),
                        Shadow(
                            color: ViwahaColor.primary,
                            blurRadius: 1.0,
                            offset: Offset.zero)
                      ],
                    )

          // ref.watch(tempFavProvider).contains(widget.listingId)
          //     ? const Icon(
          //         Icons.favorite,
          //         color: ViwahaColor.primary,
          //         size: 20,
          //       )
          //     : isFavorite
          //         ? ref.watch(tempFavRemoveProvider).contains(widget.listingId)
          //             ? const Icon(
          //                 Icons.favorite_border,
          //                 color: ViwahaColor.primary,
          //                 size: 20,
          //               )
          //             : const Icon(
          //                 Icons.favorite,
          //                 color: ViwahaColor.primary,
          //                 size: 20,
          //               )
          //         : const Icon(
          //             Icons.favorite_border,
          //             color: ViwahaColor.primary,
          //             size: 20,
          //           ),
          ),
    );
  }
}
