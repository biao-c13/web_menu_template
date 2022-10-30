import 'package:flutter/material.dart';

import '../../costants/configs.dart';

class MenuEndDrawer extends StatelessWidget {
  const MenuEndDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.list),
            title: Text("GFG item $index"),
            trailing: Icon(Icons.done),
          );
        },
      ),
    );
  }
}
