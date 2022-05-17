import 'package:flutter/material.dart';
import 'package:glogow_mlp/presentation/screens/home/start_screen.dart';
import 'package:glogow_mlp/presentation/screens/home/widgets/drawer.dart';
import 'package:glogow_mlp/presentation/screens/home/widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
      endDrawer: AppDrawer(),
      key: scaffoldKey,
      extendBody: true,
      appBar: HomeAppbar(
        controller: controller,
        tabTitle: tabTitle,
        scaffoldKey: scaffoldKey,
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          StartScreen(),
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
      ),
    );
  }
}
