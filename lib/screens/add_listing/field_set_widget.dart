import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

class AddFieldMainWidget extends StatelessWidget {
  final List<Widget>? inputList;
  final IconData? icon;
  final String? title;
  final String? description;

  const AddFieldMainWidget(
      {super.key, this.inputList, this.icon, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          border: Border.all(color: ViwahaColor.primary),
          color: ViwahaColor.primary,
        ), // where to position the child
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              child: Icon(
                            icon,
                            color: Colors.white,
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              child: Text(
                            title.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                        ],
                      ),
                      SizedBox(
                          child: Text(
                        description.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      )),
                    ]),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: inputList!,
                ),
              ),
            ]),
      ),
    );
  }
}
