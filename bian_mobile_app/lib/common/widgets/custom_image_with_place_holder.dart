import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/general/asset_path/app_icons.dart';
import '../../core/general/helpers/custom_logger.dart';
import '../../core/general/helpers/helpers.dart';
import '../../core/general/theme/theme.dart';
import '../../core/general/util/extensions/extensions.dart';
import '../../core/general/util/util.dart';
import 'custom_icon.dart';
import 'modals/dialog_popup_zoom_widget.dart';

class CustomImage extends ConsumerStatefulWidget {
  CustomImage({
    Key? key,
    this.imagePath,
    this.placeHolder,
    this.placeHolderType = PlaceHolderType.defaultHolder,
    this.imageType = ImageType.file,
    this.imageBackground = Colors.white,
    this.isWithTypeChecking = false,
    this.imageBorder,
    this.openWithExternalApp = false,
    this.radius,
    this.isWithDecoration = true,
    this.isWithZoomIcon = false,
    this.fit = BoxFit.fill,
    this.zoomIconSize = 16,
  }) : super(key: key);
  final String? imagePath;
  final Widget? placeHolder;
  final PlaceHolderType placeHolderType;
  final ImageType imageType;
  final Color imageBackground;
  final bool isWithTypeChecking;
  final bool openWithExternalApp;
  final double? radius;
  final BoxBorder? imageBorder;
  final bool isWithDecoration;
  final bool isWithZoomIcon;
  final double zoomIconSize;
  final BoxFit fit;
  final StateProvider<bool> isImageWithErrorState =
      StateProvider((ref) => false);

  @override
  ConsumerState<CustomImage> createState() =>
      _CustomImageWithPlaceholderState();
}

class _CustomImageWithPlaceholderState
    extends ConsumerState<CustomImage> {
  ImageProvider<Object>? _imageProvider;
  @override
  Widget build(BuildContext context) {
    ImageType adjustedImageType = widget.imageType;
    if (widget.isWithTypeChecking && widget.imagePath != null) {
      adjustedImageType = getAppropriateImageType();
    }
    return Consumer(
      builder: (context, ref, child) {
        final isImageWithError = ref.watch(widget.isImageWithErrorState);
        return InkWell(
            onTap: widget.openWithExternalApp &&
                    widget.imagePath.isNotNullAndNotEmpty &&
                    !isImageWithError
                ? () async {
                    if (widget.imagePath!.isUrl) {
                      UrlHelper.launchUrlWithBrowser(widget.imagePath!);
                      return;
                    }

                    FileUtil.openFile(widget.imagePath!);
                  }
                : null,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: _getDecoration(),
                child: widget.imagePath == null || widget.imagePath!.isEmpty
                    ? _buildPlaceholder()
                    : ClipRRect(
                        borderRadius: _getClipRRectBorderRadius(),
                        child: _WrapWithIconZoomPopup(
                            showIconZoomPopup:
                                widget.isWithZoomIcon && !isImageWithError,
                            zoomIconSize: widget.zoomIconSize,
                            onTap: widget.isWithZoomIcon && !isImageWithError
                                ? () async {
                                    await DialogPopupZoomWidget.show(
                                      context,
                                      width: 0.9.sw,
                                      height: 0.3.sh,
                                      zoomEnabled: true,
                                      showCloseIcon: true,
                                      borderRadius: 12.r,
                                      imageProvider: _imageProvider,
                                      child: _imageProvider != null
                                          ? null
                                          : Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: _getDecoration(),
                                              child: _buildImage(
                                                  adjustedImageType:
                                                      adjustedImageType,
                                                  fit: BoxFit.cover)),
                                      // child: Container(
                                      //     width: double.infinity,
                                      //     height: double.infinity,
                                      //     decoration: _getDecoration(),
                                      //     child: _buildImage(
                                      //         adjustedImageType:
                                      //             adjustedImageType,
                                      //         fit: BoxFit.cover)),
                                    );
                                  }
                                : null,
                            child: child!),
                      )));
      },
      child: widget.imagePath == null || widget.imagePath!.isEmpty
          ? null
          : _buildImage(
              adjustedImageType: adjustedImageType, fit: this.widget.fit),
    );
  }

  BorderRadius _getClipRRectBorderRadius() {
    if (widget.isWithDecoration) {
      return BorderRadius.circular(widget.radius ??
          (widget.placeHolderType == PlaceHolderType.defaultHolder ? 8 : 10));
    } else {
      return BorderRadius.zero;
    }
  }

  BoxDecoration? _getDecoration() {
    if (widget.isWithDecoration) {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius ??
            (widget.placeHolderType == PlaceHolderType.defaultHolder ? 8 : 10)),
        color: widget.imageBackground,
        border: widget.imageBorder,
      );
    } else {
      return null;
    }
  }

  Widget _buildImage(
      {required ImageType adjustedImageType, required BoxFit fit}) {
    if (adjustedImageType == ImageType.file) {
      return _buildImageFromFile(fit);
    } else if (adjustedImageType == ImageType.asset) {
      return _buildImageFromAsset(fit);
    } else {
      return _buildImageFromUrl(fit);
    }
  }

  Widget _buildImageErrorWidget() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // setState(() {
        ref.read(widget.isImageWithErrorState.notifier).state = true;
        // });
      }
    });

    return widget.placeHolder ?? _buildPlaceholder();
  }

  CachedNetworkImage _buildImageFromUrl(BoxFit fit) {
    return CachedNetworkImage(
      imageUrl: widget.imagePath!,
      fit: fit,
      imageBuilder: (context, imageProvider) {
        _imageProvider = imageProvider;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: widget.fit,
            ),
          ),
        );
      },
      errorWidget: (_, __, error) {
        logger.e('$error happened inside image with path ${widget.imagePath}');
        return _buildImageErrorWidget();
      },
      progressIndicatorBuilder: (_, child, DownloadProgress? loadingProgress) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              color: AppColors.disabledColor,
            ),
          ),
        );
        // }
      },
    );
  }

  Image _buildImageFromAsset(BoxFit fit) {
    final imageWidget = Image.asset(
      widget.imagePath!,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        logger.e('$error happened inside image with path ${widget.imagePath}');
        return _buildImageErrorWidget();
      },
    );
    _imageProvider = imageWidget.image;
    return imageWidget;
  }

  Image _buildImageFromFile(BoxFit fit) {
    final imageWidget = Image.file(
      File(widget.imagePath!),
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        logger.e('$error happened inside image with path ${widget.imagePath}');
        return _buildImageErrorWidget();
      },
    );
    _imageProvider = imageWidget.image;
    return imageWidget;
  }

  Widget _buildPlaceholder() {
    if (widget.placeHolder != null) {
      return widget.placeHolder!;
    }
    switch (widget.placeHolderType) {
      case PlaceHolderType.defaultHolder:
        return Center(
          child: CustomIcon(
            iconPath: "AppIcons.defaultPlaceholder",
            width: 34.87.r,
            height: 13.97.r,
          ),
        );
      // case PlaceHolderType.store:
      //   return  Center(
      //     child: CustomIcon(
      //       iconPath: AppIcons.store2,
      //       size: 24.r,
      //     ),
      //   );
      // case PlaceHolderType.pharmacyPlaceholder:
      //   return  Center(
      //     child: CustomIcon(
      //       iconPath: AppIcons.pharmacy,
      //       size: 24.r,
      //     ),
      //   );
      case PlaceHolderType.personalImgPlaceholder:
        return Center(
          child: CustomIcon(
            iconPath: "AppIcons.profile",
            size: 24.r,
            // iconColor: Colors.black,
          ),
        );
      // case PlaceHolderType.talqahStore:
      //   return  Center(
      //     child: CustomIcon(
      //       iconPath: AppIcons.storeTalqah,
      //       size: 24.r,
      //       // iconColor: Colors.black,
      //     ),
      //   );
      default:
        return Center(
          child: CustomIcon(
            iconPath: "AppIcons.defaultPlaceholder",
            width: 30.29.r,
            height: 23.72.r,
          ),
        );
    }
  }

  ImageType getAppropriateImageType() {
    if (widget.imagePath!.startsWith('http')) {
      return ImageType.network;
    } else if (widget.imagePath!.startsWith('asset')) {
      return ImageType.asset;
    } else {
      return ImageType.file;
    }
  }
}

enum PlaceHolderType {
  defaultHolder,
  // store,
  // talqahStore,
  personalImgPlaceholder,
  // pharmacyPlaceholder,
}

enum ImageType { file, network, asset }

class _WrapWithIconZoomPopup extends StatelessWidget {
  const _WrapWithIconZoomPopup({
    required this.child,
    required this.showIconZoomPopup,
    required this.zoomIconSize,
    this.onTap,
  });

  final Widget child;
  final bool showIconZoomPopup;
  final double zoomIconSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        if (showIconZoomPopup)
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.zoom_out_map,
                  color: Colors.white,
                  size: zoomIconSize,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
