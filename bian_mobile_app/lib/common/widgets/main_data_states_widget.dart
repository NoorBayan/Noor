import 'package:bian_mobile_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../core/general/helpers/base_change_notifier.dart';
import '../../core/general/theme/theme.dart';
import 'lazy_loading_card_widget.dart';

class MainDataStatesWidget extends StatelessWidget {
  const MainDataStatesWidget({
    Key? key,
    this.baseNotifier,
    this.isLoading,
    this.isEmpty = false,
    this.hasError,
    required this.dataWidget,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
  }) : super(key: key);
  final bool? isLoading;
  final bool isEmpty;
  final bool? hasError;
  final Widget? loadingWidget;
  final BaseChangeNotifier? baseNotifier;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget dataWidget;
  @override
  Widget build(BuildContext context) {
    final isLoading = this.isLoading ?? baseNotifier?.isLoading ?? false;
    final hasError = this.hasError ?? baseNotifier?.hasError ?? false;
    if (isLoading) {
      return _BuildLoadingWidget(
        loadingWidget: loadingWidget,
      );
    }
    if (hasError) {
      return _BuildErrorWidget(
        errorWidget: errorWidget,
      );
    }
    if (isEmpty) {
      return _BuildEmptyWidget(
        emptyWidget: emptyWidget,
      );
    }
    return dataWidget;
  }
}

class _BuildLoadingWidget extends StatelessWidget {
  const _BuildLoadingWidget({this.loadingWidget});
  final Widget? loadingWidget;
  @override
  Widget build(BuildContext context) {
    if (loadingWidget != null) return loadingWidget!;
    return const Center(
      child: Loading(),
    );
  }
}

class _BuildErrorWidget extends StatelessWidget {
  const _BuildErrorWidget({this.errorWidget});
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    if (errorWidget != null) return errorWidget!;
    return Center(
      child: Text("An error occurred, no items!"),
    );
  }
}

class _BuildEmptyWidget extends StatelessWidget {
  const _BuildEmptyWidget({this.emptyWidget});
  final Widget? emptyWidget;
  @override
  Widget build(BuildContext context) {
    if (emptyWidget != null) return emptyWidget!;
    return Center(
      child: Text("Empty no items !"),
    );
  }
}
