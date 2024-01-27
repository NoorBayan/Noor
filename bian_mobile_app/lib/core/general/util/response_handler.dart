class ResponseHandler {
  static String? nullableStringVal({required dynamic key}) {
    if (key == null) {
      return null;
    }
    if (key is! String) {
      return key.toString();
    } else {
      return key;
    }
  }

  static String stringVal({required dynamic key, String? defaultValue}) {
    if (key == null) {
      return defaultValue ?? '';
    }
    if (key is! String) {
      return key.toString();
    } else {
      return key;
    }
  }

  static int? nullableIntVal({required dynamic key}) {
    if (key == null) {
      return null;
    }
    if (key is! int) {
      return int.tryParse(key);
    } else {
      return key;
    }
  }

  static int intVal({required dynamic key, int? defaultValue}) {
    if (key == null) {
      return defaultValue ?? 0;
    }
    if (key is! int) {
      return int.tryParse(key.toString()) ?? defaultValue ?? 0;
    } else {
      return key;
    }
  }

  static double? nullableDoubleVal({required dynamic key}) {
    if (key == null) {
      return null;
    }
    if (key is! double) {
      return double.tryParse(key.toString());
    } else {
      return key;
    }
  }

  static double doubleVal({required dynamic key, double? defaultValue}) {
    if (key == null) {
      return defaultValue ?? 0.0;
    }
    if (key is! double) {
      return double.tryParse(key.toString()) ?? defaultValue ?? 0.0;
    } else {
      return key;
    }
  }

  static num? nullableNumVal({required dynamic key}) {
    if (key == null) {
      return null;
    }
    if (key is! num) {
      return num.tryParse(key.toString());
    } else {
      return key;
    }
  }

  static num numVal({required dynamic key, num? defaultValue}) {
    if (key == null) {
      return defaultValue ?? 0;
    }
    if (key is! num) {
      return num.tryParse(key.toString()) ?? defaultValue ?? 0;
    } else {
      return key;
    }
  }

  static bool? tryParseBool({required dynamic val}) {
    if (val is int) {
      if (val == 0) {
        return false;
      } else {
        return true;
      }
    }
    const String trueStringVal = "true";
    const String falseStringVal = "false";
    const String trueIntVal = "1";
    const String falseIntVal = "0";

    final String normalizeVal =
        val.toString().replaceAll(' ', '').toLowerCase();

    if (val == null) {
      return null;
    } else if (val is bool) {
      return val;
    } else if (normalizeVal == trueStringVal || normalizeVal == trueIntVal) {
      return true;
    } else if (normalizeVal == falseStringVal || normalizeVal == falseIntVal) {
      return false;
    } else {
      return null;
    }
  }

  static bool? nullableBoolVal({required dynamic key}) {
    if (key == null) {
      return null;
    }
    if (key is! bool) {
      return tryParseBool(val: key);
    } else {
      return key;
    }
  }

  static bool boolVal({required dynamic key, bool? defaultValue}) {
    if (key == null) {
      return defaultValue ?? false;
    }
    if (key is! bool) {
      return tryParseBool(val: key) ?? defaultValue ?? false;
    } else {
      return key;
    }
  }
}
