import 'package:flutter/material.dart';

class DetailPageNewsCard extends StatelessWidget {
  const DetailPageNewsCard({
    super.key,
    required this.publishedAt,
    required this.title,
    required this.author,
  });

  final String publishedAt;
  final String title;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(publishedAt),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                author,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
