import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/news_list_screen/state/news_list_screen_state.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NewsListScreenState>();
    return Padding(
        padding: const EdgeInsets.all(16),
          child: TextField(
            controller: context.select<NewsListScreenState, TextEditingController>((state) => state.searchBarController),
            onChanged: (text) {state.onSearchChanged(textQuery: text);},
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}