// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/features/home/home_provider.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/models/vendor_profile/vendor_profile.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';

@RoutePage()
class VendorProfilePage extends ConsumerStatefulWidget {
  final String userId;
  const VendorProfilePage(this.userId, {super.key});
  @override
  _VendorProfilePageState createState() => _VendorProfilePageState();
}

class _VendorProfilePageState extends ConsumerState<VendorProfilePage> {
  VendorProfile vendor = const VendorProfile();
  bool isLoading = false;
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    vendor = await ref.read(homeControllerProvider).fetchVendor(widget.userId);

    setState(() {
      isLoading = true;
    });
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
        title: const Text("Vendor Profile"),
      ),
      body: isLoading
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    /// -- IMAGE
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ViwahaColor
                                        .primary, // Set your desired border color here
                                    width: 4, // Set the desired border width
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    vendor.image.toString(),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, progress) {
                                      if (progress == null) {
                                        return SizedBox(
                                          width: 150,
                                          height: 150,
                                          child: child,
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.network(
                                        'https://viwaha.lk/assets/img/logo/no_image.jpg',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: ListTile(
                        title: Text(
                            '${vendor.firstname} ${vendor.lastname != "" ? vendor.lastname : ""}'
                                .toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            textAlign: TextAlign.center),
                        subtitle: Text(vendor.designation.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ViwahaColor.primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Total Listings ${vendor.listings_count}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddFieldMainWidget(
                            icon: Icons.person_2_outlined,
                            title: "Profile Details",
                            description: "",
                            inputList: [
                              ListTile(
                                  title: const Text('Telephone Number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      textAlign: TextAlign.start),
                                  subtitle: Text(vendor.phone.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18),
                                      textAlign: TextAlign.start)),
                              ListTile(
                                title: const Text('Whatsapp Number',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                subtitle: Text(vendor.phonenumber.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
                              ),
                              ListTile(
                                title: const Text('Email',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                subtitle: Text(vendor.email.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
                              ),
                              ListTile(
                                title: const Text('Address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                subtitle: Text(vendor.address.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
                              ),
                              ListTile(
                                title: const Text('Company',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                subtitle: Text(vendor.company.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
                              ),
                              ListTile(
                                title: const Text('Birthday',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    textAlign: TextAlign.start),
                                subtitle: Text(vendor.birthday.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                    textAlign: TextAlign.start),
                              ),
                            ]),
                        AddFieldMainWidget(
                            icon: Icons.follow_the_signs_outlined,
                            title: "Follow Us",
                            description: "",
                            inputList: [
                              ListTile(
                                leading:
                                    const Icon(Icons.mail_outline_outlined),
                                title: Text(
                                  vendor.email.toString(),
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                            ])
                      ],
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
