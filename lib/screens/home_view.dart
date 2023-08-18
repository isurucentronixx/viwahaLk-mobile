import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/home/home_content.dart';
import 'package:viwaha_lk/models/menu_item.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/all_listing/all_listing.dart';
import 'package:viwaha_lk/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:viwaha_lk/screens/fav_listings/fav_listing.dart';
import 'package:viwaha_lk/screens/login/login.dart';
import 'package:viwaha_lk/screens/profile/profile.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(
      length: 5,
      vsync: this,
    );
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
        title: Text(currentPage == 0
            ? "Home"
            : currentPage == 1
                ? "All Listings"
                : currentPage == 2
                    ? "Add New Listing"
                    : currentPage == 3
                        ? ref.watch(isloginProvider)
                            ? "Dashboard"
                            : "Login"
                        : ref.watch(isloginProvider)
                            ? "Favourite"
                            : "Login"),
      ),
      drawer: const DrawerMenu(),
      body: BottomBar(
        currentPage: currentPage,
        tabController: tabController,
        // colors: colors,
        unselectedColor: Colors.white,
        barColor: ViwahaColor.primary,
        start: 10,
        end: 2,
        child: TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: [
              const HomeContent(),
              const AllListingPage(),
              ref.watch(isloginProvider)
                  ? const AddListingPage()
                  : const Login(),
              ref.watch(isloginProvider) ? const ProfilePage() : const Login(),
              ref.watch(isloginProvider)
                  ? const FavListingPage()
                  : const Login(),
            ]),
      ),

      // body: const HomeContent(),
    );
  }
}
