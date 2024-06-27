import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/infinity_list/infinity_list_fetch_new_item.dart';

class InfinityList extends StatelessWidget {
  InfinityList({
    required int itemsCount,
    required this.itemsBuilder,
    required this.fetchMore,
    required this.isLastPage,
    required this.isLoading,
    this.shrinkWrap = false,
    this.physics,
    this.separatorBuilder,
    this.cellSize = 1,
    this.cacheExtent,
    this.itemsInCellSpacing = 0.0,
    this.padding,
    this.scrollDirection = Axis.vertical,
  }) : _itemsCount = itemsCount;

  final EdgeInsets? padding;
  final double itemsInCellSpacing;
  final bool isLoading;
  final bool isLastPage;
  final Future<void> Function() fetchMore;
  final double? cacheExtent;
  final int cellSize;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final int _itemsCount;
  final Widget Function(BuildContext, int) itemsBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final Axis scrollDirection;

  int get cellsCount => (_itemsCount / cellSize).ceil() + 1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: shrinkWrap,
      itemCount: cellsCount,
      scrollDirection: scrollDirection,
      physics: physics,
      cacheExtent: cacheExtent,
      itemBuilder: _buildCell,
      separatorBuilder: _buildCellSepatator,
    );
  }

  Widget _buildCell(BuildContext context, int cellIndex) {
    if (cellIndex == cellsCount - 1) {
      return _buildLoaderCell();
    }
    return _buildItemsCell(cellIndex);
  }

  Widget _buildItemsCell(int cellIndex) {
    final firstItemInCellIndex = cellIndex * cellSize;
    var itemsInCellCount = cellSize;
    if (firstItemInCellIndex + cellSize >= _itemsCount) {
      itemsInCellCount = _itemsCount - firstItemInCellIndex;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return _buildCellLayout(
          children: List.generate(
            itemsInCellCount,
            (itemInCellIndex) {
              return _buildCellItemPadding(
                itemInCellIndex: itemInCellIndex,
                child: _buildCellItemSizedBox(
                  context,
                  constraints: constraints,
                  itemIndex: firstItemInCellIndex + itemInCellIndex,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCellLayout({required List<Widget> children}) {
    switch (scrollDirection) {
      case Axis.vertical:
        return Row(children: children);
      case Axis.horizontal:
        return Column(children: children);
    }
  }

  Widget _buildCellItemPadding({
    required Widget child,
    required int itemInCellIndex,
  }) {
    final isTopPaddingNeeded = scrollDirection == Axis.horizontal;
    final isLeftPaddingNeeded = scrollDirection == Axis.vertical;
    final paddingValue = itemInCellIndex != 0 ? itemsInCellSpacing : 0.0;
    return Padding(
      padding: EdgeInsets.only(
        top: isTopPaddingNeeded ? paddingValue : 0.0,
        left: isLeftPaddingNeeded ? paddingValue : 0.0,
      ),
      child: child,
    );
  }

  Widget _buildCellItemSizedBox(
    BuildContext context, {
    required BoxConstraints constraints,
    required int itemIndex,
  }) {
    final isHeightConstraintsRequired = scrollDirection == Axis.horizontal;
    final isWidthConstraintsRequired = scrollDirection == Axis.vertical;
    return SizedBox(
      height: isHeightConstraintsRequired
          ? _calculateItemRestrictionValue(maxValue: constraints.maxHeight)
          : null,
      width: isWidthConstraintsRequired
          ? _calculateItemRestrictionValue(maxValue: constraints.maxWidth)
          : null,
      child: itemsBuilder(context, itemIndex),
    );
  }

  double _calculateItemRestrictionValue({required double maxValue}) {
    return (maxValue - itemsInCellSpacing * (cellSize - 1)) / cellSize;
  }

  Widget _buildLoaderCell() {
    return InfinityListFetchMoreItem(
      fetchMore: fetchMore,
      isLastPage: isLastPage,
      isLoading: isLoading,
    );
  }

  Widget _buildCellSepatator(BuildContext context, int cellIndex) {
    final separatorBuilder = this.separatorBuilder;
    if (separatorBuilder == null) return SizedBox.shrink();
    final separatorBeforeLoaderCellIndex = cellsCount - 2;
    final isSeparatorBeforeLoaderNeedShowing =
        !isLoading && cellIndex == separatorBeforeLoaderCellIndex;
    if (isSeparatorBeforeLoaderNeedShowing) return SizedBox.shrink();
    return separatorBuilder(context, cellIndex);
  }
}
