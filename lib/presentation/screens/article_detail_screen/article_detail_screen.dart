// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glogow_mlp/foundation/articles.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articleId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final loadedArticle = Provider.of<Articles>(
      context,
      listen: false,
    ).findById(articleId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedArticle.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shadowColor: Colors.blue,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
              ),
              child: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    loadedArticle.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      shadows: const <Shadow>[
                        Shadow(
                            color: Colors.black,
                            offset: Offset(5, 5),
                            blurRadius: 30)
                      ],
                    ),
                  ),
                ),
                background: Hero(
                  tag: loadedArticle.id,
                  child: CachedNetworkImage(
                    imageUrl: loadedArticle.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(
                          //     Colors.blue, BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                Text(
                  loadedArticle.category,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  child: Text(
                    loadedArticle.description,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
