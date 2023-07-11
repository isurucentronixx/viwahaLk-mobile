import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class CoupleInfoSection extends StatelessWidget {
  const CoupleInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 2,
      //       blurRadius: 5,
      //       offset: const Offset(0, 3),
      //     ),
      //   ],
      // ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          // child: Assets.lib.assets.images.cover.image(
                          //   height: 200,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          // ),
                          child: Container(
                            height: 210,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  Assets.lib.assets.images.cover.path,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  height: 30,
                                  child: Container(
                                    color: const Color(0xFF00AEAF),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '00',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Days',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '00',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Hours',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '00',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Minutes',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          '00',
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Seconds',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // const SizedBox(height: 10),
                        // Container(
                        //   color: const Color(0xFF00AEAF),
                        //   child: const Padding(
                        //     padding: EdgeInsets.zero,
                        //     child: ClipRRect(
                        //       borderRadius: BorderRadius.only(
                        //         bottomLeft: Radius.circular(5),
                        //         bottomRight: Radius.circular(5),
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             '00',
                        //             style: TextStyle(
                        //                 fontSize: 24, color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 5),
                        //           Text(
                        //             'Days',
                        //             style: TextStyle(color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 20),
                        //           Text(
                        //             '00',
                        //             style: TextStyle(
                        //                 fontSize: 24, color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 5),
                        //           Text(
                        //             'Hours',
                        //             style: TextStyle(color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 20),
                        //           Text(
                        //             '00',
                        //             style: TextStyle(
                        //                 fontSize: 24, color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 5),
                        //           Text(
                        //             'Minutes',
                        //             style: TextStyle(color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 20),
                        //           Text(
                        //             '00',
                        //             style: TextStyle(
                        //                 fontSize: 24, color: Color(0xFFFFFFFF)),
                        //           ),
                        //           SizedBox(width: 5),
                        //           Text(
                        //             'Seconds',
                        //             style: TextStyle(color: Color(0xFFFFFFFF)),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     ElevatedButton.icon(
              //       onPressed: () {
              //         // Handle Edit button pressed
              //       },
              //       icon: const Icon(Icons.edit),
              //       label: const Text('Edit'),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Assets.lib.assets.images.brideDp.image(
                            height: 82,
                            width: 82,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Assets.lib.assets.images.groomDp.image(
                            height: 82,
                            width: 82,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sarah & Freddie',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 5),
                        Text('Wedding Date'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const LinearProgressIndicator(
                value: 0.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text('Out of 0'),
                          Text('Services Hired'),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text('Out of 0'),
                          Text('Tasks Completed'),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text('Out of 0'),
                          Text('Guests Attending'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckListSection extends StatelessWidget {
  const CheckListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '0 of 0 completed',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 50, 50, 50)),
                ),
                TextButton(
                  onPressed: () {
                    // Handle View All Vendors button pressed
                  },
                  child: const Row(
                    children: [
                      Text('View all tasks'),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (value) {
                  // Handle checkbox state change
                },
              ),
              title: const Text('Plan your engagement party'),
              subtitle: const Text('Engagement'),
            ),
          ],
        ),
      ),
    );
  }
}

class VendorTeamSection extends StatelessWidget {
  const VendorTeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '0 of 12 categories hired',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 50, 50, 50)),
                ),
                TextButton(
                  onPressed: () {
                    // Handle View All Vendors button pressed
                  },
                  child: const Row(
                    children: [
                      Text('View all my vendors'),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10),
              child: Form(
                // action: 'https://viwahaweb.nikhilaholdings.lk/search',
                child: Row(
                  children: [
                    const SizedBox(height: 100),
                    Expanded(
                      child: TextFormField(
                        // name: 'title',
                        decoration: const InputDecoration(
                          hintText: 'Start your search',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        // name: 'location',
                        decoration: const InputDecoration(
                          hintText: 'Where',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle the search action
                      },
                      child: const Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            // Handle the wedding venue action
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    Assets.lib.assets.images.bgCard.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.location_on,
                                    size: 18, color: Color(0xFFFFFFFF)),
                                Text(
                                  'Wedding Venue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            // Handle the photographer action
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    Assets.lib.assets.images.bgCard.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.camera_alt,
                                    size: 18, color: Color(0xFFFFFFFF)),
                                Text(
                                  'Photographer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            // Handle the florist action
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    Assets.lib.assets.images.bgCard.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.local_florist,
                                    size: 18, color: Color(0xFFFFFFFF)),
                                Text(
                                  'Florist',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            // Handle the wedding ring action
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    Assets.lib.assets.images.bgCard.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.favorite,
                                    size: 18, color: Color(0xFFFFFFFF)),
                                Text(
                                  'Wedding Ring',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () {
                            // Handle the gifts action
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    Assets.lib.assets.images.bgCard.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.card_giftcard,
                                    size: 18, color: Color(0xFFFFFFFF)),
                                Text(
                                  'Gifts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                            onTap: () {
                              // Handle the wedding cake action
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      Assets.lib.assets.images.bgCard.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Column(
                                children: [
                                  Icon(Icons.cake,
                                      size: 18, color: Color(0xFFFFFFFF)),
                                  Text(
                                    'Wedding Cake',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF), fontSize: 12),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
