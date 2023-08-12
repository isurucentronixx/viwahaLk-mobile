import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
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
      final res = await _dioClient.post(
          'http://viwahaweb.nikhilaholdings.lk/api/listings/add_listing',
          data: newListing);
      ref.refresh(myListingProvider);
      ref.read(isLoadingAddListingProvider.notifier).state = false;
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(isLoadingAddListingProvider.notifier).state = false;
      rethrow;
    }
  }

  Future editMyProfile(editedDetails) async {
    print(editedDetails);
    try {
      final res = await _dioClient.post(
          'http://viwahaweb.nikhilaholdings.lk/api/user/update_profile',
          data: editedDetails);
      ref.refresh(loginProvider);
      ref.read(isLoadingEditProfileProvider.notifier).state = false;
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(isLoadingEditProfileProvider.notifier).state = false;
      rethrow;
    }
  }

  Future changePassword(passwords) async {
    try {
      final res = await _dioClient.post(
          'http://viwahaweb.nikhilaholdings.lk/api/auth/change_password',
          data: passwords);
      ref.read(isLoadingChangePasswordProvider.notifier).state = false;
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(isLoadingChangePasswordProvider.notifier).state = false;
      rethrow;
    }
  }

  Future imageUpload(File image, String name) async {
    var formData = FormData.fromMap({
      'userId': ref.watch(userProvider).user!.id,
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
