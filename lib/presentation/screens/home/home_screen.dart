import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  List<String> tabTitle = [
    'START',
    'WYDARZENIA',
    'O GMINIE',
    'KONTAKT',
    'E-URZĄD',
  ];

  @override
  void initState() {
    controller = TabController(length: tabTitle.length, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          title: Text(tabTitle[controller.index]),
          bottom: TabBar(
              controller: controller,
              tabs: const [
                Tab(text: 'Start'),
                Tab(text: 'Wydarzenia'),
                Tab(text: 'O Gminie'),
                Tab(text: 'Kontakt'),
                Tab(text: 'E-Urząd'),
              ],
              labelPadding: const EdgeInsets.all(0)),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            Center(
              child: Text('Start'),
            ),
            Center(
              child: Text('Wydarzenia'),
            ),
            Center(
              child: Text('O Gminie'),
            ),
            Center(
              child: Text('Kontakt'),
            ),
            Center(
              child: Text('E-Urząd'),
            ),
          ],
        ));
  }
}
