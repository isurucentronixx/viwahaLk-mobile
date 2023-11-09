import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoListingPage extends ConsumerStatefulWidget {
  const NoListingPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoListingPageState();
}

class _NoListingPageState extends ConsumerState<NoListingPage> {
  bool isLoding = false;
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoding = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoding
        ? const Center(
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
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ))
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
