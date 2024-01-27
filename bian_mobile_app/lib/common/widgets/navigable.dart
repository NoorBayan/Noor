import 'package:flutter/cupertino.dart';
import 'validatable.dart';

abstract class Navigable extends Validatable {
  /// used to decide what happens when next or back button are clicked
  void onBackButtonPress(
      {required PageController pageController,
      required int pageNumber,
      required BuildContext context});
  void onNextButtonPress(
      {required PageController pageController,
      required int pageNumber,
      required BuildContext context});
   int get totalNumberOfPages => 3;
}
