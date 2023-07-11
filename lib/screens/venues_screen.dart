import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import '../models/menu_item.dart';
import '../models/venues/venues_list.dart';

@RoutePage()
class VenuesScreen extends StatelessWidget {
  const VenuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
        title: const Text("Venues"),
      ),
      drawer: const DrawerMenu(),
      body: const VenusesViewList(),
    );
  }
}
