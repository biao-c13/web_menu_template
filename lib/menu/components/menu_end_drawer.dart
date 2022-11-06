import 'package:flutter/material.dart';
import 'package:web_menu_template/menu/components/menu_end_drawer_buildList.dart';

import '../../costants/configs.dart';

class MenuEndDrawer extends StatelessWidget {
  const MenuEndDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MenuEndDrawerBuildList(),
        ],
      ),
    );
  }
}
