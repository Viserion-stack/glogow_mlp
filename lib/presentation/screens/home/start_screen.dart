import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glogow_mlp/foundation/article.dart';
import 'package:glogow_mlp/presentation/application/theme.dart';
import 'package:glogow_mlp/presentation/screens/article_detail_screen/article_detail_screen.dart';
import 'package:glogow_mlp/presentation/screens/home/widgets/home_appbar.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


import '../../application/theme.dart';

import '../../../foundation/articles.dart';



class StartScreen extends StatefulWidget {
  const StartScreen({
    Key? key,
    // required this.user,
  }) : super(key: key);

  // final User user;

  static const String routeName = '/home';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
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
          stream: FirebaseFirestore.instance.collection('post').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      ShimmerLoading() //CircularProgressIndicator.adaptive(),
                  );
            }
            List<Article> _articles = [];

            final documents = snapshot.data!.docs;

            for (var element in documents) {
              _articles.add(
                Article(
                  addedAt: element['addedAt'].toDate(),
                  articleUrl: element['articleUrl'],
                  category: element['category'],
                  description: element['description'],
                  id: element['id'],
                  imageUrl: element['imageUrl'],
                  title: element['title'],
                ),
              );
            }
            Provider.of<Articles>(context, listen: false)
                .addArticles(_articles);

            return Column(
              children: [
                Card(
                  child: Consumer<ThemeNotifier>(
                    builder: (context, notifier, _) {
                      return SwitchListTile.adaptive(
                        secondary: notifier.isDark
                            ? Icon(
                                Icons.dark_mode,
                                color: Colors.amber.shade700,
                              )
                            : Icon(
                                Icons.light_mode,
                                color: Colors.amber.shade700,
                              ),
                        title: notifier.isDark
                            ? const Text('Dark mode')
                            : const Text('Light mode'),
                        value: notifier.isDark,
                        onChanged: (value) {
                          notifier.toogleTheme(value);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    // key: _myListKey,
                    itemCount: documents.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return FadeTransition(
                        opacity: _animation,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                ArticleDetailScreen.routeName,
                                arguments: documents[index]['id']);
                          },
                          child: ListTile(
                            leading: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Hero(
                                tag: documents[index]['id'],
                                child: FadeInImage(
                                  image: NetworkImage(
                                      documents[index]['imageUrl']),
                                  placeholder:
                                      const AssetImage('assets/placeholder.png')
                                          as ImageProvider,
                                ),
                              ),
                            ),
                            title: Text(
                              documents[index]['title'],
                              maxLines: 1,
                            ),
                            subtitle: Text(
                              documents[index]['description'],
                              maxLines: 2,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const ShimmerWidget.rectangular(
            width: 80,
            height: 64,
          ),
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
      baseColor: const Color.fromARGB(
        255,
        219,
        215,
        215,
      ),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shapeBorder,
          color: Colors.grey,
        ),
      ),
    );
  }
}
