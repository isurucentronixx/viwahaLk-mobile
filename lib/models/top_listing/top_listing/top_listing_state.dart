import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:viwaha_lk/models/top_listing/top_listing/top_listing.dart';

part 'top_listing_state.freezed.dart';

@freezed
class TopListingState with _$TopListingState {
  factory TopListingState({
    @Default(TopListing()) TopListing topListing,
    @Default(true) bool isLoading,
  }) = _TopListingState;
}