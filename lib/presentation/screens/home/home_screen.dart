import 'package:flutter/material.dart';
import 'package:glogow_mlp/presentation/screens/home/widgets/home_appbar.dart';

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

      backgroundColor: const Color(0xFFF2F2F2),
      appBar: HomeAppbar(
        controller: controller,
        tabTitle: tabTitle,
      ),
      body: TabBarView(
        controller: controller,
        children: [
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
            child: Container(
              height: 100,
              width: 100,
              child: Image.network(
                'https://www.glogow-mlp.pl/images/2022/MAJ_2022/2022.05.05_Turniej_wiedzy_po%C5%BCarniczej_etap_gminny/zawody_po%C5%BCarnicze.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Text('E-Urząd'),
          ),
        ],
      ),
    );
  }
}
