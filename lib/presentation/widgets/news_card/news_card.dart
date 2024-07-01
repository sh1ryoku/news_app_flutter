import 'package:flutter/material.dart';
import 'package:news_app/models/entities/article/article.dart';
import 'package:news_app/presentation/screens/news_detail_page_screen/screen/news_detail_page_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final String title = article.title ?? '';
    final String publishedAt = article.publishedAt ?? '';
    final String author = article.author ?? '';
    final String content = article.content ?? '';
    final String imageUrl = article.imageUrl ?? '';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey,
        child: GestureDetector(
          onTap: (() => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailPageScreen(
                        title: title,
                        author: author,
                        publishedAt: publishedAt,
                        content: content,
                        imageUrl: imageUrl,
                      )))),
          child: SizedBox(
            height: 170,
            child: Stack(children: [
              if (imageUrl.isNotEmpty)
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            author,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(publishedAt),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
