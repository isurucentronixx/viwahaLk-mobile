class Endpoints {
  // base url
  static const String baseUrl =
      "http://viwahaweb.nikhilaholdings.lk/api/";
  
   static const String getVendorListUrl =
      "vendors/get_top_wedding_vendors";

   static const String getTopListUrl =
      "listings/get_top_wedding_listings";

    static const String getCategoryUrl =
      "locations/get_categories";
    
    static const String getLocationUrl =
      "locations/get_locations";
    
    static const String getAllListing =
      "search/get_listings_list";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;
}
