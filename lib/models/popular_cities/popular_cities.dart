// ignore_for_file: depend_on_referenced_packages

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/core/shared_provider/shared_providers.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:viwaha_lk/models/categories/sub_categories.dart';
import 'package:viwaha_lk/models/locations/sub_location.dart';
import 'package:viwaha_lk/models/popular_cities/popular_cities/popular_city_model.dart';
import 'package:viwaha_lk/models/premium_vender/feedback.dart';
import 'package:viwaha_lk/screens/all_listing/all_listing.dart';
import 'package:viwaha_lk/screens/search/searching_page.dart';

import 'package:viwaha_lk/routes/router.gr.dart';

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
      const City(
          id: "1",
          name: "Colombo",
          image: "https://viwaha.lk/assets/img/city/Colombo.png",
          ratings: "5"),
      const City(
          id: "2",
          name: "Kandy",
          image: "https://viwaha.lk/assets/img/city/Kandy.png",
          ratings: "5"),
      const City(
          id: "3",
          name: "Galle",
          image: "https://viwaha.lk/assets/img/city/Galle.png",
          ratings: "5"),
      const City(
          id: "4",
          name: "Jaffna",
          image: "https://viwaha.lk/assets/img/city/Jaffna.png",
          ratings: "5"),
      const City(
          id: "5",
          name: "Kurunegala",
          image: "https://viwaha.lk/assets/img/city/Kurunegala.jpg",
          ratings: "5"),
      const City(
          id: "6",
          name: "Anuradhapura",
          image: "https://viwaha.lk/assets/img/city/Anuradhapura.png",
          ratings: "5"),
      const City(
          id: "7",
          name: "Badulla",
          image: "https://viwaha.lk/assets/img/city/Badulla.png",
          ratings: "5")
    ];
    final data = popularCities;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Popular Cities',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Browse listings in popular places ',
                style: TextStyle(
                  color: Colors.black87,
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
            height: 280, // Set the desired height of the slider
            autoPlay: true, // Enable auto-playing of images
            // enlargeCenterPage: true, // Increase the size of the center image
            viewportFraction:
                0.6, // Fraction of the viewport width occupied by each image
            aspectRatio: 16 / 9, // Aspect ratio of the images
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

                AutoRouter.of(context).push(const SearchingResultsPage());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.yellow),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 280,
                      height: 225,
                      child: Stack(
                        children: [
                          Image.network(
                            city.image.toString(),
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: 280,
                                    height: 225,
                                    child: child,
                                  ),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(
                                    // value: progress.cumulativeBytesLoaded /
                                    //     progress.expectedTotalBytes!.toDouble(),
                                    ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Text('Failed to load image'),
                              );
                            },
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
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
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
                        const Text("Rating: "),
                        RatingBarIndicator(
                          rating:
                              int.parse(city.ratings.toString()).ceilToDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
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
