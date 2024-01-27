import 'package:flutter/material.dart';
import '../../core/general/theme/theme.dart';

class Loading extends StatefulWidget {
  const Loading({
    Key? key,
    this.color,
    this.size, this.value,
  }) : super(key: key);

  final Color? color;
  final double? size;
  final double? value;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double value = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: RotationTransition(
    //     turns: _controller,
    //     child: Container(
    //       child: SvgPicture.asset(
    //         AppIcons.loading,
    //         height: widget.size ?? 38.w,
    //         width: widget.size ?? 38.w,
    //         color: widget.color ?? AppColors.primaryColor,
    //       ),
    //     ),
    //   ),
    // );

    return Loading2(
      valueColor: widget.color,
      value: widget.value,
    );
  }
}

class Loading2 extends StatelessWidget {
  const Loading2(
      {Key? key,
      this.value,
      this.valueColor,
      this.backgroundColor,
      this.strokeWidth})
      : super(key: key);
  final double? value;
  final Color? valueColor;
  final Color? backgroundColor;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      valueColor:
          AlwaysStoppedAnimation<Color>(valueColor ?? AppColors.primaryColors),
      backgroundColor: backgroundColor ??
          valueColor?.withOpacity(0.2) ??
          AppColors.primaryColors.withOpacity(0.2),
      strokeWidth: strokeWidth ?? 4.r,
      value: value,
    ));
  }
}
