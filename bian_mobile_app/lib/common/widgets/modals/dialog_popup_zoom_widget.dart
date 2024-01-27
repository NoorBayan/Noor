import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../core/general/helpers/custom_logger.dart';
import '../../../core/general/helpers/helpers.dart';
import '../../../core/general/theme/theme.dart';

class DialogPopupZoomWidget extends StatelessWidget {
  const DialogPopupZoomWidget({
    Key? key,
    this.child,
    this.imageProvider,
    this.width,
    this.height,
    this.borderRadius,
    this.zoomEnabled = true,
    this.showCloseIcon = true,
  })  : assert(child != null || imageProvider != null),
        super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool zoomEnabled;
  final bool showCloseIcon;
  final ImageProvider<Object>? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          //
          SizedBox(
            width: width ?? 0.6.sw,
            height: height ?? 0.6.sh,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              child: child != null
                  ? CustomZoomWidget(
                      disableZoomOutAfterMainScale: true,
                      resetOnScaleEnd: false,
                      zoomEnabled: zoomEnabled,
                      minScale: 1.0,
                      child: child!,
                    )
                  : CustomZoomWidget.image(
                      imageProvider: imageProvider!,
                      disableZoomOutAfterMainScale: true,
                      resetOnScaleEnd: false,
                      zoomEnabled: zoomEnabled,
                      minScale: 1.0,
                    ),
            ),
          ),

          if (showCloseIcon)
            Positioned(
              left: 5.r,
              top: 5.r,
              child: Container(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(0.r),
                    child: Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: AppColors.primaryColors,
                          size: 20.r,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Future show(
    BuildContext context, {
    Widget? child,
    ImageProvider<Object>? imageProvider,
    double? width,
    double? height,
    double? borderRadius,
    bool zoomEnabled = true,
    bool showCloseIcon = true,
  }) async {
    if (child == null && imageProvider == null) {
      throw Exception('child or imageProvider must not be null');
    }
    return await DialogHelper.showDialog(
      context: context,
      builder: (context) => DialogPopupZoomWidget(
        width: width,
        height: height,
        borderRadius: borderRadius,
        zoomEnabled: zoomEnabled,
        showCloseIcon: showCloseIcon,
        imageProvider: imageProvider,
        child: child,
      ),
    );
  }
}

///
///
///

class CustomZoomWidget extends StatefulWidget {
  const CustomZoomWidget({
    required Widget child,
    this.resetDuration = const Duration(milliseconds: 100),
    this.maxScale = double.infinity,
    this.minScale,
    this.zoomEnabled = true,
    this.onZoomStart,
    this.onZoomEnd,
    this.resetOnScaleEnd = true,
    this.disableZoomOutAfterMainScale = false,
    this.size,
    Key? key,
  })  : _child = child,
        _imageProvider = null,
        super(key: key);

  const CustomZoomWidget.image({
    required ImageProvider imageProvider,
    this.resetDuration = const Duration(milliseconds: 100),
    this.maxScale = double.infinity,
    this.minScale,
    this.zoomEnabled = true,
    this.onZoomStart,
    this.onZoomEnd,
    this.resetOnScaleEnd = true,
    this.disableZoomOutAfterMainScale = false,
    this.size,
    Key? key,
  })  : _imageProvider = imageProvider,
        _child = null,
        super(key: key);

  final Widget? _child;
  final ImageProvider<Object>? _imageProvider;
  final double maxScale;
  final double? minScale;
  final Duration resetDuration;
  final bool zoomEnabled;
  final Function? onZoomStart, onZoomEnd;
  final bool resetOnScaleEnd;
  final Size? size;
  final bool disableZoomOutAfterMainScale;

  @override
  State<CustomZoomWidget> createState() => _CustomZoomWidgetState();
}

class _CustomZoomWidgetState extends State<CustomZoomWidget> {
  late final PhotoViewController controller;
  late final PhotoViewScaleStateController scaleStateController;
  late final StreamSubscription scaleStateChangedSubscription;

  void _handleScaleStateChanged(PhotoViewScaleState scaleState) {
    logger.i("Scale state changed: $scaleState");
    if (widget.disableZoomOutAfterMainScale) {
      if (scaleState == PhotoViewScaleState.zoomedOut) {
        controller.scale = widget.minScale ?? 1.0;
        // scaleStateController.scaleState = PhotoViewScaleState.initial;
      }
    }

    if (scaleState == PhotoViewScaleState.initial) {
      widget.onZoomEnd?.call();
    } else {
      widget.onZoomStart?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = PhotoViewController();
    scaleStateController = PhotoViewScaleStateController();

    scaleStateChangedSubscription =
        scaleStateController.outputScaleStateStream.listen((scaleState) {
      _handleScaleStateChanged(scaleState);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
    scaleStateChangedSubscription.cancel();
    super.dispose();
  }
  dynamic get maxScale => PhotoViewComputedScale.covered * 2;
  dynamic get minScale => PhotoViewComputedScale.covered;
  // able to zoom in on click twice on image

  @override
  Widget build(BuildContext context) {
    if (widget._imageProvider != null) {
      return PhotoView(
        imageProvider: widget._imageProvider,
        initialScale: PhotoViewComputedScale.covered,
        customSize: widget.size,
        maxScale: maxScale,
        minScale: minScale,
        backgroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        scaleStateController: scaleStateController,
        controller: controller,
      );
    }

    return PhotoView.customChild(
      customSize: widget.size,
      initialScale: PhotoViewComputedScale.covered,
      maxScale: maxScale,
      minScale: minScale,
      backgroundDecoration: const BoxDecoration(color: Colors.transparent),
      scaleStateController: scaleStateController,
      controller: controller,
      child: widget._child,
    );
  }
}
