import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';

final postControllerProvider =
    Provider((ref) => PostData(ref, ref.read(dioClientProvider)));

class PostData {
  final Ref ref;
  final DioClient _dioClient;
  PostData(this.ref, this._dioClient);

  Future addNewListing(newListing) async {
    try {
      print(newListing);
      final res = await _dioClient.post(
          'http://viwahaweb.nikhilaholdings.lk/api/listings/add_listing',
          data: newListing);
      ref.read(isLoadingAddListingProvider.notifier).state = false;
      ref.watch(appRouterProvider).push(const HomePage());
      print("DONEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
      return res.data;
    } catch (e) {
      ref.read(isLoadingAddListingProvider.notifier).state = false;
      rethrow;
    }
  }

  Future imageUpload(File image, String name) async {
    var formData = FormData.fromMap({
      'userId': "8",
      'gallery_images':
          await MultipartFile.fromFile(image.path, filename: name),
    });
    try {
      final res = await _dioClient.post(
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
        'http://viwahaweb.nikhilaholdings.lk/api/listings/upload_image',
        data: formData,
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
