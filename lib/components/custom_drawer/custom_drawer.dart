import 'package:flutter/material.dart';
import 'package:xlo_spark/components/custom_drawer/page_section.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
            child: ListView(
          children: [CustomDrawerHeader(), PageSection()],
        )),
      ),
    );
  }
}
