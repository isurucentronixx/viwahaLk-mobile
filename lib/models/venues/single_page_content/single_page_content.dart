import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:viwaha_lk/appColor.dart';
import '../../../gen/assets.gen.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderState();
}

class _SliderState extends State<SliderView> {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      Assets.lib.assets.images.slider1.path,
      Assets.lib.assets.images.slider2.path,
      Assets.lib.assets.images.slider3.path,
      Assets.lib.assets.images.slider4.path,
      // Add more image paths as needed
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 400, // Set the desired height of the slider
        autoPlay: true, // Enable auto-playing of images
        enlargeCenterPage: true, // Increase the size of the center image
        viewportFraction:
            0.8, // Fraction of the viewport width occupied by each image
        aspectRatio: 16 / 9, // Aspect ratio of the images
      ),
      items: imagePaths.map((imagePath) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SingleItemOverview extends StatefulWidget {
  const SingleItemOverview({super.key});

  @override
  State<SingleItemOverview> createState() => _SingleItemOverviewState();
}

class _SingleItemOverviewState extends State<SingleItemOverview> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Date: 09th May 2023',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Time: 10:00 AM - 12:00 PM',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Location: Example Location',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Wickramapala Photography Production',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(
                Icons.remove_red_eye,
              ),
              SizedBox(width: 4),
              Text(
                'Views: 100',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(width: 4),
              Text(
                'Ratings: 4.5',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleItemDescription extends StatefulWidget {
  const SingleItemDescription({super.key});

  @override
  State<SingleItemDescription> createState() => _SingleItemDescriptionState();
}

class _SingleItemDescriptionState extends State<SingleItemDescription> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Wedding Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Event Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Wedding Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Event Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Wedding Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '\u2022', // Unicode character for bullet point
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Event Photography',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SingleItemContactInfo extends StatefulWidget {
  const SingleItemContactInfo({super.key});

  @override
  State<SingleItemContactInfo> createState() => _SingleItemContactInfoState();
}

class _SingleItemContactInfoState extends State<SingleItemContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Contact Informations',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              const ListTile(
                leading: Icon(Icons.phone_android),
                title: Text('Contact Number'),
                subtitle: Text('987-654-3210'),
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text('Telephone Number'),
                subtitle: Text('555-123-4567'),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Address'),
                subtitle: Text('123 Main Street, City'),
              ),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('example@example.com'),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: FlutterSocialButton(
                        mini: true,
                        title: "0770369602",
                        buttonType: ButtonType.whatsapp,
                        onTap: () {
                          launchUrl(Uri.parse(
                              "whatsapp://send?phone=0770369602&text=Hi, Message from Viwaha App"));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: FlutterSocialButton(
                        mini: true,
                        title: "Facebook",
                        buttonType: ButtonType.facebook,
                        onTap: () {
                          launchUrl(Uri.parse("https://www.facebook.com/"));
                        },
                      ),
                    ),
                    FlutterSocialButton(
                      mini: true,
                      title: "Facebook",
                      buttonType: ButtonType.twitter,
                      onTap: () {
                        launchUrl(Uri.parse("https://www.twitter.com/"));
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SingleItemMap extends StatefulWidget {
  const SingleItemMap({super.key});

  @override
  State<SingleItemMap> createState() => _SingleItemMapState();
}

class _SingleItemMapState extends State<SingleItemMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color:
                ViwahaColor.primary, // Set the background color for the title
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Container(
          //   height: 500,
          //   width: 500,
          //   child: GoogleMap(
          //     initialCameraPosition: const CameraPosition(
          //       target: LatLng(37.7749,
          //           -122.4194), // Set the initial map center coordinates
          //       zoom: 13.0, // Set the initial zoom level
          //     ),
          //     markers: {
          //       const Marker(
          //         markerId: MarkerId('marker_1'),
          //         position:
          //             LatLng(37.7749, -122.4194), // Set the marker coordinates
          //       ),
          //       // Add more Marker widgets as needed
          //     },
          //   ),
          //),
        ],
      ),
    );
  }
}
