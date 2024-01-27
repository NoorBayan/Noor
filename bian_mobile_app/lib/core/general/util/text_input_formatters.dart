
import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1) {
          newString = separator + newString;
        }
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

extension TextInputFormatterExtension on TextInputFormatter {
  String format(String text) {
    return formatEditUpdate(
            TextEditingValue(text: text), TextEditingValue(text: text))
        .text;
  }
}

class CustomTextInputFormatter {
  /// no space allowed, you can use it to avoid space in text field for example username, email etc
  static TextInputFormatter get noSpaceAllowed {
    final formatter = FilteringTextInputFormatter.deny(
      RegExp(r' '),
    );

    return formatter;
  }

  /// no space at end of text only, you can use it to avoid space at end of text after user select text from auto complete suggestion
  static TextInputFormatter get noSpaceAtEnd {
    final formatter = FilteringTextInputFormatter.deny(
      RegExp(r'\s$'),
    );

    return formatter;
  }
}
