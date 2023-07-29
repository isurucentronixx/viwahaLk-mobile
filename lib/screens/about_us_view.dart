import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

@RoutePage()
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const apiKey =
        'AIzaSyCQthDZlGXOe_-wTKiPUmLd9MVaisTCz-M'; // Replace with your Google API key
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
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Image(
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
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(2.0)),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Image.network(url),
            ),
          ],
        ));
  }
}
