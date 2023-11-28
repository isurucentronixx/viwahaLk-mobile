import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/screens/home/home_content.dart';
import 'package:viwaha_lk/screens/menu_item.dart';
import 'package:viwaha_lk/screens/add_listing/add_listing.dart';
import 'package:viwaha_lk/screens/all_listing/all_listing.dart';
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
  int? selectedOption;
  int selectedIndex = -1;
  String selectedPremium = "";
  String selectedPolicyNumber = "";
  String selectedLng = "";

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
        if (value != 2 && mounted) {
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

  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeContent();
  var currentTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentTime == null ||
            now.difference(currentTime) > const Duration(seconds: 2)) {
          currentTime = now;

          SnackBar snackBar = const SnackBar(
              content: Text('Tap again to exit',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 15)),
              backgroundColor: ViwahaColor.primary,
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating);

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          return Future.value(false);
        } else {
          SystemNavigator.pop();
          exit(0);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ],
            )
          ],
          title: Text(currentPage == 0
              ? ""
              : currentPage == 1
                  ? "All Listings"
                  : currentPage == 2
                      ? ref.watch(isloginProvider)
                          ? "Add New Listing"
                          : "Login"
                      : currentPage == 3
                          ? ref.watch(isloginProvider)
                              ? "Profile"
                              : "Login"
                          : ref.watch(isloginProvider)
                              ? "Favourite"
                              : "Login"),
        ),
        drawer: const DrawerMenu(),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: FloatingActionButton(
            backgroundColor: ViwahaColor.primary,
            child: Icon(
              Icons.add,
              color: currentTab == 4 ? Colors.black54 : Colors.white,
            ),
            onPressed: () {
              setState(() {
                ref.read(mainImageNameProvider.notifier).state = "";
                ref.read(imageNameGalleryProvider).clear();
                ref.read(mainImageProvider.notifier).state = "";
                ref.read(imageGalleryProvider).clear();
                currentScreen = ref.watch(isloginProvider)
                    ? const AddListingPage(false)
                    : const Login(true);
                currentTab = 4;
                currentPage = 2;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: ViwahaColor.primary,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          if (ref.watch(isloginProvider)) {
                            ref.refresh(topListingProvider);
                            ref.refresh(vendorsProvider);
                          }

                          currentScreen = const HomeContent();
                          currentTab = 0;
                          currentPage = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home_outlined,
                            color:
                                currentTab == 0 ? Colors.black54 : Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currentTab == 0
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        if (ref.watch(isloginProvider)) {
                          ref.refresh(allListingProvider);
                        }

                        setState(() {
                          ref.read(isSearchingProvider.notifier).state = true;
                          currentScreen = const AllListingPage(false);
                          currentTab = 1;
                          currentPage = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.notes_outlined,
                            color:
                                currentTab == 1 ? Colors.black54 : Colors.white,
                          ),
                          Text(
                            'List',
                            style: TextStyle(
                              color: currentTab == 1
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        if (ref.watch(isloginProvider)) {
                          ref.refresh(myListingProvider);
                          ref.refresh(favListingProvider);
                        }

                        setState(() {
                          currentScreen = ref.watch(isloginProvider)
                              ? const ProfilePage()
                              : const Login(true);
                          currentTab = 2;
                          currentPage = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle_outlined,
                            color:
                                currentTab == 2 ? Colors.black54 : Colors.white,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: currentTab == 2
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          ref.read(isSearchingProvider.notifier).state = true;
                          if (ref.watch(isloginProvider)) {
                            ref.refresh(favListingProvider);
                          }

                          currentScreen = ref.watch(isloginProvider)
                              ? const FavListingPage(false)
                              : const Login(true);
                          currentTab = 3;
                          currentPage = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_outline,
                            color:
                                currentTab == 3 ? Colors.black54 : Colors.white,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(
                              color: currentTab == 3
                                  ? Colors.black54
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // body: const HomeContent(),
      ),
    );
  }
}
