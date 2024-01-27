extension CheckIfNull on Object? {
  bool get isNull {
    return this == null;
  }

  bool get isNotNull {
    return this != null;
  }

  bool get falseIfNullOrZeroOrEmptyOrBooleanFalse {
    if (this == null) {
      return false;
    } else if (this is int) {
      return this != 0;
    } else if (this is String && (this as String).isEmpty) {
      return false;
    } else if (this is bool) {
      return this == true;
    } else {
      return true;
    }
  }
}
