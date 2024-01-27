import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/general/theme/theme.dart';

class CustomReactiveTextField extends ReactiveFormField<String, String> {
  CustomReactiveTextField({
    super.key,
    required String formControlName,
  }) : super(
            formControlName: formControlName,
            builder: (ReactiveFormFieldState<String, String> field) {
              // make sure never to pass null value to the Counter widget.
              final String? fieldValue = field.value;

              return _BuildTextField(
                onChanged: (value) => field.didChange(value),
                initialValue: fieldValue,
              );
            });

  @override
  ReactiveFormFieldState<String, String> createState() =>
      ReactiveFormFieldState<String, String>();
}

class _BuildTextField extends StatefulWidget {
  const _BuildTextField(
      {super.key, this.onChanged, required this.initialValue});
  final void Function(String)? onChanged;
  final String? initialValue;

  @override
  State<_BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<_BuildTextField> {
  late final focusNode;
  late final textController;
  @override
  void initState() {
    focusNode = FocusNode();
    textController = TextEditingController(
      text: widget.initialValue,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.r,
      height: 60.r,
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 0.5,
          ),
        ),
        color: AppColors.greyColors.c50,
      ),
      child: Center(
        child: EditableText(
          backgroundCursorColor: Colors.grey,
          onChanged: widget.onChanged,
          controller: textController,
          cursorHeight: 20.r,
          showCursor: true,
          cursorColor: Colors.black,
          cursorOffset: Offset(0, 5),
          focusNode: focusNode,
          textAlign: TextAlign.center,
          style: AppTextStyle.bold18.copyWith(color: AppColors.greyColors.c800),
          enableInteractiveSelection: true,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
