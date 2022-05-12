import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    required this.controller,
    required this.tabTitle,
    Key? key,
  }) : super(key: key);
  final TabController controller;
  final List<String> tabTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      title: Text(
        tabTitle[controller.index],
        style: const TextStyle(
          color: Colors.black,
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
