<<<<<<< Updated upstream
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

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
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('Contact us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column( 
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.location_on_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '184 Collins Street West Colombo, Sri Lanka',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.phone_android_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Mobile: (+77) 245-541-425',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Hotline: +011545888556',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.email_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'support@listing.com',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'demo@listing.com',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
              ],
            ),
          ),
        ));
  }
}
=======
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

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
                  child: SizedBox(
                    width: 100,
                    child: Assets.lib.assets.images.logo.image(),
                  ),
                ),
              ],
            ),
          ],
          title: const Text('Contact us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.location_on_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            '184 Collins Street West Colombo, Sri Lanka',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.phone_android_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Phone',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Mobile: (+77) 245-541-425',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Hotline: +011545888556',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Icon(
                            Icons.email_outlined,
                            color: ViwahaColor.primary,
                            size: 50,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'support@listing.com',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'demo@listing.com',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
              ],
            ),
          ),
        ));
  }
}
>>>>>>> Stashed changes
