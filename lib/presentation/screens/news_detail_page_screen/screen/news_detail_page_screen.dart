import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/detail_page_news_card/detail_page_news_card.dart';

class NewsDetailPageScreen extends StatelessWidget {
  const NewsDetailPageScreen({
    super.key,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.content,
    required this.imageUrl,
  });

  final String title;
  final String author;
  final String publishedAt;
  final String content;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(content),
                ),
              )
            ],
          ),
          Center(
            child: DetailPageNewsCard(
              publishedAt: publishedAt,
              title: title,
              author: author,
            ),
          ),
        ],
      ),
    );
  }
}
