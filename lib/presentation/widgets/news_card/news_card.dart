import 'package:flutter/material.dart';
import 'package:news_app/models/entities/article/article.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey,
        child: Stack(children: [
          SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (article.title != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(article.title!),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (article.author != null) Text(article.author!),
                      if (article.publishedAt != null)
                        Text(article.publishedAt!),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
