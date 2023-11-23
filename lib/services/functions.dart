import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/core/network/dio_client.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/features/login/login_provider.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/my_listings/my_listings.dart';

final postControllerProvider =
    Provider((ref) => PostData(ref, ref.read(dioClientProvider)));

class PostData {
  final Ref ref;
  final DioClient _dioClient;
  PostData(this.ref, this._dioClient);

  Future addNewListing(newListing) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/add_listing',
          data: newListing);
      ref.refresh(myListingProvider);
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data("Listing submitted successfully.");
      
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly published your listing.");
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      print(e);
      rethrow;
    }
  }

  Future editListing(newListing, id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/edit_listing?listing_id=$id',
          data: newListing);
      ref.refresh(myListingProvider);
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfuly updated your listing.");
      // ref.read(addListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly updated your listing.");
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      rethrow;
    }
  }

  Future editMyProfile(editedDetails) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/user/update_profile',
          data: editedDetails);
      ref.refresh(loginProvider);
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data("Successfuly updated your profile.");
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly updated your profile.");
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      rethrow;
    }
  }

  Future changePassword(passwords) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/auth/change_password',
          data: passwords);
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data("Successfuly changed your password.");
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly changed your password.");
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      rethrow;
    }
  }

  Future imageUpload(XFile image, String name, String type) async {
    var formData = FormData.fromMap({
      'userId': ref.watch(userProvider).user!.id,
      type != 'main' ? 'gallery_images' : 'file1':
          await MultipartFile.fromFile(image.path, filename: name),
    });
    try {
      final res = await _dioClient.post(
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
        'https://viwahaapp.viwaha.lk/api/listings/upload_image',
        data: formData,
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future profileImageUpload(File image, String name) async {
    var formData = FormData.fromMap({
      'userId': ref.watch(userProvider).user!.id,
      'image': await MultipartFile.fromFile(image.path, filename: name),
    });
    try {
      final res = await _dioClient.post(
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
        'https://viwahaapp.viwaha.lk/api/user/update_profile_image',
        data: formData,
      );
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future deleteMyListing(id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/delete?listing_id=${id}');
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfuly deleted your listing.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future boostMyListing(id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/request_boost?listing_id=${id}');
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfuly boosted your listing.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfuly.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future premiumMyListing(id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/request_premium',
          data: {
            "listing_id": id,
            "image": ref.read(premiumBillNameProvider),
          });
      ref.refresh(premiumBillNameProvider);
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requested premium your listing.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const HomePage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed.");
      // ref.read(myListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future requestQuote(quote) async {
    try {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.loading();
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/profile/post_message',
          data: quote);
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Your request has been sent.");

      return res.data;
    } catch (e) {
      // ref.read(isDeletingListProvider.notifier).state = false;
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed.");
      // ref.read(singleListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future reviewAdd(review) async {
    try {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.loading();
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/add_review',
          data: review);
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Your review has been published.");
      // ref.read(singleListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      return res.data;
    } catch (e) {
      // ref.read(isDeletingListProvider.notifier).state = false;
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed.");
      // ref.read(singleListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future reportListing(data) async {
    try {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.loading();
      final res = await _dioClient
          .post('https://viwahaapp.viwaha.lk/api/listings/report', data: data);
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfully submited report listing.");
      // ref.read(singleListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);

      return res.data;
    } catch (e) {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed.");
      // ref.read(singleListingViewStateProvider.notifier).state =
      //     const AsyncValue.data(null);
      rethrow;
    }
  }

  Future addFavorite(id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/add_rem_fav_listings',
          data: {
            "listing_id": id.toString(),
            "id": ref.read(userProvider).user!.id.toString(),
          });
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
