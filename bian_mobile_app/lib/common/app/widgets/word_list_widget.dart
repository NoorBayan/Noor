import 'package:bian_mobile_app/core/general/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/custom_dropdown_widget.dart';
import '../../../../core/general/theme/app_colors.dart';

class WordListWidget<T> extends StatelessWidget {
  const WordListWidget(
      {super.key,
      required this.onChanged,
      required this.initialValue,
      required this.wordList});
  final Function(T?) onChanged;
  final T? initialValue;
  final List<T> wordList;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 129.w,
        child: CustomDropdownWidget<T>(
          onChanged: (value) {
            onChanged.call(value);
        
          },
          
          value: initialValue,
          selectedItemBuilder: (context) => wordList
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        e.toString(),
                        style: AppTextStyle.bold16
                            .copyWith(color: AppColors.secondaryColors),
                      ),
                    ),
                  ))
              .toList(),
          items: wordList
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(
                      e.toString(),
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.fontPrimaryColor),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
