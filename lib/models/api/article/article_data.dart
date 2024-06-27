import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/models/api/article/article_source_data.dart';
import 'package:news_app/models/entities/article/article.dart';

part 'article_data.g.dart';

@JsonSerializable()
class ArticleData {
  ArticleData({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  final ArticleSourceData source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? imageUrl;
  final String? publishedAt;
  final String? content;

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataToJson(this);

  Article toDomain() {
    return Article(
      source: source.toDomain(),
      author: author,
      title: title,
      description: description,
      url: url,
      imageUrl: imageUrl,
      publishedAt: publishedAt,
      content: content,
    );
  }
}
