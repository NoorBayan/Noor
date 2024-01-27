import 'package:flutter/material.dart';

import '../../core/general/helpers/custom_logger.dart';
import 'widgets.dart';

/// This widget is used to wrap a list to add pagination loading more functionality.
class CustomListPaginationWidget extends StatefulWidget {
  const CustomListPaginationWidget({
    this.loadMoreOnScrollPositionToEnd = true,
    this.shrinkWrap = false,
    required this.itemBuilder,
    required this.isLoadingMore,
    required this.itemCount,
    this.lazyLoadingMoreWidget,
    required this.loadMoreFunction,
    Key? key,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.physics,
    this.separatorBuilder,
    this.primary,
    this.listKey,
    this.controller,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool isLoadingMore;
  final int itemCount;
  final Widget? lazyLoadingMoreWidget;
  final Future Function() loadMoreFunction;
  final bool loadMoreOnScrollPositionToEnd;
  final Widget Function(BuildContext, int)? separatorBuilder;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final bool? primary;
  final Key? listKey;
  final ScrollController? controller;

  //
  static Widget sliver({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required bool isLoadingMore,
    required int itemCount,
    Widget? lazyLoadingMoreWidget,
    required Future Function() loadMoreFunction,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Widget? header,
    ScrollPhysics? physics,
  }) {
    return _CustomListPaginationSliverWidget(
      itemBuilder: itemBuilder,
      isLoadingMore: isLoadingMore,
      itemCount: itemCount,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: loadMoreFunction,
      shrinkWrap: shrinkWrap,
      padding: padding,
      header: header,
      physics: physics,
    );
  }

  //

  static Widget gridView({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required bool isLoadingMore,
    required int itemCount,
    required SliverGridDelegate gridDelegate,
    required Future Function() loadMoreFunction,
    required ScrollController? controller,
    Widget? lazyLoadingMoreWidget,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    int countLoadMore = 1,
    ScrollPhysics? physics,
  }) {
    return _CustomListPaginationGridViewWidget(
      itemBuilder: itemBuilder,
      isLoadingMore: isLoadingMore,
      itemCount: itemCount,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: loadMoreFunction,
      shrinkWrap: shrinkWrap,
      padding: padding,
      controller: controller,
      gridDelegate: gridDelegate,
      countLoadMore: countLoadMore,
      physics: physics,
    );
  }

  static Widget gridViewSliver({
    required Widget Function(BuildContext context, int index) itemBuilder,
    required bool isLoadingMore,
    required int itemCount,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    required SliverGridDelegate gridDelegate,
    required Future Function() loadMoreFunction,
    Widget? lazyLoadingMoreWidget,
    int countLoadMore = 1,
  }) {
    return _CustomListPaginationGridViewSliverWidget(
      itemBuilder: itemBuilder,
      padding: padding,
      isLoadingMore: isLoadingMore,
      itemCount: itemCount,
      lazyLoadingMoreWidget: lazyLoadingMoreWidget,
      loadMoreFunction: loadMoreFunction,
      gridDelegate: gridDelegate,
      countLoadMore: countLoadMore,
    );
  }

  @override
  State<CustomListPaginationWidget> createState() =>
      _CustomListPaginationWidgetState();
}

class _CustomListPaginationWidgetState
    extends State<CustomListPaginationWidget> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.controller ?? ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 600) {
        widget.loadMoreFunction();
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: widget.separatorBuilder ??
          (context, index) {
            return const SizedBox.shrink();
          },
      key: widget.listKey,
      primary: widget.primary,
      scrollDirection: widget.scrollDirection,
      padding: widget.padding,
      shrinkWrap: widget.shrinkWrap,
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        // debugModePrint('index: $index itemCount: ${widget.itemCount}');
        // if (index == list.length) {
        //   return 30.h.sizedBoxH;
        // }

        if (index == widget.itemCount) {
          return _LoadingMore(
            isLoadingMore: widget.isLoadingMore,
            lazyLoadingMoreWidget: widget.lazyLoadingMoreWidget,
          );
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}

class _LoadingMore extends StatelessWidget {
  const _LoadingMore(
      {Key? key, required this.isLoadingMore, this.lazyLoadingMoreWidget})
      : super(key: key);

  final bool isLoadingMore;
  final Widget? lazyLoadingMoreWidget;

  @override
  Widget build(BuildContext context) {
    // return AnimatedCrossFade(
    //   duration: Duration(milliseconds: 700),
    //   firstChild: Container(
    //     height: 0,
    //     width: 0,
    //   ),
    //   secondChild: isLoadingMore
    //       ? lazyLoadingMoreWidget ?? Loading2()
    //       : Container(
    //           height: 0,
    //           width: 0,
    //         ),
    //   crossFadeState: isLoadingMore
    //       ? CrossFadeState.showSecond
    //       : CrossFadeState.showFirst,
    // );

    // AnimatedSwitcher(
    //   duration: Duration(milliseconds: 700),
    //   child:  isLoadingMore
    //       ?  lazyLoadingMoreWidget ?? Loading2()
    //       : SizedBox.shrink(),
    //   transitionBuilder: (child, animation) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    // );

    return Visibility(
      visible: isLoadingMore,
      child: Align(
        child: lazyLoadingMoreWidget ?? const Loading(),
        // alignment: FractionalOffset.bottomCenter,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

//
class _CustomListPaginationSliverWidget extends StatefulWidget {
  const _CustomListPaginationSliverWidget(
      {this.shrinkWrap = false,
      required this.itemBuilder,
      required this.isLoadingMore,
      required this.itemCount,
      this.lazyLoadingMoreWidget,
      required this.loadMoreFunction,
      Key? key,
      this.padding = EdgeInsets.zero,
      this.header,
      this.physics})
      : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool isLoadingMore;
  final int itemCount;
  final Widget? lazyLoadingMoreWidget;
  final Future Function() loadMoreFunction;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final Widget? header;
  final ScrollPhysics? physics;

  @override
  State<_CustomListPaginationSliverWidget> createState() =>
      _CustomListPaginationSliverWidgetState();
}

class _CustomListPaginationSliverWidgetState
    extends State<_CustomListPaginationSliverWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          widget.loadMoreFunction();
        }

        return false;
      },
      child: SliverPadding(
        padding: widget.padding,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // debugModePrint(
              //     'index: $index itemCount: ${widget.itemCount}');
              if (index == widget.itemCount) {
                return _LoadingMore(
                  isLoadingMore: widget.isLoadingMore,
                  lazyLoadingMoreWidget: widget.lazyLoadingMoreWidget,
                );
              }

              return widget.itemBuilder(context, index);
            },
            childCount: widget.itemCount + 1,
          ),
        ),
      ),
    );
  }
}

class _CustomListPaginationGridViewWidget extends StatefulWidget {
  const _CustomListPaginationGridViewWidget({
    this.shrinkWrap = false,
    required this.itemBuilder,
    required this.isLoadingMore,
    required this.itemCount,
    this.lazyLoadingMoreWidget,
    required this.loadMoreFunction,
    Key? key,
    this.padding = EdgeInsets.zero,
    required this.gridDelegate,
    this.scrollDirection = Axis.vertical,
    this.countLoadMore = 1,
    this.physics,
    this.controller,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool isLoadingMore;
  final int itemCount;
  final ScrollController? controller;
  final Widget? lazyLoadingMoreWidget;
  final Future Function() loadMoreFunction;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final SliverGridDelegate gridDelegate;
  final Axis scrollDirection;
  final int countLoadMore;
  final ScrollPhysics? physics;

  @override
  State<_CustomListPaginationGridViewWidget> createState() =>
      _CustomListPaginationGridViewWidgetState();
}

class _CustomListPaginationGridViewWidgetState
    extends State<_CustomListPaginationGridViewWidget> {
  late final ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = widget.controller ?? ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 600) {
        widget.loadMoreFunction();
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      scrollController.dispose();
    }
    //  scrollController.attach(position)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: widget.padding,
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.itemCount + widget.countLoadMore,
      gridDelegate: widget.gridDelegate,
      itemBuilder: (context, index) {
        // debugModePrint('index: $index itemCount: ${widget.itemCount}');
        if (index >= widget.itemCount) {
          return _LoadingMore(
            isLoadingMore: widget.isLoadingMore,
            lazyLoadingMoreWidget: widget.lazyLoadingMoreWidget,
          );
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}

class _CustomListPaginationGridViewSliverWidget extends StatefulWidget {
  const _CustomListPaginationGridViewSliverWidget({
    required this.itemBuilder,
    required this.isLoadingMore,
    required this.itemCount,
    this.lazyLoadingMoreWidget,
    this.padding = EdgeInsets.zero,
    required this.loadMoreFunction,
    Key? key,
    required this.gridDelegate,
    this.scrollDirection = Axis.vertical,
    this.countLoadMore = 1,
  }) : super(key: key);

  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool isLoadingMore;
  final int itemCount;
  final Widget? lazyLoadingMoreWidget;
  final Future Function() loadMoreFunction;
  final EdgeInsetsGeometry padding;
  final SliverGridDelegate gridDelegate;
  final Axis scrollDirection;
  final int countLoadMore;

  @override
  State<_CustomListPaginationGridViewSliverWidget> createState() =>
      _CustomListPaginationGridViewSliverWidgetState();
}

class _CustomListPaginationGridViewSliverWidgetState
    extends State<_CustomListPaginationGridViewSliverWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          widget.loadMoreFunction();
        }

        return false;
      },
      child: SliverPadding(
        padding: widget.padding,
        sliver: SliverGrid.builder(
          itemCount: widget.itemCount + widget.countLoadMore,
          gridDelegate: widget.gridDelegate,
          itemBuilder: (context, index) {
            // debugModePrint('index: $index itemCount: ${widget.itemCount}');
            if (index >= widget.itemCount) {
              return _LoadingMore(
                isLoadingMore: widget.isLoadingMore,
                lazyLoadingMoreWidget: widget.lazyLoadingMoreWidget,
              );
            }

            return widget.itemBuilder(context, index);
          },
        ),
      ),
    );
  }
}
