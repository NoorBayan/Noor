
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/general/helpers/custom_logger.dart';

///
typedef OnWidgetSizeChange = void Function(Size size);

/// This widget is used to wrap a widget to get its size.
class WidgetSizeOffsetWrapper extends SingleChildRenderObjectWidget {
  /// This callback will be called when the size of the child widget changes.
  final OnWidgetSizeChange onSizeChange;

  const WidgetSizeOffsetWrapper({
    Key? key,
    required this.onSizeChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _WidgetSizeRenderObject(onSizeChange);
  }
}

class _WidgetSizeRenderObject extends RenderProxyBox {
  final OnWidgetSizeChange onSizeChange;
  Size? currentSize;

  _WidgetSizeRenderObject(this.onSizeChange);

  @override
  void performLayout() {
    super.performLayout();

    try {
      Size? newSize = child?.size;

      if (newSize != null && currentSize != newSize) {
        currentSize = newSize;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          onSizeChange(newSize);
        });
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
