import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/home_controller.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/home/home_content.dart';
import 'package:viwaha_lk/models/menu_item.dart';
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
  bool _show = true;
  int _radioValue = 0;
  int selectedIndex = -1;
  String selectedPremium = "";
  String selectedPolicyNumber = "";
  List<String> lngItem = ['en', 'si', 'ta'];

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

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
    print("first" + value.toString() + "radiovalue" + _radioValue.toString());
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  handleChange(String lng) {
    print(lng);
    setState(() async {
       await context.setLocale(Locale(lng));
    Navigator.pop(context);
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            // SmartSelect<String>.single(
            //   title: 'lang',
            //   selectedValue: selectedLang,
            //   choiceItems: langData,
            //   onChange: (selected) {
            //     setState(() {});
            //   },
            //   modalType: S2ModalType.bottomSheet,
            //   tileBuilder: (context, state) {
            //     return ListTile(
            //       title: Text(
            //         state.title.toString(),
            //         style: const TextStyle(
            //           color: Colors.grey,
            //           fontSize: 18,
            //           fontFamily: "verdana_regular",
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //       subtitle: Text(selectedLang),
            //       trailing: const Icon(Icons.keyboard_arrow_down),
            //       onTap: state.showModal,
            //     );
            //   },
            // ),
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
                IconButton(
                    onPressed: () async {
                       await context.setLocale(Locale('si'));
                      // showModalBottomSheet<void>(
                      //     context: context,
                      //     backgroundColor: Colors.white,
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(
                      //         top: Radius.circular(25.0),
                      //       ),
                      //     ),
                      //     builder: (BuildContext context) {
                      //       return BackdropFilter(
                      //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      //         child: Container(
                      //           height:
                      //               MediaQuery.of(context).size.height * 0.35,
                      //           decoration: const BoxDecoration(
                      //               borderRadius: BorderRadius.only(
                      //                   topLeft: Radius.circular(25),
                      //                   topRight: Radius.circular(25)),
                      //               color: Colors.white),
                      //           padding: const EdgeInsets.symmetric(
                      //               vertical: 18, horizontal: 16),
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: <Widget>[
                      //               Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceBetween,
                      //                   children: [
                      //                     const Text(
                      //                       "Choose your preferred language",
                      //                       style: TextStyle(
                      //                           color: Colors.grey,
                      //                           fontSize: 20,
                      //                           fontWeight: FontWeight.w500),
                      //                     ),
                      //                     GestureDetector(
                      //                       onTap: () =>
                      //                           {Navigator.pop(context)},
                      //                       child: const Icon(
                      //                         Icons.close,
                      //                         color: Colors.grey,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //               Expanded(child: StatefulBuilder(builder:
                      //                   (BuildContext context, setState) {
                      //                 return Column(
                      //                     mainAxisAlignment:
                      //                         MainAxisAlignment.spaceBetween,
                      //                     crossAxisAlignment:
                      //                         CrossAxisAlignment.stretch,
                      //                     children: [
                      //                       ListView.builder(
                      //                           physics: const ScrollPhysics(),
                      //                           scrollDirection: Axis.vertical,
                      //                           shrinkWrap: true,
                      //                           itemCount: lngItem.length,
                      //                           itemBuilder:
                      //                               (BuildContext context,
                      //                                   index) {
                      //                             return GestureDetector(
                      //                               onTap: () {
                      //                                 handleChange(
                      //                                     lngItem[index]
                      //                                         .toString());
                      //                               },
                      //                               child: cardContent(
                      //                                 lngItem[index].toString(),
                      //                               ),
                      //                             );
                      //                           })
                      //                     ]);
                      //               })),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      //     });
                    },
                    icon: const Icon(Icons.translate)),
              ],
            ),
          ],
          title: Text(currentPage == 0
              ? "Home"
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
        floatingActionButton: FloatingActionButton(
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
                  : const Login();
              currentTab = 4;
              currentPage = 2;
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
                        setState(() {
                          currentScreen = const AllListingPage();
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
                        setState(() {
                          currentScreen = ref.watch(isloginProvider)
                              ? const ProfilePage()
                              : const Login();
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
                          currentScreen = ref.watch(isloginProvider)
                              ? const FavListingPage(false)
                              : const Login();
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

  Widget cardContent(String lng) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(lng.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 22)),
          Text(
            lng == 'en'
                ? 'English'
                : lng == 'si'
                    ? 'සිංහල'
                    : 'தமிழ்',
            style: const TextStyle(color: Colors.grey, fontSize: 22),
          ),
          CountryFlag.fromCountryCode(
            lng == 'en'
                ? 'GB'
                : lng == 'si'
                    ? 'LK'
                    : 'IN',
            height: 35,
            width: 35,
            borderRadius: 0,
          )
        ],
      ),
    );
  }
}
