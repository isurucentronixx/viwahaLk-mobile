import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/permium_vender/feedback.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PremiumVendors extends StatelessWidget {
  PremiumVendors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Premium Vendors',
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
                text: 'Discover top-rated Premium Vendors ',
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: feedbacks.length,
              itemBuilder: (context, index) {
                final feedback = feedbacks[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.yellow),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(feedback.imagePath),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black87.withOpacity(0.4),
                                BlendMode.darken),
                          ),
                        ),
                        child: Stack(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: FavoriteIcon(),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Text(
                                      feedback.date,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    feedback.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: Text(
                                          feedback.description,
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
                        children: [
                          const Text("Rating: "),
                          RatingBarIndicator(
                            rating: feedback.rating.ceilToDouble(),
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
