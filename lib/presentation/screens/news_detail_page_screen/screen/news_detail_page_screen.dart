import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/detail_page_news_card/detail_page_news_card.dart';

import '../../../../models/entities/article/article.dart';

class NewsDetailPageScreen extends StatelessWidget {
  const NewsDetailPageScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: buildImage(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: buildContentText(),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: DetailPageNewsCard(article: article),
          ),
        ],
      ),
    );
  }

  Widget buildContentText() {
    final content = article.content;
    if (content == null) return const SizedBox.shrink();
    return Text(content);
  }

  Widget buildImage() {
    final imageUrl = article.imageUrl;
    if (imageUrl == null) return const SizedBox.shrink();
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
