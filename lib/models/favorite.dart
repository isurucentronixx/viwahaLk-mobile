// ignore_for_file: unnecessary_import, library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/services/functions.dart';

import '../appColor.dart';

class FavoriteIcon extends ConsumerStatefulWidget {
  final String listingId;
  const FavoriteIcon(this.listingId, {super.key});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends ConsumerState<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(postControllerProvider);
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;

          controller.addFavorite(widget.listingId).then((value) => {
                print('ADDED......'),
              });
        });
      },
      child: Icon(
        Icons.favorite,
        color: isFavorite ? ViwahaColor.primary : Colors.white,
      ),
    );
  }
}
