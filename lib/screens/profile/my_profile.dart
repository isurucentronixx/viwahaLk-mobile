// ignore_for_file: unused_import, unused_field

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/controllers/login_controller.dart';
import 'package:viwaha_lk/gen/assets.gen.dart';
import 'package:viwaha_lk/routes/router.dart';
import 'package:viwaha_lk/routes/router.gr.dart';
import 'package:viwaha_lk/screens/add_listing/field_set_widget.dart';

@RoutePage()
class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider).user;
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
        title: const Text("My Profile"),
      ),
      body: ref.watch(isloginProvider)
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
                                    user!.image.toString(),
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
                      child: Container(
                        child: ListTile(
                          title: Text(
                              '${user.firstname} ${user.lastname != "" ? user.lastname : ""}'
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center),
                          subtitle: Text(user.designation.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18),
                              textAlign: TextAlign.center),
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
                                  subtitle: Text(user.phone.toString(),
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
                                subtitle: Text(user.phonenumber.toString(),
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
                                subtitle: Text(user.email.toString(),
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
                                subtitle: Text(user.address.toString(),
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
                                subtitle: Text(user.company.toString(),
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
                                subtitle: Text(user.birthday.toString(),
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
                                  user.email.toString(),
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
          : Center(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton.icon(
                  onPressed: () {
                    AutoRouter.of(context).push(const Login());
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
