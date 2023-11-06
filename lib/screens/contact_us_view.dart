import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viwaha_lk/appColor.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

import '../gen/assets.gen.dart';

@RoutePage()
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(const HomePage());
                    },
                    child: SizedBox(
                      width: 100,
                      child: Assets.lib.assets.images.logo.image(),
                    ),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('Contact us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ViwahaColor.primary, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Enter your name here",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ViwahaColor.primary, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Enter your E-mail here",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ViwahaColor.primary, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Enter your phone number here",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Phone',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  focusNode: FocusNode(canRequestFocus: false),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                  onChanged: (value) {},
                  maxLines: 6,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    //add prefix icon
                    prefixIcon: const Icon(
                      Icons.description_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ViwahaColor.primary, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Colors.grey,
                    hintText: "Enter your message here",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                    labelText: 'Message',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: "verdana_regular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  validator: null,
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Submit'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ViwahaColor.primary, // Border color
                              width: 2, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Border radius
                          ),
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.location_on_outlined,
                              color: ViwahaColor.primary,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          child: Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: const Column(
                            children: [
                              Text(
                                '184 Collins Street West Colombo, Sri Lanka',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ViwahaColor.primary, // Border color
                              width: 2, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Border radius
                          ),
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.phone_android_outlined,
                              color: ViwahaColor.primary,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('tel:+77245541425');
                          },
                          child: const SizedBox(
                            child: Text(
                              'Phone',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('tel:+77245541425');
                          },
                          child: const SizedBox(
                            child: Text(
                              'Mobile: (+77) 245-541-425',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('tel:+011545888556');
                          },
                          child: const SizedBox(
                            child: Text(
                              'Hotline: +011545888556',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ViwahaColor.primary, // Border color
                              width: 2, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Border radius
                          ),
                          child: const SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.email_outlined,
                              color: ViwahaColor.primary,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch('mailto:info@viwaha.lk');
                          },
                          child: const SizedBox(
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            launch('mailto:info@viwaha.lk');
                          },
                          child: const SizedBox(
                            child: Text(
                              'info@viwaha.lk',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
