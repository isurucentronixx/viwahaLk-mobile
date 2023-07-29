import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viwaha_lk/models/premium_vender/vendor/vendor.dart';

part 'vendor_state.freezed.dart';

@freezed
class VendorState with _$VendorState {
  factory VendorState({
    @Default(Vendor()) Vendor vendor,
    @Default(true) bool isLoading,
  }) = _VendorState;
}