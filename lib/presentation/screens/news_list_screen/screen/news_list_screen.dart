import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/presentation/screens/news_list_screen/state/news_list_screen_state.dart';
import 'package:news_app/presentation/widgets/app_bar/app_bar.dart';
import 'package:news_app/presentation/widgets/news_list_view/news_list_view.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsListScreenState>(
      create: (context) {
        return GetIt.I.get<NewsListScreenState>();
      },
      child: const Scaffold(
        appBar: AppBarWidget(),
        body: NewsListView(),
      ),
    );
  }
}
