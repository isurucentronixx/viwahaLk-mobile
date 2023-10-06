import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoListingPage extends ConsumerWidget {
  const NoListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
            opacity: 0.5,
            child: Icon(Icons.comments_disabled_outlined,
                size: 50, color: Colors.grey)),
        Text(
          "No listings were found",
          style: TextStyle(
              fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 50,
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       'Searching...',
        //       style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.grey,
        //           fontWeight: FontWeight.w500),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: SizedBox(
        //         width: 20,
        //         height: 20,
        //         child: CircularProgressIndicator(
        //           strokeWidth: 2,
        //         ),
        //       ),
        //     )
        //   ],
        // )
      ],
    ));
  }
}
