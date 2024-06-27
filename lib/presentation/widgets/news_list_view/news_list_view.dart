import 'package:flutter/material.dart';
import 'package:news_app/models/entities/article/article.dart';
import 'package:news_app/presentation/screens/news_list_screen/state/news_list_screen_state.dart';
import 'package:news_app/presentation/widgets/infinity_list/infinity_list.dart';
import 'package:news_app/presentation/widgets/news_card/news_card.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = context.select<NewsListScreenState, List<Article>>(
      (state) => state.articles,
    );

    return InfinityList(
      itemsCount: articles.length,
      itemsBuilder: (context, index) {
        final article = articles[index];
        return NewsCard(article: article);
      },
      fetchMore: context.read<NewsListScreenState>().fetchNewPage,
      isLastPage: context
          .select<NewsListScreenState, bool>((state) => state.isLastPage),
      isLoading:
          context.select<NewsListScreenState, bool>((state) => state.isLoading),
    );
  }
}
