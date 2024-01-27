import 'package:reactive_forms/reactive_forms.dart';


// Map get validatorRequiredMs => {ValidationMessage.required: 'مطلوب'};
Map get validatorRequiredMs =>
    {ValidationMessage.required: (_) => "this field should not be empty"};
Map get validatorEmailMs =>
    {ValidationMessage.email: (_) => "please enter a valid email address"};
Map get validatorPasswordNotMatchMs =>
    {ValidationMessage.mustMatch: (_) => "password not match"};

Map validatorMinLengthMs(int minLength) => {
      ValidationMessage.minLength:
        (_) =>  "the field characters should be more than minimum"
    };


Map get validatorNumberdMs =>
    {ValidationMessage.number: (_) => "please enter numbers only"};

typedef ValidatorsFunction = Map<String, dynamic>? Function(
    AbstractControl<dynamic> control);

class CustomValidators {
  static ValidatorsFunction minLengthWithoutSpace(int minLength) =>
      _MinLengthWithoutSpaceValidator(minLength).validate;

  static ValidatorsFunction minLengthIfNotEmpty(int minLength) =>
      _MinLengthIfNotEmptyValidator(minLength).validate;

  static ValidatorsFunction requiredIf(
          {required bool Function(AbstractControl<dynamic> control)
              condition}) =>
      _RequiredIfValidator(condition: condition).validate;

  // required if another control is not empty
  static ValidatorsFunction requiredIfAnotherNotEmpty(
          {required String controlName,
          required String otherControlName,
          bool markAsDirty = true}) =>
      _RequiredIfAnotherNotEmptyValidator(
              controlName: controlName,
              otherControlName: otherControlName,
              markAsDirty: markAsDirty)
          .validate;
}

class _MinLengthWithoutSpaceValidator extends Validator<dynamic> {
  final int minLength;

  _MinLengthWithoutSpaceValidator(this.minLength);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    // don't validate empty values to allow optional controls
    if (control.value == null) {
      return null;
    }

    List<dynamic>? collection;

    if (control is FormControl<String> || control.value is String) {
      collection = control.value.toString().replaceAll(' ', '').runes.toList();
    }

    return (collection != null && collection.length >= minLength)
        ? null
        : <String, dynamic>{
            ValidationMessage.minLength: {
             (_) => 'requiredLength': minLength,
             (_) => 'actualLength': collection != null ? collection.length : 0,
            }
          };
  }
}

class _MinLengthIfNotEmptyValidator extends Validator<dynamic> {
  final int minLength;

  _MinLengthIfNotEmptyValidator(this.minLength);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    // don't validate empty values to allow optional controls
    if (control.value == null || control.value.toString().trim().isEmpty) {
      return null;
    }

    List<dynamic>? collection;

    if (control is FormControl<String> || control.value is String) {
      collection = control.value.toString().runes.toList();
    }

    return (collection != null && collection.length >= minLength)
        ? null
        : <String, dynamic>{
            ValidationMessage.minLength: {
              'requiredLength': minLength,
              'actualLength': collection != null ? collection.length : 0,
            }
          };
  }
}

class _RequiredIfValidator extends Validator<dynamic> {
  final bool Function(AbstractControl<dynamic> control) condition;
  final String validationMessageKey;

  _RequiredIfValidator(
      {required this.condition,
      this.validationMessageKey = CustomValidationMessage.requiredIf});

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{validationMessageKey: true};

    if (!condition(control)) {
      return null;
    }

    if (control.value == null) {
      return error;
    } else if (control.value is String) {
      return (control.value as String).trim().isEmpty ? error : null;
    }

    return null;
  }
}

class _RequiredIfAnotherNotEmptyValidator extends Validator<dynamic> {
  final String controlName;
  final String otherControlName;
  final bool markAsDirty;

  /// Constructs an instance of [_RequiredIfAnotherNotEmptyValidator]
  _RequiredIfAnotherNotEmptyValidator({
    required this.controlName,
    required this.otherControlName,
    this.markAsDirty = true,
  });

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = {ValidationMessage.mustMatch: true};

    if (control is! FormGroup) {
      return error;
    }

    final formControl = control.control(controlName);
    final otherFormControl = control.control(otherControlName);

    return _RequiredIfValidator(
      validationMessageKey: CustomValidationMessage.requiredIfAnotherNotEmpty,
      condition: (AbstractControl<dynamic> control) {
        return otherFormControl.value != null ||
            (otherFormControl.value is String &&
                (otherFormControl.value as String).trim().isNotEmpty);
      },
    ).validate(formControl);
  }
}

abstract class CustomValidationMessage {
  static const required = 'required';
  static const mustMatch = 'mustMatch';
  static const requiredIf = 'requiredIf';
  static const requiredIfAnotherNotEmpty = 'requiredIfAnotherNotEmpty';
}
