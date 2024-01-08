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
import 'package:viwaha_lk/models/reviews/reviews.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/single_page/popup/review_popup.dart';

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
          const AsyncValue.data("Successfully published your listing.");
      ref.watch(appRouterProvider).push(const MyListingPage());
      return res.data;
    } catch (e) {
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data(
              "Unsuccessfuly published your listing. please try again!");
      ref.read(addListingViewStateProvider.notifier).state =
          const AsyncValue.data(null);

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
          const AsyncValue.data("Successfully updated your listing.");

      ref.refresh(myListingProvider);
      ref.watch(appRouterProvider).push(const MyListingPage());
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
          const AsyncValue.data("Successfully updated your profile.");
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const ProfilePage());
      return res.data;
    } catch (e) {
      ref.read(profileViewStateProvider.notifier).state =
          const AsyncValue.data("Unsuccessfully updated your profile.");
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
          const AsyncValue.data("Successfully changed your password.");
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data(null);
      ref.watch(appRouterProvider).push(const ProfilePage());
      return res.data;
    } catch (e) {
      ref.read(changePasswordViewStateProvider.notifier).state =
          const AsyncValue.data("Failed. Please try again.");
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
          'https://viwahaapp.viwaha.lk/api/listings/delete?listing_id=$id');
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfully deleted your listing.");

      ref.refresh(myListingProvider);
      ref.watch(appRouterProvider).push(const MyListingPage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");

      rethrow;
    }
  }

  Future boostMyListing(id) async {
    try {
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/request_boost?listing_id=$id');
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfully boosted your listing.");
      ref.refresh(myListingProvider);
      ref.watch(appRouterProvider).push(const MyListingPage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");

      rethrow;
    }
  }

  Future premiumMyListing(id, XFile image, String name) async {
    var formData = FormData.fromMap({
      'listing_id': id,
      'image': await MultipartFile.fromFile(image.path, filename: name),
    });
    try {
      final res = await _dioClient.post(
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
        'https://viwahaapp.viwaha.lk/api/listings/request_premium',
        data: formData,
      );
      ref.refresh(premiumBillNameProvider);
      ref.refresh(myListingProvider);
      ref.refresh(premiumBillProvider);

      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Successfully premium your listing.");
      ref.watch(appRouterProvider).push(const MyListingPage());
      return res.data;
    } catch (e) {
      ref.read(myListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");
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
          const AsyncValue.data("Successfully submitted your request.");

      return res.data;
    } catch (e) {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");
      rethrow;
    }
  }

  Future reviewAdd(review, listingId) async {
    try {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.loading();
      final res = await _dioClient.post(
          'https://viwahaapp.viwaha.lk/api/listings/add_review',
          data: review);

      if (res.data['responseCode'] == "1") {
        ref.refresh(reviewsProvider);
        ref.read(singleListingViewStateProvider.notifier).state =
            const AsyncValue.data("Successfully submitted your review.");
      }

      return res.data;
    } catch (e) {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");
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

      return res.data;
    } catch (e) {
      ref.read(singleListingViewStateProvider.notifier).state =
          const AsyncValue.data("Requesting failed");
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

  Future isDuplicate(String? title, String? keyWord) async {
    try {
      final res = await _dioClient.get(
          'https://viwahaapp.viwaha.lk/api/listings/duplicate?field=$title&keyword=$keyWord');
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
