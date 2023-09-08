// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_profile.freezed.dart';
part 'vendor_profile.g.dart';

@freezed
class VendorProfile with _$VendorProfile {
  const factory VendorProfile({
    String? id,
    String? date,
    String? active_date,
    String? valid_date,
    String? type,
    String? firstname,
    String? lastname,
    String? username,
    String? nic,
    String? phonenumber,
    String? whatsappnumber,
    String? email,
    String? active,
    String? edit,
    String? inviteid,
    String? verifycode,
    String? verified,
    String? image,
    String? bank_name,
    String? branch_name,
    String? account_name,
    String? account_number,
    String? bank_swift_code,
    String? address,
    String? bank_receipt_image,
    String? view_bank_receipt,
    String? payment_type,
    String? website,
    String? company,
    String? designation,
    String? birthday,
    String? phone,
    String? country,
    String? facebook,
    String? instagram,
    String? twitter,
    String? linkedin,
    String? youtube,
    String? about,
    String? oauth_provider,
    String? oauth_uid,
    String? gender,
    String? unique_link,
    String? created,
    String? modified,
    String? token_de_platform,
    String? listings_count,
  }) = _VendorProfile;

  factory VendorProfile.fromJson(Map<String, dynamic> json) =>
      _$VendorProfileFromJson(json);
}