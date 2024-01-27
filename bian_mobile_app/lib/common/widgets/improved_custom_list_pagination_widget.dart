import 'package:flutter/material.dart';

import '../../core/general/helpers/base_list_change_notifier.dart';
import 'custom_list_pagination_widget.dart';

/// This widget is used to wrap a list to add pagination loading more functionality.
class ImprovedCustomListPaginationWidget extends StatelessWidget {
  const ImprovedCustomListPaginationWidget({
    this.loadMoreOnScrollPositionToEnd = true,
    this.shrinkWrap = false,
    required this.itemBuilder,
    this.lazyLoadingMoreWidget,
    Key? key,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.separatorBuilder,
    this.primary,
    this.listKey,
    required this.baseList,
    this.controller,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget? lazyLoadingMoreWidget;
  final bool loadMoreOnScrollPositionToEnd;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool? primary;
  final Key? listKey;
  final ScrollController? controller;
  final BaseListChangeNotifier baseList;

  //
  static Widget sliver({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required BaseListChangeNotifier baseList,
    Widget? lazyLoadingMoreWidget,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Widget? header,
    ScrollPhysics? physics,
  }) {
    return CustomListPaginationWidget.sliver(
      itemBuilder: itemBuilder,
      isLoadingMore: baseList.isLoadingMore,
      itemCount: baseList.list.length,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: baseList.loadMore,
      shrinkWrap: shrinkWrap,
      padding: padding,
      header: header,
      physics: physics,
    );
  }

  //

  static Widget gridView({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required BaseListChangeNotifier baseList,
    required SliverGridDelegate gridDelegate,
    Widget? lazyLoadingMoreWidget,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    int countLoadMore = 1,
    ScrollPhysics? physics,
    ScrollController? controller,
  }) {
    return CustomListPaginationWidget.gridView(
      itemBuilder: itemBuilder,
      controller: controller,
      isLoadingMore: baseList.isLoadingMore,
      itemCount: baseList.list.length,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: baseList.loadMore,
      shrinkWrap: shrinkWrap,
      padding: padding,
      gridDelegate: gridDelegate,
      countLoadMore: countLoadMore,
      physics: physics,
    );
  }

  static Widget gridViewSliver({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required BaseListChangeNotifier baseList,
    required SliverGridDelegate gridDelegate,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Widget? lazyLoadingMoreWidget,
    int countLoadMore = 1,
  }) {
    return CustomListPaginationWidget.gridViewSliver(
      itemBuilder: itemBuilder,
      isLoadingMore: baseList.isLoadingMore,
      itemCount: baseList.list.length,
      padding: padding,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: baseList.loadMore,
      gridDelegate: gridDelegate,
      countLoadMore: countLoadMore,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomListPaginationWidget(
        itemBuilder: itemBuilder,
        isLoadingMore: baseList.isLoadingMore,
        itemCount: baseList.list.length,
        controller: controller,
        separatorBuilder: separatorBuilder,
        key: key,
        lazyLoadingMoreWidget: lazyLoadingMoreWidget,
        listKey: listKey,
        loadMoreOnScrollPositionToEnd: loadMoreOnScrollPositionToEnd,
        padding: padding,
        physics: physics,
        primary: primary,
        scrollDirection: scrollDirection,
        shrinkWrap: shrinkWrap,
        loadMoreFunction: baseList.loadMore);
  }
}
