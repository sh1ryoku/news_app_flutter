import 'package:flutter/material.dart';

import '../../../models/entities/article/article.dart';

class DetailPageNewsCard extends StatelessWidget {
  const DetailPageNewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 100,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildPublishedAtText(),
              buildTitleText(),
              buildAuthorText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPublishedAtText() {
    final publishedAt = article.publishedAt;
    if (publishedAt == null) return const SizedBox.shrink();
    return Text(publishedAt);
  }

  Widget buildTitleText() {
    final title = article.title;
    if (title == null) return const SizedBox.shrink();
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildAuthorText() {
    final author = article.author;
    if (author == null) return const SizedBox.shrink();
    return Text(
      author,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
