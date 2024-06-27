import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/domain/use_cases/search_headlines/search_headlines_case.dart';
import 'package:news_app/domain/use_cases/search_news/search_news_case.dart';
import 'package:news_app/models/entities/article/article.dart';

class NewsListScreenState extends ChangeNotifier {
  NewsListScreenState({
    required SearchNewsCase searchNewsCase,
    required SearchHeadlinesCase searchHeadlinesCase,
  })  : _searchNewsCase = searchNewsCase,
        _searchNewsHeadlinesCase = searchHeadlinesCase {
    fetchNewPage();
  }

  final SearchNewsCase _searchNewsCase;
  final SearchHeadlinesCase _searchNewsHeadlinesCase;
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  int _pageNumber = 0;
  int _totalResults = 0;

  final _pageSize = 10;

  bool get isLastPage => _pageNumber >= _totalResults / 10;
  final int _firstPageNumber = 0;
  bool isLoading = false;

  final searchBarController = TextEditingController();

  String query = '';

  Timer? _debounce;

  Future<void> refresh() async {
    _articles = [];
    _pageNumber = _firstPageNumber;
    await fetchNewPage();
    notifyListeners();
  }

  Future<void> _fetchNews() async {
    try {
      isLoading = true;
      notifyListeners();
      _pageNumber++;
      final articlesPage = await _searchNewsCase.run(
        query: query,
        page: _pageNumber,
        pageSize: _pageSize,
      );
      _articles.addAll(articlesPage.articles);
      _totalResults = articlesPage.totalResults;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }

  Future<void> fetchNewPage() async {
    if (query.isEmpty) {
      _fetchHeadlines();
    } else {
      _fetchNews();
    }
  }

  Future<void> _fetchHeadlines() async {
    try {
      isLoading = true;
      notifyListeners();
      _pageNumber++;
      final articlesPage = await _searchNewsHeadlinesCase.run(
        category: 'general',
        page: _pageNumber,
        pageSize: _pageSize,
      );
      _articles.addAll(articlesPage.articles);
      _totalResults = articlesPage.totalResults;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      log(error.toString());
    }
  }

  void onSearchChanged({required String textQuery}) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      refresh();
      query = textQuery;
      fetchNewPage();
    });
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }
}
