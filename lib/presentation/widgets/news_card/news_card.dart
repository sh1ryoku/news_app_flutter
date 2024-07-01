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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        color: Colors.grey,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPageScreen(
                article: article
              ),
            ),
          ),
          child: SizedBox(
            height: 170,
            child: Stack(children: [
              Positioned.fill(
                child: buildImage(),
              ),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: buildTitleText(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: buildAuthorText(),
                        ),
                        buildPublishedAtText(),
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

  Widget buildTitleText() {
    final title = article.title;
    if (title == null) return const SizedBox.shrink();
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildAuthorText() {
    final author = article.author;
    if (author == null) return const SizedBox.shrink();
    return Text(
      author,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildPublishedAtText() {
    final publishedAt = article.publishedAt;
    if (publishedAt == null) return const SizedBox.shrink();
    return Text(publishedAt);
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
