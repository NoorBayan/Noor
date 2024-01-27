import '../util.dart';
import 'object.dart';

extension ParseStringThousandsNumber on String {
  String toThousandsNumber({bool brackets = false}) {
    String value = thousandsNumber(this);
    value = brackets ? '($value)' : value;
    return value;
  }

  int toInt({bool removeComma = true}) {
    String value = removeComma ? replaceAll(',', '') : this;
    return int.parse(value);
  }

  double toDouble({bool removeComma = true}) {
    String value = removeComma ? replaceAll(',', '') : this;
    return double.parse(value);
  }

  String get toTwoLeadingZeros {
    return padLeft(3, "0");
  }

  int get toIntOrZero {
    try {
      return int.parse(this);
    } catch (e) {
      return 0;
    }
  }

  double get toDoubleOrZero {
    try {
      return double.parse(this);
    } catch (e) {
      return 0;
    }
  }

  String get toStringOrEmpty {
    try {
      return this;
    } catch (e) {
      return '';
    }
  }

  String toStringOrSymbolIfZero({String symbol = ''}) {
    try {
      String value = this;
      if (value.isEmpty || value == '0') {
        return symbol;
      } else {
        return value;
      }
    } catch (e) {
      return symbol;
    }
  }

  // bool get isUrl {
  //   try {
  //     final url = Uri.parse(this);
  //     return url.isAbsolute;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  bool get isUrl {
    return trim().startsWith('http') || trim().startsWith('https');
  }

  bool get isFromAsset {
    return trim().startsWith('asset') || trim().startsWith('assets');
  }

  String get urlHost {
    if (isUrl) {
      final uri = Uri.parse(this);
      return uri.host;
    } else {
      return this;
    }
  }

  String get toPhoneNumber {
    final withAddSign = replaceFirst("00", "+");
    return withAddSign.replaceAll("_", "");
  }

  String setOverFlowByMaxLength(int maxLength, {String symbol = '...'}) {
    if (length > maxLength) {
      return substring(0, maxLength) + symbol;
    } else {
      return this;
    }
  }
}

extension CheckIfEmpty on String? {
  bool get isEmptyOrNull {
    return isNull || this!.isEmpty;
  }

  bool get isNotNullAndNotEmpty {
    return isNotNull && this!.isNotEmpty;
  }

  bool get isNotNullAndNotStringNull {
    return isNotNull && this!.trim().toLowerCase() != 'null';
  }
}

extension Routes on String {
  String injectVarToPath(String variable) {
    final splitedString = split(":");
    splitedString.removeLast();
    return splitedString.join() + variable;
  }
}
