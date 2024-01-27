import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/general/helpers/base_change_notifier.dart';

abstract class Validatable extends BaseChangeNotifier {
  ///Used to execute validation login depending on index
  bool isValid();
  Map<String, dynamic> data();
  FormGroup get form;
}
