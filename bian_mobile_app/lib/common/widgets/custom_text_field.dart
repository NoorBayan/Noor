import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/general/theme/theme.dart';
import '../../core/general/util/extensions/num.dart';
import '../../core/general/util/util.dart';
import 'custom_icon.dart';
import 'ensure_visible_when_focused.dart';
import 'loading.dart';
import 'widget_size_offset_wrapper.dart';

/// This class is used to create a custom text field.
/// It can be used with or without [ReactiveForms].
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.formControlName,
    this.hintText,
    this.fieldTitle,
    this.validationMessages,
    this.onSubmitted,
    this.textInputAction,
    this.suffix,
    this.minLines,
    this.maxLines,
    this.isNumber = false,
    this.readOnly = false,
    this.obscureText = false,
    this.showErrors = true,
    this.helperText,
    this.prefix,
    this.prefixIcon,
    this.inputFormatters = const [],
    this.maxLength,
    this.phoneFormatter = false,
    this.isRequired = false,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.onTap,
    this.fieldSubTitle,
    this.onPressedSubtitle,
    this.keyboardType,
    this.formControl,
    this.prefixIconSize,
    this.textAndHintDirection,
    this.prefixText,
    this.autoFocus = false,
    this.showLoadingOnPindingValditeor = false,
    this.onPressedSuffixIcon,
    this.suffixIconSize,
    this.obscuringCharacter,
    this.suffixIconWidget,
    this.setPrefixIconToTopStart = false,
    this.controller,
    this.withoutReactiveForms = false,
    this.isDefaultFillColorBased = true,
    this.onChanged,
    this.initialValue,
    this.height,
    this.isOptional = false,
    this.suffixIconConstraints,
    this.fillColor,
    this.prefixIconConstraints,
    this.inputDecoration,
    this.labelUnderBorder = true,
    this.cursorHeight,
    // this.focusedIcon,
    // this.errorIcon,
    this.labelText,
  }) : super(key: key);
  final String? formControlName;
  final bool autoFocus;
  final FormControl<dynamic>? formControl;
  final String? hintText;
  final String? prefixText;
  final String? fieldTitle;
  final String? fieldSubTitle;
  final VoidCallback? onPressedSubtitle;
  final VoidCallback? onPressedSuffixIcon;
  final String? helperText;
  final TextFieldIcon? prefixIcon;
  final Size? prefixIconSize;
  final Size? suffixIconSize;
  final Color? prefixIconColor;
  final TextFieldIcon? suffixIcon;
  final bool showLoadingOnPindingValditeor;
  final Color? suffixIconColor;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final Widget? suffixIconWidget;
  final TextFieldStatesColor? fillColor;
  final Widget? prefix;
  final bool isNumber;
  final bool readOnly;
  final bool isRequired;
  final bool isOptional;
  final bool obscureText;
  final String? obscuringCharacter;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool showErrors;
  final TextDirection? textAndHintDirection;
  final bool phoneFormatter;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onSubmitted;
  final TextInputAction? textInputAction;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool setPrefixIconToTopStart;
  final TextEditingController? controller;
  final bool withoutReactiveForms;
  final Function(String)? onChanged;
  final double? height;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final String? initialValue;
  final InputDecoration? inputDecoration;
  final bool labelUnderBorder;
  final bool isDefaultFillColorBased;
  final double? cursorHeight;
  // final String? focusedIcon;
  // final String? errorIcon;
  final String? labelText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  late TextEditingController _controller;
  late TextFieldStatesColor? fillColor;
  TextFieldState? textfieldState;
  // TextFieldIconNotifier? prefixIconVariable;
  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    focusNode = FocusNode();
    if (widget.onChanged != null) {
      _controller.addListener(
        () {
          widget.onChanged!(_controller.text);
        },
      );
    }

    if (widget.prefixIcon == null) {
      prefixIconVariable.value = '';
      // prefixIconVariable =
    } else {
      prefixIconVariable.value = widget.prefixIcon!.icon;
    }
    if (widget.suffixIcon == null) {
      suffixIconVariable.value = '';
      // suffixIconVariable =
    } else {
      suffixIconVariable.value = widget.suffixIcon!.icon;
    }
    fillColor = widget.fillColor;
    if (widget.isDefaultFillColorBased) {
      fillColor = TextFieldStatesColor(
        errorColor: AppColors.errorColors.withOpacity(.1),
        focusedColor: AppColors.primaryColors.withOpacity(.3),
        unTouchedColor: AppColors.greyColors.c25,
        disabledColor: AppColors.greyColors.c25,
      );
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    borderColor.dispose();
    prefixIconVariable.dispose();
    suffixIconVariable.dispose();
    super.dispose();
  }

  Color getColor(TextFieldState textFieldState) {
    switch (textFieldState) {
      case TextFieldState.focused:
        return AppTextFieldStyle.focusedBorder.borderSide.color;
      case TextFieldState.error:
        return AppTextFieldStyle.errorBorder.borderSide.color;
      case TextFieldState.disabled:
        return AppTextFieldStyle.disabledBorder.borderSide.color;
      case TextFieldState.unTouched:
        return AppTextFieldStyle.border.borderSide.color;
    }
  }

  TextFieldState getTextFieldStateFormMaterialState(Set<MaterialState> states) {
    const Set<MaterialState> primaryStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.focused,
    };
    const Set<MaterialState> errorStates = <MaterialState>{
      MaterialState.error,
    };
    const Set<MaterialState> disabledStates = <MaterialState>{
      MaterialState.disabled,
    };
    if (states.any(errorStates.contains)) {
      return TextFieldState.error;
    } else if (states.any(primaryStates.contains)) {
      return TextFieldState.focused;
    } else if (states.any(disabledStates.contains)) {
      return TextFieldState.disabled;
    } else {
      return TextFieldState.unTouched;
    }
  }

  // String? getIcon(Set<MaterialState> states) {
  //   if (states.contains(MaterialState.error)) {
  //     return widget.errorIcon ?? widget.prefixIcon;
  //   } else if (states.contains(MaterialState.focused)) {
  //     return widget.focusedIcon ?? widget.prefixIcon;
  //   } else {
  //     return widget.prefixIcon;
  //   }
  // }

  double getContainerHeight(double height, TextFieldState? textFieldState) {
    if (textFieldState == null) {
      return 1;
    }
    switch (textFieldState) {
      case TextFieldState.error:
        // return (height);
        return (height -
                (AppTextFieldStyle.errorTextStyle.height.orOne *
                        AppTextFieldStyle.errorTextStyle.fontSize.orOne)
                    .truncate()) -
            8.h;
      default:
        return height;
    }
  }

  // bool isFocused = false;
  final ValueNotifier<Color> borderColor =
      ValueNotifier<Color>(Colors.transparent);
  final ValueNotifier<String?> prefixIconVariable = ValueNotifier<String?>('');
  final ValueNotifier<String?> suffixIconVariable = ValueNotifier<String?>('');
  final ValueNotifier<double> textFiledHeight = ValueNotifier<double>(0);
  // String checkValue = '';

  // bool get valueIsNotEmpty => checkValue != '' ? true : false;

  // double get height => widget.height ?? 60.r;

  // double get widgetSpacing => height / 6.r;

  // double get iconSpacing => widgetSpacing * 0.6.r;

  @override
  Widget build(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: focusNode,
      child: DefaultTextStyle(
        style: AppTextFieldStyle.textStyle,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToFirstAscent: true,
          applyHeightToLastDescent: true,
        ),
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            if (widget.labelUnderBorder) ...[
              // ValueListenableBuilder(
              //     valueListenable: isFocused,
              //     builder: (context, value, wd) {
              //       return IgnorePointer(
              //         child: AnimatedAlign(
              //           alignment: value
              //               ? AlignmentDirectional.topStart
              //               : AlignmentDirectional.centerStart,
              //           duration: const Duration(milliseconds: 300),
              //           child: Padding(
              //             padding: EdgeInsets.symmetric(horizontal: 52.r),
              //             child: AnimatedDefaultTextStyle(
              //               style: value
              //                   ? AppTextStyle.regular12.copyWith(
              //                       color: AppColors.iconColor,
              //                       height: height * 0.04)
              //                   : AppTextStyle.regular16
              //                       .copyWith(color: AppColors.inputFontColor),
              //               duration: const Duration(milliseconds: 300),
              //               child: Text(widget.hintText ?? ''),
              //             ),
              //           ),
              //         ),
              //       );
              //     }),
              IgnorePointer(
                child: ValueListenableBuilder<double>(
                  valueListenable: textFiledHeight,
                  builder: (context, height, wd) {
                    return Container(
                      height: getContainerHeight(height, textfieldState),
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor.value),
                          borderRadius: BorderRadius.circular(16.r),
                          color: fillColor
                                  ?.getColorFromStates(textfieldState) ??
                              Theme.of(context).inputDecorationTheme.fillColor),
                    );
                  },
                ),
              ),
              ValueListenableBuilder<Color>(
                  valueListenable: borderColor,
                  builder: (context, color, wd) => WidgetSizeOffsetWrapper(
                        onSizeChange: (Size size) =>
                            textFiledHeight.value = size.height,
                        child: Builder(
                          builder: (context) {
                            if (widget.withoutReactiveForms) {
                              return _buildTextFieldWithoutReactiveForms(
                                  context);
                            } else {
                              return _buildTextFieldWithReactiveForms(context);
                            }
                          },
                        ),
                      )),
            ],
            if (!widget.labelUnderBorder)
              Builder(
                builder: (context) {
                  if (widget.withoutReactiveForms) {
                    return _buildTextFieldWithoutReactiveForms(context);
                  } else {
                    return _buildTextFieldWithReactiveForms(context);
                  }
                },
              ),
            if (widget.setPrefixIconToTopStart && widget.prefixIcon != null)
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                    margin: EdgeInsetsDirectional.only(
                      top: 18.h,
                      end: 4.w,
                      start: 4.w,
                    ),
                    child: _buildPrefixIcon()),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithReactiveForms(BuildContext context) {
    FormControl formControl = widget.formControl ??
        ReactiveForm.of(context)!.findControl(widget.formControlName!)
            as FormControl;
    return StreamBuilder<bool>(
      stream: formControl.touchChanges,
      builder: (context, snapshot) {
        return ReactiveFormConfig(
          // Set global Default Validation Message for all text fields in the form
          validationMessages: {
            ...validatorRequiredMs,
            ...validatorEmailMs,
          },

          child: ReactiveTextField(
            // cursorHeight: 34.h,
            //   selectionHeightStyle: ui.BoxHeightStyle.max,
            onChanged: (val) {
              if (widget.onChanged != null) {
                widget.onChanged!(val.value);
              }
            },

            controller: _controller,
            cursorHeight: widget.cursorHeight,
            textDirection: widget.textAndHintDirection,
            textAlignVertical: TextAlignVertical.top,
            autofocus: widget.autoFocus,
            formControl: widget.formControl,
            formControlName: widget.formControlName,
            // showErrors: (_){
            //   print(_.findControl(widget.formControlName!).errors);
            //   print('----=--------======== controller');
            //   // var message =
            //   // _.validators.first.toString()
            //   // print((_ as FormControl<String>));
            //   print(_.errors);
            //   widget.validationMessages!.forEach((key, value) {
            //     print('============ key: $key');
            //     print('============ value: $value');
            //   });
            //   // print();
            //   // print(_.);
            //   print('----=--------========');
            //   return false;
            // },

            showErrors: widget.showErrors
                ? (control) => (control.invalid && control.touched)
                : ((control) => widget.showErrors),

            onSubmitted: (c) => widget.onSubmitted?.call(),
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            onTap: (c) {
              // this to fix the issue of the Text field cursor position in RTL goes to the penultimate character
              if (_controller.selection ==
                  TextSelection.fromPosition(
                      TextPosition(offset: _controller.text.length - 1))) {
                setState(() {
                  _controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: _controller.text.length));
                });
              }
              widget.onTap?.call();
            },
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter ?? '*',
            readOnly: widget.readOnly,
            focusNode: focusNode,
            keyboardType: widget.keyboardType ??
                (widget.isNumber ? TextInputType.number : null),
            inputFormatters: widget.isNumber
                ? ([
                    FilteringTextInputFormatter.digitsOnly,
                    ...?widget.inputFormatters
                  ])
                : widget.inputFormatters,

            textInputAction: widget.textInputAction ?? TextInputAction.next,
            validationMessages: widget.validationMessages,
            cursorColor: AppColors.primaryColors,
            decoration: _buildDecoration(control: formControl),
            style: AppTextFieldStyle.textStyle.copyWith(
                // letterSpacing: this.widget.obscureText ? 5 : null,
                // fontWeight: this.widget.obscureText ?FontWeight.w500 :null,
                ),
          ),
        );
      },
    );
  }

  Widget _buildTextFieldWithoutReactiveForms(BuildContext context) {
    return TextFormField(
      // cursorHeight: 34.h,
      onChanged: (val) {
        if (widget.onChanged != null) {
          widget.onChanged!(val);
        }
      },

      controller: _controller,
      textDirection: widget.textAndHintDirection,
      textAlignVertical: TextAlignVertical.top,
      autofocus: widget.autoFocus,
      minLines: widget.minLines ?? 1,
      maxLines: widget.maxLines ?? 1,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      onTap: () {
        // this to fix the issue of the Text field cursor position in RTL goes to the penultimate character
        if (_controller.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length - 1))) {
          setState(() {
            _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length));
          });
        }
        widget.onTap?.call();
      },

      cursorHeight: widget.cursorHeight,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter ?? '*',
      readOnly: widget.readOnly,
      focusNode: focusNode,
      keyboardType: widget.keyboardType ??
          (widget.isNumber ? TextInputType.number : null),
      inputFormatters: widget.isNumber
          ? ([
              FilteringTextInputFormatter.digitsOnly,
              ...?widget.inputFormatters
            ])
          : widget.inputFormatters,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      cursorColor: AppColors.primaryColors,
      decoration: _buildDecoration(),
      style: AppTextFieldStyle.textStyle.copyWith(
          // letterSpacing: this.widget.obscureText ? 5 : null,
          // fontWeight: this.widget.obscureText ?FontWeight.w500 :null,
          ),
    );
  }

  InputDecoration _buildDecoration({FormControl? control}) {
    if (widget.inputDecoration != null) {
      return widget.inputDecoration!;
    }
    return InputDecoration(
      // alignLabelWithHint: false,

      hintTextDirection: widget.textAndHintDirection,
      contentPadding: AppTextFieldStyle.normalContentPadding,
      fillColor: control == null
          ? Theme.of(context).inputDecorationTheme.fillColor
          : ((control.hasErrors && control.invalid && control.touched))
              ? AppColors.inputFormErrorColor
              : Theme.of(context).inputDecorationTheme.fillColor,

      filled: !widget.labelUnderBorder,

      prefix: widget.prefix,
      prefixIcon: widget.labelUnderBorder
          ? _buildPrefixIcon()
          : widget.prefixIcon == null
              ? null
              : (widget.setPrefixIconToTopStart
                  ? Container(
                      margin: EdgeInsetsDirectional.only(
                        start: 12.w,
                        end: 8.w,
                        // top: 8.h,
                        // bottom: 8.h,
                      ),
                      height: 20.r,
                      width: 20.r,
                    )
                  : _buildPrefixIcon()),

      // prefixIconConstraints:
      //     const BoxConstraints(
      //       maxWidth: double.infinity,
      //       maxHeight: double.infinity,
      //     ),
      prefixIconConstraints: widget.prefixIconConstraints ??
          // this is to fix the issue of the align hint text when the prefix icon is set (i don't know why !)
          const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: double.infinity,
          ),

      prefixStyle: AppTextFieldStyle.textStyle,
      labelStyle: AppTextFieldStyle.hintTextStyle,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: widget.labelText,

      border: widget.labelUnderBorder
          ? MaterialStateOutlineInputBorder.resolveWith((states) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                // prefixIconVariable.value = getIcon(states);
                final textfieldState =
                    getTextFieldStateFormMaterialState(states);
                if (this.textfieldState != textfieldState) {
                  setState(() {
                    this.textfieldState = textfieldState;
                  });

                  final textFieldColor = getColor(textfieldState);
                  if (borderColor.value != textFieldColor) {
                    borderColor.value = textFieldColor;
                  }
                  if (widget.prefixIcon != null) {
                    final textFieldPrefixIcon = widget.prefixIcon!
                        .getIconFromStates(this.textfieldState);
                    if (prefixIconVariable.value != textFieldPrefixIcon) {
                      prefixIconVariable.value = textFieldPrefixIcon;
                    }
                  }

                  if (widget.suffixIcon != null) {
                    final textFieldSuffixIcon = widget.suffixIcon!
                        .getIconFromStates(this.textfieldState);
                    if (suffixIconVariable.value != textFieldSuffixIcon) {
                      suffixIconVariable.value = textFieldSuffixIcon;
                    }
                  }
                }
              });
              // textFiledHeight.value = getContainerHeight(states);

              return InputBorder.none;

              // if (states.contains(MaterialState.focused)) {
              //   return AppTextFieldStyle.focusedBorder;
              // } else if (states.contains(MaterialState.error)) {
              //   return AppTextFieldStyle.errorBorder;
              // } else {
              //   return AppTextFieldStyle.disabledBorder;
              // }
            })
          : InputBorder.none,
      // widget.labelUnderBorder ? null :
      disabledBorder:
          widget.labelUnderBorder ? null : AppTextFieldStyle.disabledBorder,
      focusedBorder:
          widget.labelUnderBorder ? null : AppTextFieldStyle.focusedBorder,
      enabledBorder:
          widget.labelUnderBorder ? null : AppTextFieldStyle.enabledBorder,
      errorBorder:
          widget.labelUnderBorder ? null : AppTextFieldStyle.errorBorder,
      focusedErrorBorder:
          widget.labelUnderBorder ? null : AppTextFieldStyle.focusedErrorBorder,
      hintText: widget.hintText,

      hintStyle: AppTextFieldStyle.hintTextStyle,
      errorStyle: AppTextFieldStyle.errorTextStyle,
      helperText: widget.helperText,
      suffix: widget.suffix,

      suffixIconConstraints: widget.suffixIconConstraints ??
          // this is to fix the issue of the align hint text when the suffix icon is set (i don't know why !)
          const BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: double.infinity,
          ),
      suffixIcon: widget.suffixIconWidget ??
          (widget.showLoadingOnPindingValditeor
              ? _buildLoading()
              : widget.suffixIcon == null
                  ? null
                  : _buildSuffixIcon()),
    );
  }

  Widget? _buildLoading() {
    return ReactiveValueListenableBuilder(
        formControl: widget.formControl,
        formControlName: widget.formControlName,
        builder: (context, controller, child) {
          if (!controller.pending) return 0.sizedBox;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Loading(
                  color: AppColors.primaryColors,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildPrefixIcon() {
    updatePrefixIconIfChanged();
    return Container(
      // color: AppColfors.testDesginColor,
      // constraints: BoxConstraints(
      //   maxWidth: 45.w,
      //   maxHeight: 34.h,
      // ),
      // alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsetsDirectional.only(
        start: 12.w,
        end: 8.w,
        bottom: 5.r,
        // top: 8.h,
        // bottom: 8.h,
      ),
      child: ValueListenableBuilder(
          valueListenable: prefixIconVariable,
          builder: (BuildContext context, dynamic icon, Widget? child) {
            return CustomIcon(
              iconPath: icon,
              height: widget.prefixIconSize?.height ?? 8.r,
              width: widget.prefixIconSize?.width ?? 13.r,
              iconColor:
                  widget.prefixIcon?.getIconColorFromStates(textfieldState),
            );
          }),
    );
  }

  Widget _buildSuffixIcon() {
    updateSuffixIconIfChanged();
    return GestureDetector(
      onTap: widget.onPressedSuffixIcon,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // direction: Axis.horizontal,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // alignment: WrapAlignment.center,
          children: [
            // Container(
            //   height: 31,
            //   width: 2.w,
            //   color: AppColors.deactivatedButtonsColor,
            // ),
            // SizedBox(
            //   width: 12.w,
            // ),
            ValueListenableBuilder(
                valueListenable: suffixIconVariable,
                builder: (BuildContext context, dynamic icon, Widget? child) {
                  return CustomIcon(
                    iconPath: icon,
                    height: widget.suffixIconSize?.height ?? 8.r,
                    width: widget.suffixIconSize?.width ?? 13.r,
                    iconColor: widget.suffixIcon
                        ?.getIconColorFromStates(textfieldState),
                  );
                })
          ],
        ),
      ),
    );
  }

  void updateSuffixIconIfChanged() {
    if (widget.suffixIcon != null &&
        !widget.suffixIcon!.iconsPath.contains(suffixIconVariable.value!)) {
      suffixIconVariable.value = widget.suffixIcon!.icon;
    }
    // if (widget.suffixIcon == null) {
    //   suffixIconVariable.value = '';
    //   // suffixIconVariable =
    // } else {
    //   // if(widget.suffixIcon.icon)
    //   suffixIconVariable.value = widget.suffixIcon!.icon;
    // }
  }

  void updatePrefixIconIfChanged() {
    if (widget.prefixIcon != null &&
        !widget.prefixIcon!.iconsPath.contains(prefixIconVariable.value!)) {
      prefixIconVariable.value = widget.prefixIcon!.icon;
    }
  }
}

/// This is widget to show the title of the field with the subtitle.
class CustomFieldTitle extends StatelessWidget {
  const CustomFieldTitle({
    Key? key,
    this.title,
    this.subtitle,
    this.subtitleWidget,
    this.onPressedSubtitle,
    this.isRequired = false,
    this.child,
    this.isOptional = false,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final VoidCallback? onPressedSubtitle;

  /// This is to show the title with the red star to indicate that this field is required.
  final bool isRequired;
  final Widget? child;

  /// This is to show the title with the (optional) text to indicate that this field is optional.
  final bool isOptional;

  @override
  Widget build(BuildContext context) {
    return (title == null && subtitle == null)
        ? (child ?? Container())
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    if (title != null)
                      Text.rich(
                        TextSpan(
                          text: title,
                          style: AppTextStyle.regular14.copyWith(
                            color: AppColors.fontColor,
                          ),
                          children: [
                            if (isRequired)
                              TextSpan(
                                text: ' *',
                                style: AppTextStyle.regular14.copyWith(
                                  color: AppColors.errorColors,
                                ),
                              ),
                            if (isOptional)
                              TextSpan(
                                text: 'optional ',
                                // text: ' (${t.optional})',
                                style: AppTextStyle.regular12.copyWith(
                                  color: AppColors.fontColor,
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (subtitleWidget != null || subtitle != null)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: GestureDetector(
                            onTap: onPressedSubtitle,
                            child: subtitleWidget ??
                                Text(
                                  subtitle!,
                                  style: AppTextStyle.regular12.copyWith(
                                    color: AppColors.secondaryColors,
                                  ),
                                ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (child != null) child!,
            ],
          );
  }
}

enum TextFieldState {
  error,
  focused,
  unTouched,
  disabled,
}

final textFieldIconProvider = NotifierProvider.family<TextFieldIconNotifier,
    TextFieldIcon, TextFieldIcon>(TextFieldIconNotifier.new);

class TextFieldIconNotifier
    extends FamilyNotifier<TextFieldIcon, TextFieldIcon> {
  @override
  TextFieldIcon build(TextFieldIcon arg) {
    return arg;
  }
}

class TextFieldIcon extends Equatable {
  final String? focusedIcon;
  final String icon;
  final String? errorIcon;
  final TextFieldStatesColor? iconStatesColor;
  const TextFieldIcon({
    this.focusedIcon,
    required this.icon,
    this.errorIcon,
    this.iconStatesColor,
  });

  TextFieldIcon copyWith({
    String? focusedIcon,
    String? icon,
    String? errorIcon,
  }) {
    return TextFieldIcon(
      focusedIcon: focusedIcon ?? this.focusedIcon,
      icon: icon ?? this.icon,
      errorIcon: errorIcon ?? this.errorIcon,
    );
  }

  Color? getIconColorFromStates(TextFieldState? textFieldState) {
    return iconStatesColor?.getColorFromStates(textFieldState);
  }

  String? getIconFromStates(TextFieldState? textFieldState) {
    if (textFieldState == null) {
      return icon;
    }
    switch (textFieldState) {
      case TextFieldState.focused:
        return focusedIcon ?? icon;
      case TextFieldState.error:
        return errorIcon ?? focusedIcon ?? icon;
      case TextFieldState.disabled:
        return icon;
      case TextFieldState.unTouched:
        return icon;
    }
  }

  String get iconsPath => "{$icon ${focusedIcon ?? ''} ${errorIcon ?? ''}}";

  @override
  String toString() =>
      'TextFieldIcon(focusedIcon: $focusedIcon, icon: $icon, errorIcon: $errorIcon)';

  @override
  List<Object?> get props => [
        icon,
      ];
}

class TextFieldStatesColor extends Equatable {
  final Color errorColor;
  final Color focusedColor;
  final Color unTouchedColor;
  final Color disabledColor;
  const TextFieldStatesColor({
    this.errorColor = AppColors.errorColors,
    this.focusedColor = AppColors.primaryColors,
    this.unTouchedColor = AppColors.greyColors,
    this.disabledColor = AppColors.greyColors,
  });

  Color? getColorFromStates(TextFieldState? textFieldState) {
    if (textFieldState == null) {
      return null;
    }
    switch (textFieldState) {
      case TextFieldState.focused:
        return focusedColor;
      case TextFieldState.error:
        return errorColor;
      case TextFieldState.disabled:
        return disabledColor;
      case TextFieldState.unTouched:
        return unTouchedColor;
    }
  }

  @override
  String toString() {
    return 'TextFieldStatesColor(errorColor: $errorColor, focusedColor: $focusedColor, unTouchedColor: $unTouchedColor, disabledColor: $disabledColor)';
  }

  @override
  List<Object> get props =>
      [errorColor, focusedColor, unTouchedColor, disabledColor];
}

// final materialStatsProvider = NotifierProvider.family<MaterialStatesNotifier,
//     Set<MaterialState>, Set<MaterialState>>(MaterialStatesNotifier.new);

// class MaterialStatesNotifier
//     extends FamilyNotifier<Set<MaterialState>, Set<MaterialState>> {
//   @override
//   Set<MaterialState> build(Set<MaterialState> arg) {
//     return arg;
//   }
// }
