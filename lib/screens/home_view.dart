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
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: currentTab == 4 ? Colors.black54 : Colors.white,
        ),
        onPressed: () {
          setState(() {
            currentScreen = const AddListingPage();
            currentTab = 4;
          });
        },
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
                        currentScreen = const HomeContent();
                        currentTab = 0;
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
                            color:
                                currentTab == 0 ? Colors.black54 : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ref.watch(isloginProvider)
                            ? const AllListingPage()
                            : const Login();
                        currentTab = 1;
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
                            color:
                                currentTab == 1 ? Colors.black54 : Colors.white,
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
                      setState(() {
                        currentScreen = ref.watch(isloginProvider)
                            ? const ProfilePage()
                            : const Login();
                        currentTab = 2;
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
                            color:
                                currentTab == 2 ? Colors.black54 : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ref.watch(isloginProvider)
                            ? const FavListingPage()
                            : const Login();
                        currentTab = 3;
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
                            color:
                                currentTab == 3 ? Colors.black54 : Colors.white,
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
    );
  }
}
