import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:viwaha_lk/appColor.dart';

import '../gen/assets.gen.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const apiKey =
        'AIzaSyD856KsYNpA6N-1dTKmwOl_TnnEk7NrTYc'; // Replace with your Google API key
    final encodedAddress =
        Uri.encodeComponent("1313 high-level, road, Colombo, Sri Lanka");

    final url = 'https://maps.googleapis.com/maps/api/staticmap?'
        'size=600x400'
        '&zoom=17'
        '&maptype=roadmap\&'
        'markers=size:mid|color:red|$encodedAddress'
        '&key=$apiKey';

    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('About us'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Image(
                    width: 100,
                    image: Assets.lib.assets.images.colorLogo.image().image),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                    textAlign: TextAlign.center,
                    'Viwaha is the largest and most trusted Sri Lankan marketplace connecting engaged couples with local wedding professionals. Millions of couples around the world are able to search, compare and book from directory vendors. You can find inspiration, ideas and vendors within your budget. So sit back, log on to Viwaha, and plan the wedding of your big day dream!',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("We look forward to welcoming you!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ViwahaColor.primary),
                      borderRadius: BorderRadius.circular(2.0)),
                  width: double.infinity,
                  child: Image.network(url),
                ),
              ),
            ],
          ),
        ));
  }
}
