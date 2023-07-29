import 'package:flutter/material.dart';

class GuestItem extends StatelessWidget {
  final String guestName;
  final String group;
  final String phoneNumber;
  final String email;
  final String invitationStatus;
  final String address;
  final String comment;

  const GuestItem({
    super.key,
    required this.guestName,
    required this.group,
    required this.phoneNumber,
    required this.email,
    required this.invitationStatus,
    required this.address,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        title: Text(guestName),
        subtitle: Text(group),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                // Edit action
              },
              child: Icon(Icons.edit),
            ),
            SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                // Delete action
              },
              child: Icon(Icons.delete),
            ),
          ],
        ),
        onTap: () {
          // Guest item click action
        },
      ),
    );
  }
}
