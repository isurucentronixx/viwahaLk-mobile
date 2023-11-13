// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/popular_cities/popular_cities/popular_city_model.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/translations/locale_keys.g.dart';

class PopularCities extends ConsumerStatefulWidget {
  const PopularCities({super.key});

  @override
  _PopularCitiesState createState() => _PopularCitiesState();
}

class _PopularCitiesState extends ConsumerState<PopularCities> {
  @override
  Widget build(BuildContext context) {
    var inputDateFormat = DateFormat('dd MMMM, yyyy');
    List<City> popularCities = [
      City(
          id: "1",
          name: "colombo".tr(),
          image: "https://viwaha.lk/assets/img/city/Colombo.png",
          ratings: "0"),
      City(
          id: "2",
          name: "kandy".tr(),
          image: "https://viwaha.lk/assets/img/city/Kandy.png",
          ratings: "0"),
      City(
          id: "3",
          name: "galle".tr(),
          image: "https://viwaha.lk/assets/img/city/Galle.png",
          ratings: "0"),
      City(
          id: "4",
          name: "jaffna".tr(),
          image: "https://viwaha.lk/assets/img/city/Jaffna.png",
          ratings: "0"),
      City(
          id: "5",
          name: "kurunegala".tr(),
          image: "https://viwaha.lk/assets/img/city/Kurunegala.jpg",
          ratings: "0"),
      City(
          id: "6",
          name: "anuradhapura".tr(),
          image: "https://viwaha.lk/assets/img/city/Anuradhapura.png",
          ratings: "0"),
      City(
          id: "7",
          name: "badulla".tr(),
          image: "https://viwaha.lk/assets/img/city/Badulla.png",
          ratings: "3")
    ];
    final data = popularCities;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            LocaleKeys.popular_cities.tr(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.browse_listings_in.tr(),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: LocaleKeys.popular_places.tr(),
                style: const TextStyle(
                  color: ViwahaColor.primary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CarouselSlider(
          options: CarouselOptions(
            reverse: true,
            height: 280,
            autoPlay: true,
            viewportFraction: 0.6,
            aspectRatio: 16 / 9,
          ),
          items: data.map((data) {
            final city = data;
            return GestureDetector(
              onTap: () {
                ref.read(selectedSubLocationProvider.notifier).state =
                    const SubLocation();
                ref.read(selectedMainLocationProvider.notifier).state = "";
                ref.read(selectedSubCategoryProvider.notifier).state =
                    const SubCategories();
                ref.read(selectedMainCategoryProvider.notifier).state = "";

                ref.read(selectedMainLocationProvider.notifier).state =
                    data.name!;
                ref.read(allListingProvider);
                ref.read(isSearchingProvider.notifier).state = true;
                AutoRouter.of(context).push(const SearchingResultsPage());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: ViwahaColor.primary.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      // width: 280,
                      height: 225,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: city.image.toString(),
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 280,
                              // width: 225,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Center(
                              child: Image.network(
                                'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(height: 4),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      child: Text(
                                        city.name.toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "rating".tr(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                        RatingBarIndicator(
                          rating:
                              double.parse(city.ratings.toString()).ceilToDouble(),
                          itemBuilder: (context, index) => Icon(
                            city.ratings.toString() != "0"
                                ? Icons.star
                                : Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.grey.withAlpha(50),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
