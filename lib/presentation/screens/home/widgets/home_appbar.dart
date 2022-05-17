import 'package:flutter/material.dart';

import '../../../application/app_insets.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    required this.controller,
    required this.tabTitle,
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TabController controller;
  final List<String> tabTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      actions: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.menu,
          ),
          iconSize: AppInsets.xxMedium,
          //color: Colors.black,
          onPressed: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        ),
      ],
      title: Text(
        tabTitle[controller.index],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: const Color(0xFFB9B7B7),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        controller: controller,
        tabs: const [
          Tab(text: 'Start'),
          Tab(text: 'Wydarzenia'),
          Tab(text: 'O Gminie'),
          Tab(text: 'Kontakt'),
          Tab(text: 'E-Urząd'),
        ],
        labelPadding: const EdgeInsets.all(0),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
