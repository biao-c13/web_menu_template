import 'package:flutter/material.dart';

import '../../costants/configs.dart';

class MenuAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); //advertises a preferred size which can be used by the parent
  const MenuAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: const Text("Menu"),
        centerTitle: true,
        leading: const Icon(Icons.dashboard),
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer(); //open the Drawer
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 2,
                        color: Color.fromARGB(255, 116, 142, 177))
                  ], shape: BoxShape.circle, color: Colors.white),
                  padding: const EdgeInsets.only(
                    bottom: 0,
                  ),
                  child: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 25,
                    color: Palette.colorPrimarySwatch,
                  ),
                ),
              ),
            );
          }),
        ],
        elevation: 34);
  }
}
