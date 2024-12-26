import 'package:flutter/material.dart';
import 'package:newsappppppp/controller/categorycontroller.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatelessWidget {
  final String category;

  const NewsListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final newsController = context.watch<CategoryController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: newsController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsController.newsTopics.length,
              itemBuilder: (context, index) {
                final article = newsController.newsTopics[index];
                return ListTile(
                  title: Text(article.title.toString()),
                  subtitle: Text(article.description.toString()),
                  leading: Image.network(article.urlToImage.toString(),)
                );
              },
            ),
    );
  }
}
