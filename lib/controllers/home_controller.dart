import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/core/network/dio_exceptions.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/models/categories/categories.dart';
import 'package:viwaha_lk/models/image/image.dart';
import 'package:viwaha_lk/models/main_slider/main_slider_model.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';
import 'package:viwaha_lk/models/search/search_result_item.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';
import 'package:viwaha_lk/models/user_dashboard/user_dashboard.dart';
import 'package:viwaha_lk/models/user_dashboard/user_messages.dart';
import 'package:viwaha_lk/models/user_dashboard/user_notifications.dart';
import 'package:viwaha_lk/models/user_dashboard/user_reviews.dart';
import 'package:viwaha_lk/models/vendor_profile/vendor_profile.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/services/home_service.dart';
import 'package:viwaha_lk/models/locations/location.dart';
import 'package:http/http.dart' as http;

final mainImageProvider = StateProvider<String>((ref) => '');
final mainImageNameProvider = StateProvider<String>((ref) => '');
final imageGalleryProvider = StateProvider<List<ImageObject>>((ref) => []);
final imageNameGalleryProvider = StateProvider<List<String>>((ref) => []);

final addListingViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

final profileViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

final changePasswordViewStateProvider =
    StateProvider.autoDispose<AsyncValue>((ref) => const AsyncValue.data(null));

final homeServiceProvider = Provider<HomeService>((ref) {
  return HomeService(ref.read(dioClientProvider));
});

final isLoadingHomeProvider = StateProvider<bool>((ref) {
  return true;
});

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter());

class HomeController {
  final HomeService homeService;

  HomeController(this.homeService);

  Future<List<Vendor>> fetchVendorList(userId) async {
    try {
      final res = await homeService.fetchVendorListApiRequest(userId);

      final vendor = (res as List).map((e) => Vendor.fromJson(e)).toList();
      return vendor;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<TopListing>> fetchTopWeddingList(String userId) async {
    try {
      final res = await homeService.fetchTopWeddingListApiRequest(userId);
      final topListing =
          (res as List).map((e) => TopListing.fromJson(e)).toList();
      return topListing;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<MainSlider>> fetchSliderImagesList() async {
    try {
      final res = await homeService.fetchSliderImagesRequest();
      final sliderImages =
          (res as List).map((e) => MainSlider.fromJson(e)).toList();
      // res as List<String>;
      print(sliderImages);
      return sliderImages;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Categories>> fetchCategoryList() async {
    try {
      final res = await homeService.fetchCategoryListApiRequest();
      final categories =
          (res as List).map((e) => Categories.fromJson(e)).toList();
      return categories;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Location>> fetchLocationList() async {
    try {
      final res = await homeService.fetchLocationListApiRequest();
      final locations = (res as List).map((e) => Location.fromJson(e)).toList();
      return locations;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchSearchResultList(
      String location,
      String category,
      String keyword,
      String userId,
      String filter,
      String price,
      List<String> amenities,
      String order,
      String sort,
      String rating,
      ) async {
    try {
      final res = await homeService.fetchSearchResultListApiRequest(
          location, category, keyword, userId, filter, price, amenities,order,sort,rating);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchAllListing(String userId) async {
    try {
      final res = await homeService.fetchAllListingApiRequest(userId);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchFavListing({required Ref ref}) async {
    try {
      final res = await homeService.fetchFavListingApiRequest(ref: ref);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchMyListing({required Ref ref}) async {
    try {
      final res = await homeService.fetchMyListingApiRequest(ref: ref);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();

      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchCategoryListing(
      String userId, String category) async {
    try {
      final res =
          await homeService.fetchCategoryListingApiRequest(userId, category);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<UserDashboard> fetchUserDashboardCounts(String userId) async {
    try {
      final res = await homeService.fetchUserDashboardCountsApiRequest(userId);
      final result = UserDashboard.fromJson(res);
      return result;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<Message>> fetchUserMessages(String userId) async {
    try {
      final res = await homeService.fetchUserMessagesApiRequest(userId);
      final searchResult =
          (res as List).map((e) => Message.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<UserNotification>> fetchUserNotifications(String userId) async {
    try {
      final res = await homeService.fetchUserNotificationsApiRequest(userId);
      final searchResult =
          (res as List).map((e) => UserNotification.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<UserReviews>> fetchUserReviews(String userId) async {
    try {
      final res = await homeService.fetchUserReviewsApiRequest(userId);
      final searchResult =
          (res as List).map((e) => UserReviews.fromJson(e)).toList();
      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<VendorProfile> fetchVendor(String userId) async {
    try {
      final res = await homeService.fetchVendorApiRequest(userId);
      final searchResult = VendorProfile.fromJson(res);

      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  Future<List<SearchResultItem>> fetchVendorListings(String userId) async {
    try {
      final res = await homeService.fetchVendorListingsApiRequest(userId);
      final searchResult =
          (res as List).map((e) => SearchResultItem.fromJson(e)).toList();

      return searchResult;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }

  List<String> getTumbImage(String? serializedData) {
    // Remove the initial 'a:11:' part from the string
    String serializedString = serializedData!.substring(6);
    // Replace the semicolons, colons, and quotes to format it as a valid JSON
    RegExp regex = RegExp('"([^"]+)"');
    Iterable<Match> matches = regex.allMatches(serializedString);
    List<String> filteredTextList =
        matches.map((match) => match.group(1)!).toList();
    if (filteredTextList.isEmpty) {
      filteredTextList = ["https://viwaha.lk/assets/img/logo/no_image.jpg"];
    }

    return filteredTextList;
  }
}

class GetAllBranchModel {
  bool? success;
  List<Data>? data;

  GetAllBranchModel({this.success, this.data});

  GetAllBranchModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? countryName;
  List<Cities>? cities;

  Data({this.id, this.countryName, this.cities});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryName = json['country_name'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_name'] = this.countryName;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? id;
  String? name;
  List<Facilities>? facilities;

  Cities({this.id, this.name, this.facilities});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['facilities'] != null) {
      facilities = <Facilities>[];
      json['facilities'].forEach((v) {
        facilities!.add(new Facilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facilities {
  int? id;
  String? branchName;
  bool? status;
  String? region;
  String? country;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? zipcode;
  String? telephone;
  String? fax;
  String? email;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  int? updatedBy;

  Facilities(
      {this.id,
      this.branchName,
      this.status,
      this.region,
      this.country,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zipcode,
      this.telephone,
      this.fax,
      this.email,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  Facilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
    status = json['status'];
    region = json['region'];
    country = json['country'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    telephone = json['telephone'];
    fax = json['fax'];
    email = json['email'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_name'] = this.branchName;
    data['status'] = this.status;
    data['region'] = this.region;
    data['country'] = this.country;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['telephone'] = this.telephone;
    data['fax'] = this.fax;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
