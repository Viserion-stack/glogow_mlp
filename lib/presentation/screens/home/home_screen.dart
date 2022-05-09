import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  //late Animation<Offset> _animation;
  late Animation<double> _animation;

  @override
  void initState() {
    // _controller = AnimationController(
    //   duration: const Duration(seconds: 1),
    //   vsync: this,
    // )..forward();

    // _animation = Tween<Offset>(
    //   begin: const Offset(5, 0.0),
    //   end: const Offset(0.0, 0.0),
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeIn,
    // ));
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      ShimmerLoading() //CircularProgressIndicator.adaptive(),
                  );
            }

            final documents = snapshot.data!.docs;
            return ListView.builder(
              // key: _myListKey,
              itemCount: documents.length,
              itemBuilder: (
                context,
                index,
              ) {
                return FadeTransition(
                  opacity: _animation,
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25, child: Text(documents[index]['name'])),
                    subtitle: Text(documents[index]['description']),
                  ),
                );
              },
            );
            //Container(child: Text(documents[2]['name']));
          },
        ),
      ),
    );
  }
}

//TODO Przenieść do innego miejsca.

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const ShimmerWidget.circular(width: 64, height: 64),
          title: Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 16,
            ),
          ),
          subtitle: const ShimmerWidget.rectangular(height: 16),
        );
      },
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {Key? key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder(),
        super(key: key);
  const ShimmerWidget.circular(
      {Key? key,
      this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 219, 215, 215),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(shape: shapeBorder, color: Colors.grey),
        //color: Colors.grey,
      ),
    );
  }
}
