import 'package:bian_mobile_app/core/general/util/extensions/object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'components/item_widget.dart';

import '../../../../core/general/helpers/base_change_notifier.dart';
import '../../../../core/general/helpers/custom_logger.dart';
import '../../../../core/general/helpers/flash_bar_helper.dart';
import '../../../../core/general/theme/app_colors.dart';
import '../../../../core/general/theme/text_style.dart';
import '../../../../core/general/util/data_format.dart';
import '../../custom_bottom_sheet.dart';
import '../../custom_button.dart';
import '../../custom_icon.dart';
import 'components/components.dart';

part 'multi_select_bottom_sheet_controller.dart';

typedef ItemBuilderMultiSelect = Widget Function(BuildContext context);

class MultiSelectBottomSheetView<T> extends HookWidget {
  //
  static final double itemHeight = 68.h;
  static final double itemBorderRadius = 16.r;
  static final double itemBorderWidth = 1.r;
  static const Color itemSelectColor = AppColors.primaryColors;
  static const Color itemTextSelectColor = AppColors.primaryColors;
  static const Color itemTextUnSelectColor = AppColors.fontPrimaryColor;
  static final Color itemUnSelectColor =
      AppColors.disabledColor.withOpacity(0.4);

  const MultiSelectBottomSheetView({
    Key? key,
    required this.controller,
    required this.title,
    required this.height,
    this.subTitle,
    this.getItemSelectedWidget,
    this.getItemUnSelectedWidget,
    this.customSelectAllWidget,
    this.listIconsItem,
    this.iconItemColor,
    this.iconItemSize,
    this.prefixIconType,
    this.buttonText,
    this.isSearchEnabled = false,
    this.subtitleAlignment,
    this.titleAlignment,
    this.trailingWidget,
    this.selectAllText,
    this.isCustomItem = false,
  }) : super(key: key);

  final MultiSelectBottomSheetController<T> controller;
  final String title;
  final double? height;
  final String? subTitle;
  final AlignmentGeometry? titleAlignment;
  final bool isCustomItem;
  final Widget Function(T item)? getItemSelectedWidget;
  final Widget Function(T item)? getItemUnSelectedWidget;
  final Widget Function(bool isSelectAll)? customSelectAllWidget;
  final List<String>? listIconsItem;
  final Color? iconItemColor;
  final Size? iconItemSize;
  final String? buttonText;
  final String? selectAllText;
  final IconTypes? prefixIconType;
  final AlignmentGeometry? subtitleAlignment;
  final bool isSearchEnabled;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    var scrollController = useScrollController();

    return CustomBottomSheet(
        isChildExpanded: false,
        child: AnimatedBuilder(
            animation: controller,
            builder: (ctx, child) {
              return Container(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BuildTitle(
                      title: title,
                      titleAlignment: titleAlignment,
                    ),
                    _BuildSubtitleIfNotNull(
                      subTitle: subTitle,
                      subtitleAlignment: subtitleAlignment,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: height ?? double.infinity,
                        minWidth: double.infinity,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        child: controller.isLoading
                            ? const _BuildLoading()
                            : ListView(
                                shrinkWrap: true,
                                controller: scrollController,
                                children: [
                                  _BuildAllItemsSelectedIfWithSelectAll(
                                      selectAllText: selectAllText,
                                      customSelectAllWidget:
                                          customSelectAllWidget,
                                      controller: controller),
                                  _BuildItems(
                                    scrollController: scrollController,
                                    controller: controller,
                                    isCustomItem: isCustomItem,
                                    getItemSelectedWidget:
                                        getItemSelectedWidget,
                                    getItemUnSelectedWidget:
                                        getItemUnSelectedWidget,
                                    iconItemColor: iconItemColor,
                                    iconItemSize: iconItemSize,
                                    listIconsItem: listIconsItem,
                                    prefixIconType: prefixIconType,
                                  )
                                ],
                              ),
                      ),
                    ),
                    if (trailingWidget.isNotNull) trailingWidget!,
                    SizedBox(
                      height: 20.h,
                    ),
                    _BuildSubmitButton(
                        controller: controller, buttonText: buttonText),
                    20.verticalSpace,
                    MediaQuery.of(context).padding.bottom.verticalSpace,
                  ],
                ),
              );
            }));
  }

  static Widget itemSelectedWidget({
    Key? key,
    String? label,
    ItemBuilderMultiSelect? labelWidgetBuilder,
    void Function()? onPressed,
    String? prefixIcon,
    Color? iconItemColor,
    Color? colorLabel,
    Size? iconItemSize,
    IconTypes? prefixIconType,
  }) =>
      ItemSelectedWidget(
        key: key,
        label: label,
        labelWidgetBuilder: labelWidgetBuilder,
        onPressed: onPressed,
        prefixIcon: prefixIcon,
        prefixIconType: prefixIconType,
        iconItemColor: iconItemColor,
        iconItemSize: iconItemSize,
        colorLabel: colorLabel,
      );

  static Widget itemUnSelectedWidget({
    Key? key,
    String? label,
    ItemBuilderMultiSelect? labelWidgetBuilder,
    void Function()? onPressed,
    String? prefixIcon,
    Color? iconItemColor,
    Color? colorLabel,
    Size? iconItemSize,
    IconTypes? prefixIconType,
  }) =>
      ItemUnSelectedWidget(
        key: key,
        label: label,
        labelWidgetBuilder: labelWidgetBuilder,
        onPressed: onPressed,
        prefixIcon: prefixIcon,
        prefixIconType: prefixIconType,
        iconItemColor: iconItemColor,
        iconItemSize: iconItemSize,
        colorLabel: colorLabel,
      );

  static Future<List<T>?> show<T>({
    required BuildContext context,
    required String title,
    String? subTitle,
    List<T>? listItem,
    AlignmentGeometry? titleAlignment,
    Future<List<T>> Function()? asyncListItem,
    String Function(T item)? getItemText,
    bool isCustomItem = false,
    Widget Function(T item)? getItemSelectedWidget,
    Widget Function(T item)? getItemUnSelectedWidget,
    Widget Function(bool isSelectAll)? customSelectAllWidget,
    List<String>? listIconsItem,
    Color? iconItemColor,
    Size? iconItemSize,
    AlignmentGeometry? subtitleAlignment,
    IconTypes? prefixIconType,
    required List<T> itemsSelected,
    String? buttonText,
    String? selectAllText,
    int? maxSelected,
    double? height,
    int minSelected = 1,
    String? textErrorMaxSelected,
    bool Function(dynamic item, bool isSelected)? beforeItemSelected,
    bool isMultiSelect = true,
    bool isWithSelectAll = false,
    bool isReadOnly = false,
    Widget? trailingWidget,
    bool isSearchEnabled = false,
  }) async {
    assert(!(listItem == null && asyncListItem == null));
    // assert(isCustomItem &&
    //     (getItemSelectedWidget != null && getItemUnSelectedWidget != null) );

    logger.i('itemsSelected');
    logger.i(itemsSelected);

    double maxHeight = (0.85.sh - 163.h);
    if (isSearchEnabled) {
      maxHeight -= 64.h;
    }
    if (height.isNull) {
      height = listItem == null ? maxHeight : (listItem.length * 74.h);
    }
    if (height! > maxHeight) {
      height = maxHeight;
    }

    MultiSelectBottomSheetController<T> _controller =
        MultiSelectBottomSheetController<T>();

    _controller.init(
      itemsSelected: itemsSelected,
      asyncListItem: asyncListItem,
      listItem: listItem,
      beforeItemSelected: beforeItemSelected,
      getItemText: getItemText,
      isMultiSelect: isMultiSelect,
      maxSelected: maxSelected,
      minSelected: minSelected,
      textErrorMaxSelected: textErrorMaxSelected,
      isWithSelectAll: isWithSelectAll,
      isReadOnly: isReadOnly,
    );

    List<T>? listResult = await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        useRootNavigator: true,
        builder: (ctx) {
          return MultiSelectBottomSheetView<T>(
            controller: _controller,
            title: title,
            height: height,
            subTitle: subTitle,
            isSearchEnabled: isSearchEnabled,
            getItemSelectedWidget: getItemSelectedWidget,
            getItemUnSelectedWidget: getItemUnSelectedWidget,
            listIconsItem: listIconsItem,
            titleAlignment: titleAlignment,
            trailingWidget: trailingWidget,
            iconItemColor: iconItemColor,
            subtitleAlignment: subtitleAlignment,
            iconItemSize: iconItemSize,
            buttonText: buttonText ?? "ok",
            isCustomItem: isCustomItem,
            customSelectAllWidget: customSelectAllWidget,
            selectAllText: selectAllText,
            prefixIconType: prefixIconType,
          );
        });

    return listResult;
  }
}

class _BuildSubmitButton extends StatelessWidget {
  const _BuildSubmitButton({
    Key? key,
    required this.controller,
    required this.buttonText,
  }) : super(key: key);

  final MultiSelectBottomSheetController controller;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.pop(
          context,
          controller.itemsSelected,
        );
      },
      label: buttonText ?? "ok",
      disable:
          // controller.itemsSelected.isEmpty ||
          controller.isLoading || controller.isNotChangedYet,
    );
  }
}

class _BuildLoading extends StatelessWidget {
  const _BuildLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LazyLoadingCard());
  }
}

class _BuildAllItemsSelectedIfWithSelectAll extends StatelessWidget {
  const _BuildAllItemsSelectedIfWithSelectAll({
    Key? key,
    required this.selectAllText,
    required this.customSelectAllWidget,
    required this.controller,
  }) : super(key: key);

  final String? selectAllText;
  final Widget Function(bool isSelectAll)? customSelectAllWidget;
  final MultiSelectBottomSheetController controller;

  @override
  Widget build(BuildContext context) {
    if (!controller.isWithSelectAll) return Container();
    String item = selectAllText ?? "choose all";
    Widget defaultWidget;

    if (customSelectAllWidget != null) {
      defaultWidget = GestureDetector(
        onTap: () => controller.onPressedSelectAll(),
        child: customSelectAllWidget!(controller.isSelectAll),
      );
    } else {
      defaultWidget = controller.isSelectAll
          ? ItemSelectedWidget(
              label: item,
              onPressed: () => controller.onPressedSelectAll(),
            )
          : ItemUnSelectedWidget(
              label: item,
              onPressed: () => controller.onPressedSelectAll(),
            );
    }

    return defaultWidget;
  }
}

class _BuildSubtitleIfNotNull extends StatelessWidget {
  const _BuildSubtitleIfNotNull({
    Key? key,
    required this.subTitle,
    required this.subtitleAlignment,
  }) : super(key: key);

  final String? subTitle;
  final AlignmentGeometry? subtitleAlignment;

  @override
  Widget build(BuildContext context) {
    if (subTitle == null) return Container();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Align(
          alignment: subtitleAlignment ?? Alignment.center,
          child: Text(
            subTitle!,
            style: AppTextStyle.medium16
                .copyWith(color: AppColors.fontSecondaryColor),
          ),
        ),
      ],
    );
  }
}

class _BuildTitle extends StatelessWidget {
  const _BuildTitle({
    Key? key,
    required this.title,
    this.titleAlignment,
  }) : super(key: key);

  final String title;
  final AlignmentGeometry? titleAlignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: titleAlignment ?? Alignment.center,
      child: Text(
        title,
        style: AppTextStyle.bold18,
        textAlign: TextAlign.start,
      ),
    );
  }
}

class _BuildItems<T> extends ConsumerWidget {
  const _BuildItems(
      {required this.scrollController,
      required this.controller,
      required this.isCustomItem,
      required this.getItemSelectedWidget,
      required this.getItemUnSelectedWidget,
      required this.iconItemColor,
      required this.iconItemSize,
      required this.listIconsItem,
      required this.prefixIconType,
      super.key});
  final ScrollController scrollController;
  final MultiSelectBottomSheetController<T> controller;
  final bool isCustomItem;
  final Widget Function(T)? getItemSelectedWidget;
  final Widget Function(T)? getItemUnSelectedWidget;
  final Color? iconItemColor;
  final Size? iconItemSize;
  final List<String>? listIconsItem;
  final IconTypes? prefixIconType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
          _BuildItemList(
              scrollController: scrollController,
              controller: controller,
              buildItem: _buildItem),
      ],
    );
  }

  Widget _buildItem({
    required int index,
    required T item,
    required bool isSelected,
  }) {
    if (isCustomItem) {
      return InkWell(
        onTap: () => controller.onPressedItem(
          item: item,
        ),
        child: isSelected
            ? getItemSelectedWidget!.call(item)
            : getItemUnSelectedWidget!.call(item),
      );
    }

    ItemWidget defaultWidget = isSelected
        ? ItemSelectedWidget(
            label: controller.getItemText(item),
            onPressed: () => controller.onPressedItem(
              item: item,
            ),
            iconItemColor: iconItemColor,
            iconItemSize: iconItemSize,
            prefixIcon: listIconsItem != null ? listIconsItem![index] : null,
            prefixIconType: prefixIconType,
          )
        : ItemUnSelectedWidget(
            label: controller.getItemText(item),
            onPressed: () => controller.onPressedItem(
              item: item,
            ),
            iconItemColor: iconItemColor,
            iconItemSize: iconItemSize,
            prefixIcon: listIconsItem != null ? listIconsItem![index] : null,
            prefixIconType: prefixIconType,
          );

    return defaultWidget;
  }
}

class _BuildItemList<T> extends StatelessWidget {
  const _BuildItemList(
      {super.key,
      required this.scrollController,
      required this.controller,
      required this.buildItem});
  final ScrollController scrollController;
  final MultiSelectBottomSheetController<T> controller;
  final Widget Function(
      {required int index,
      required T item,
      required bool isSelected}) buildItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      controller: scrollController,
      itemCount: controller.listItems.length,
      itemBuilder: (ctx, index) {
        T item = controller.listItems[index];

        bool isSelected = controller.itemsSelected.contains(item);
        return Container(
          child: buildItem(
            index: index,
            item: item,
            isSelected: isSelected,
          ),
        );
      },
    );
  }
}