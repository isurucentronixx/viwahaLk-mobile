import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/models/dashboard/guest_list/counter_item.dart';

import '../../models/dashboard/guest_list/guest_list_widgets.dart';

@RoutePage()
class GuestListView extends StatelessWidget {
  const GuestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add New Guest action
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Add Guest',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                Form(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'First Name',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Last Name',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Group Name',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Phone Number',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Email ID',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'No. of Guest',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Address',
                                        ),
                                      ),
                                      TextFormField(
                                        onTapOutside: (event) =>
                                            FocusScope.of(context).unfocus(),
                                        focusNode:
                                            FocusNode(canRequestFocus: false),
                                        decoration: const InputDecoration(
                                          labelText: 'Comment',
                                        ),
                                        maxLines: 4,
                                      ),
                                      const SizedBox(height: 16.0),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add new guest logic
                                        },
                                        child: const Text('Add New Guest'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.add),
                    // SizedBox(width: 5.0),
                    Text('Add New'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CounterItem(
                        counter: '43',
                        title: 'Guests',
                        subTitle: 'From Total',
                      ),
                    ),
                    Expanded(
                      child: CounterItem(
                        counter: '9',
                        title: 'Accepted',
                        subTitle: 'From Total',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CounterItem(
                        counter: '32',
                        title: 'Waiting',
                        subTitle: 'From Total',
                      ),
                    ),
                    Expanded(
                      child: CounterItem(
                        counter: '2',
                        title: 'Declined',
                        subTitle: 'From Total',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search list',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                            const Text('Select all'),
                          ]),
                          ElevatedButton(
                            onPressed: () {
                              // Excel action
                            },
                            child: const Text('Export'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            GuestItem(
              guestName: 'Hitesh Mahavar',
              group: 'Groom Friend',
              phoneNumber: '+81 258 852 6699',
              email: 'wporganicthemes@gmail.com',
              invitationStatus: 'Confirmed',
              address: 'Morningview Lane Artlan..',
              comment: 'Excepteur sint occaecat cupidatat non proident sunt',
            ),
            GuestItem(
              guestName: 'Bomika Mahavar',
              group: 'Groom Friend',
              phoneNumber: '+81 258 852 6699',
              email: 'wporganicthemes@gmail.com',
              invitationStatus: 'Pending',
              address: 'Morningview Lane Artlan..',
              comment: 'Excepteur sint occaecat cupidatat non proident sunt',
            ),
            GuestItem(
              guestName: 'Somesh Mahavar',
              group: 'Groom Friend',
              phoneNumber: '+81 258 852 6699',
              email: 'wporganicthemes@gmail.com',
              invitationStatus: 'Confirmed',
              address: 'Morningview Lane Artlan..',
              comment: 'Excepteur sint occaecat cupidatat non proident sunt',
            ),
          ],
        ),
      ],
    );
    ;
  }
}
