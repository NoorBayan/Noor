import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/general/theme/app_colors.dart';

class CustomAnimatedIconCheckWidget extends StatefulWidget {
  const CustomAnimatedIconCheckWidget({
    Key? key,
    this.size,
    this.color,
    this.duration,
    this.animationController,
  }) : super(key: key);
  final double? size;
  final Color? color;
  final Duration? duration;
  final AnimationController? animationController;

  @override
  State<CustomAnimatedIconCheckWidget> createState() => _CustomAnimatedIconCheckWidgetState();
}

class _CustomAnimatedIconCheckWidgetState extends State<CustomAnimatedIconCheckWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = widget.animationController ??
        AnimationController(
          vsync: this,
          duration: widget.duration ?? const Duration(milliseconds: 500),
        );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    if (widget.animationController == null) {
      _controller.dispose();
    }

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return _AnimatedCheck(
      progress: _animation,
      size: widget.size ?? 17.r,
      color: widget.color ?? AppColors.primaryColors,
    );
  }
}

// this code from package https://pub.dev/packages/animated_check

class _AnimatedCheck extends StatefulWidget {
  final Animation<double> progress;

  // The size of the checkmark
  final double size;

  // The primary color of the checkmark
  final Color? color;

  // The width of the checkmark stroke
  final double? strokeWidth;

  const _AnimatedCheck({
    Key? key,
    required this.progress,
    required this.size,
    this.color,
    this.strokeWidth,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<_AnimatedCheck>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomPaint(
        foregroundPainter: _AnimatedPathPainter(
          widget.progress,
          widget.color ?? theme.primaryColor,
          widget.strokeWidth,
        ),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
        ));
  }
}

class _AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;

  final Color _color;

  final double? strokeWidth;

  _AnimatedPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.27083 * size.width, 0.54167 * size.height)
      ..lineTo(0.41667 * size.width, 0.68750 * size.height)
      ..lineTo(0.75000 * size.width, 0.35417 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    //
    if (length == 0) {
      return path;
    }

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    //
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
