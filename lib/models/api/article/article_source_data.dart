import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/models/entities/article/article_source.dart';

part 'article_source_data.g.dart';

@JsonSerializable()
class ArticleSourceData {
  ArticleSourceData({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory ArticleSourceData.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleSourceDataToJson(this);

  ArticleSource toDomain() {
    return ArticleSource(
      id: id,
      name: name,
    );
  }
}
