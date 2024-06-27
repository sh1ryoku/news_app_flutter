import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/domain/use_cases/search_headlines/search_headlines_case.dart';
import 'package:news_app/domain/use_cases/search_news/search_news_case.dart';
import 'package:news_app/models/entities/article/article.dart';
import 'package:news_app/models/entities/article/articles_page.dart';

class NewsListScreenState extends ChangeNotifier {
  NewsListScreenState({
    required SearchNewsCase searchNewsCase,
    required SearchHeadlinesCase searchHeadlinesCase,
  })  : _searchNewsCase = searchNewsCase,
        _searchNewsHeadlinesCase = searchHeadlinesCase;

  final SearchNewsCase _searchNewsCase;
  final SearchHeadlinesCase _searchNewsHeadlinesCase;
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  int _pageNumber = 0;
  int _totalResults = 0;

  bool get isLastPage => _pageNumber < _totalResults / 10;
  final int _firstPageNumber = 1;
  bool isLoading = false;

  Future<void> refresh() async {
    _articles = [];
    _pageNumber = _firstPageNumber;
    await fetchNewPage();
    notifyListeners();
  }

  Future<void> fetchNews() async {
    try {
      _articles = await _searchNewsCase.run(
        query: 'Obama',
        page: 1,
        pageSize: 10,
      );
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> fetchNewPage() async => _fetchHeadlines();

  Future<void> _fetchHeadlines() async {
    try {
      isLoading = true;
      _pageNumber++;
      final ArticlesPage articlesPage = await _searchNewsHeadlinesCase.run(
        category: 'general',
        page: _pageNumber,
        pageSize: 10,
      );
      _articles.addAll(articlesPage.articles);
      _totalResults = articlesPage.totalResults;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }
}
