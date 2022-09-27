import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_spark/screens/create/components/image_source_modal.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child: GestureDetector(
              onTap: () {
                if (Platform.isAndroid) {
                  showModalBottomSheet(
                      context: context, builder: (_) => ImageSourceModal());
                } else {
                  showCupertinoModalPopup(
                      context: context, builder: (_) => ImageSourceModal());
                }
              },
              child: CircleAvatar(
                radius: 44,
                backgroundColor: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}