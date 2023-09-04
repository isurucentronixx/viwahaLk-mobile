class Endpoints {
  // base url
  static const String baseUrl = "https://viwahaapp.viwaha.lk/api/";

  static const String getVendorListUrl = "vendors/get_top_wedding_vendors";

  static const String loginUrl = "auth/login";
  static const String registerUrl = "auth/register";

  static const String getTopListUrl = "listings/get_top_wedding_listings";

  static const String getCategoryUrl = "locations/get_categories";

  static const String getLocationUrl = "locations/get_locations";

  static const String getAllListing = "search/get_listings_list";

  static const String getFavListing = "listings/get_fav_listings?id=";

  static const String getMyListing = "listings/get_my_listings?userId=";

  static const String getDashboardCounts = "profile/get_dashboard?userId=";

  static const String getUserMessages = "profile/get_messages?userId=";

  static const String getUserNotification = "profile/get_notifications?userId=";

  static const String getUserReviews = "profile/get_reviews?userId=";

  static const String getVendor = "profile/get_profile_by_userid?userId=";

  static const String getVendorListings =
      "listings/get_listings_by_userid?userId=";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
