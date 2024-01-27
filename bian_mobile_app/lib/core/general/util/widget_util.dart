// build extension dobule to the base SizeBox Widget

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../helpers/custom_logger.dart';

extension ParseNumberToSizedBoxWidget on num {
  SizedBox get sizedBox => SizedBox(height: toDouble(), width: toDouble());
}

class WidgetUtil {
  static TextDirection reverseParentTextDirection(BuildContext context) {
    TextDirection currentTextDirection = Directionality.of(context);

    if (currentTextDirection == TextDirection.rtl) {
      return TextDirection.ltr;
    }

    return TextDirection.rtl;
  }

  static textWidth({
    required String text,
    required TextStyle style,
    double? maxWidth,
    double paddingWidth = 0,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: textDirection)
      ..layout(minWidth: 0, maxWidth: double.infinity);

    double textWidth = textPainter.size.width;

    if (maxWidth != null) {
      textWidth = (textWidth + paddingWidth) > maxWidth
          ? maxWidth
          : (textWidth + paddingWidth);
    }

    logger.i('textWidth: $textWidth , text: $text');
    logger.i('textPainter.size.width: ${textPainter.size.width} ');

    return textWidth;
  }
}

extension RenderObjectEx on RenderObject {
  bool isVisibleInViewportByScrollPosition(ScrollPosition scrollPosition) {
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(this)!;
    final double vpHeight = viewport.paintBounds.height;
    final RevealedOffset vpOffset = viewport.getOffsetToReveal(this, 0.0);

    // Retrieve the dimensions of the item
    final Size size = semanticBounds.size;

    // Check if the item is in the viewport
    final double deltaTop = vpOffset.offset - scrollPosition.pixels;
    final double deltaBottom = deltaTop + size.height;

    bool isInViewport = false;

    isInViewport = (deltaTop >= 0.0 && deltaTop < vpHeight);
    if (!isInViewport) {
      isInViewport = (deltaBottom > 0.0 && deltaBottom < vpHeight);
    }

    return isInViewport;
  }
}
