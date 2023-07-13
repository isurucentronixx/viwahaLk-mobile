import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/routes/router.gr.dart';

import '../../gen/assets.gen.dart';

class CoupleInfoSection extends StatelessWidget {
  const CoupleInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          child: Container(
                            height: 210,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // Handle Edit button pressed
                                      },
                                      icon: const Icon(Icons.edit),
                                      label: const Text('Edit'),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  Assets.lib.assets.images.cover.path,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  height: 40,
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
                      ],
                    ),
                  ),
                ],
              ),
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
                    AutoRouter.of(context)
                        .push(const CoupleDashboardToDoRoute());
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
            // const SizedBox(height: 50),
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
                  const SizedBox(height: 50),
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
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 30.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
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
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 30.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
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
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 30.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
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
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 30.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
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
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.only(top: 30.0),
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
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
                              child: Container(
                                height: 100,
                                padding: const EdgeInsets.only(top: 30.0),
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                                child: const Column(
                                  children: [
                                    Icon(Icons.cake,
                                        size: 18, color: Color(0xFFFFFFFF)),
                                    Text(
                                      'Wedding Cake',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
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

class GuestListSection extends StatelessWidget {
  const GuestListSection({super.key});

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
                  '0 of 0 accepted',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 50, 50, 50)),
                ),
                TextButton(
                  onPressed: () {
                    // Handle View All Vendors button pressed
                  },
                  child: const Row(
                    children: [
                      Text('View all guests'),
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
              title: const Text('John Doe'),
              subtitle: const Text('Pending'),
            ),
          ],
        ),
      ),
    );
  }
}

class BudgetSection extends StatelessWidget {
  const BudgetSection({super.key});

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
                  'Budget',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 50, 50, 50)),
                ),
                TextButton(
                  onPressed: () {
                    // Handle View All Vendors button pressed
                  },
                  child: const Row(
                    children: [
                      Text('View budget'),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                      ),
                      const Text('\$18,000'),
                      const Text('Estimated cost'),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.money,
                          color: Colors.white,
                        ),
                      ),
                      const Text('\$0'),
                      const Text('Final cost'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Handle manage expenses action
                },
                child: const Text('Manage expenses'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeddingDetailSection extends StatelessWidget {
  const WeddingDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wedding Details',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 50, 50, 50)),
                ),
                // TextButton(
                //   onPressed: () {
                //     // Handle View All Vendors button pressed
                //   },
                //   child: const Row(
                //     children: [
                //       Text('View all guests'),
                //       Icon(Icons.arrow_right),
                //     ],
                //   ),
                // ),
              ],
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.nightlight_round,
                                      size: 50,
                                      color: Color.fromARGB(255, 126, 0, 107),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Purple',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '9,489 couples',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.sunny,
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Season',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '...',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.beach_access,
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Style',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '...',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.accessibility,
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Dress',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '...',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.local_airport_sharp,
                                      size: 50,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Honeymoon',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    '...',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
