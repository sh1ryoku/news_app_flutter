import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/activity_indicator/activity_indicator.dart';

class InfinityListFetchMoreItem extends StatelessWidget {
  const InfinityListFetchMoreItem({
    super.key,
    required this.isLastPage,
    required this.isLoading,
    required this.fetchMore,
  });

  final bool isLastPage;
  final bool isLoading;
  final Future<void> Function() fetchMore;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isLastPage && !isLoading) {
        fetchMore();
      }
    });
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: ActivityIndicator(isBackgroundShowing: false),
      );
    }
    return const SizedBox.shrink();
  }
}
