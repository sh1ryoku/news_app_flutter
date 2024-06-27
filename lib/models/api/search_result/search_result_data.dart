import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/models/api/article/article_data.dart';
import 'package:news_app/models/entities/search_result/search_result.dart';

part 'search_result_data.g.dart';

@JsonSerializable()
class SearchResultData {
  SearchResultData({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<ArticleData> articles;

  factory SearchResultData.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);

  SearchResult toDomain() {
    return SearchResult(
      status: status,
      totalResults: totalResults,
      articles: articles.map((article) => article.toDomain()).toList(),
    );
  }
}
