import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: title == 'Post Your Listing'
              ? const Color(0xff21B6A8).withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
        ),
        child: Icon(icon,
            color: title == 'Post Your Listing'
                ? const Color(0xff21B6A8)
                : Colors.black),
      ),
      title: Text(title,
          style: Theme.of(context).textTheme.bodyText1?.apply(
              color: title == 'Post Your Listing'
                  ? const Color(0xff21B6A8)
                  : textColor)),
      trailing: endIcon
          ? Icon(Icons.arrow_forward_ios_outlined,
              size: 18.0,
              color: title == 'Post Your Listing'
                  ? const Color(0xff21B6A8)
                  : Colors.grey)
          : null,
    );
  }
}
