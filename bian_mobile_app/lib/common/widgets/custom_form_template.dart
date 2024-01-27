import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/general/theme/theme.dart';
import 'widget_size_offset_wrapper.dart';
import 'widgets.dart';

typedef _Builder = List<Widget> Function(
  BuildContext context,
  FormGroup form,
  ScrollController scrollController,
);

/// This widget is used to show a form with some common features.
/// Like: hide scrollbar, hide keyboard when tap outside the form, show a button to save the form.
/// It is used to wrap a [ReactiveForm] widget.
class CustomFormTemplate extends StatefulWidget {
  const CustomFormTemplate({
    Key? key,
    // required this.children,
    required this.builder,
    required this.formGroup,
    this.buttonSave,
    this.padding,
    this.backgroundColor,
    this.hideScrollbar = false,
    this.margin,
    this.resizeToAvoidBottomInset = true,
    this.scrollController,
  }) : super(key: key);
  final FormGroup formGroup;
  // final List<Widget> children;
  /// This is a builder to build the form.
  final _Builder builder;

  /// This is a button to save the form.
  final Widget? buttonSave;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool hideScrollbar;

  /// This is used to resize the form when the keyboard is shown or hidden.
  final bool resizeToAvoidBottomInset;
  final ScrollController? scrollController;

  @override
  // ignore: library_private_types_in_public_api
  _CustomFormTemplateState createState() => _CustomFormTemplateState();
}

class _CustomFormTemplateState extends State<CustomFormTemplate>
    with AutomaticKeepAliveClientMixin {
  late ScrollController scrollController;
  late ValueNotifier<double> bottomSheetHeight;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    bottomSheetHeight = ValueNotifier(0);

    super.initState();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      scrollController.dispose();
    }
    bottomSheetHeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).unfocus();

        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        margin: widget.margin,
        child: ReactiveFormBuilder(
            form: () => widget.formGroup,
            builder: (context, form, child) => Scaffold(
                  resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                  backgroundColor:
                      widget.backgroundColor ?? AppColors.backgroundColor,
                  body: Scrollbar(
                    controller: scrollController,
                    thickness: widget.hideScrollbar ? 0 : 4.r,
                    child: AnimatedBuilder(
                      animation: bottomSheetHeight,
                      builder: (context, child) => SingleChildScrollView(
                        controller: scrollController,
                        padding:
                            EdgeInsets.only(bottom: bottomSheetHeight.value),
                        child: child,
                      ),
                      child: Container(
                        padding: widget.padding ??
                            EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              widget.builder(context, form, scrollController),
                        ),
                      ),
                    ),
                  ),
                  bottomSheet: widget.buttonSave == null
                      ? null
                      : WidgetSizeOffsetWrapper(
                          onSizeChange: (size) =>
                              bottomSheetHeight.value = size.height,
                          child: Container(
                            height: 78.h,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColors.disabledColor.withOpacity(0.16),
                                  blurRadius: 10.r,
                                  offset: Offset(0.r, -10.r),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.w, vertical: 12.h),
                            child: widget.buttonSave,
                          ),
                        ),
                )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
