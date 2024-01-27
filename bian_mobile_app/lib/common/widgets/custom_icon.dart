import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'clickable.dart';
import 'custom_image_with_place_holder.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    this.width,
    this.height,
    required this.iconPath,
    this.iconColor,
    this.onTap,
    this.fit = BoxFit.contain,
    this.iconType = IconTypes.svg,
    this.isNetworkBased = false,
    this.isWithExtensionChecking = false,
    this.isWithDirectionality = false,
    this.size,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String iconPath;
  final double? height;
  final double? width;
  final IconTypes iconType;
  final bool isWithExtensionChecking;
  final bool isWithDirectionality;
  final double? size;
  final BoxFit fit;
  final Color? iconColor;
  final bool isNetworkBased;

  @override
  Widget build(BuildContext context) {
    IconTypes adjustedIconType;
    if (isWithExtensionChecking) {
      adjustedIconType = getAppropriateExtension();
    } else {
      adjustedIconType = iconType;
    }
    final double? iconHeight = size ?? height;
    final double? iconWidth = size ?? width;
    if (iconWidth == null && iconHeight == null) {
      return Center(
        child: _BuildImage(
            adjustedIconType: adjustedIconType,
            width: iconWidth,
            height: iconHeight,
            isWithDirectionality: isWithDirectionality,
            isNetworkBased: isNetworkBased,
            onTap: onTap,
            fit: fit,
            iconColor: iconColor,
            iconPath: iconPath),
      );
    } else {
      return _BuildImage(
          adjustedIconType: adjustedIconType,
          width: iconWidth,
          height: iconHeight,
          fit: fit,
          onTap: onTap,
          isWithDirectionality: isWithDirectionality,
          isNetworkBased: isNetworkBased,
          iconColor: iconColor,
          iconPath: iconPath);
    }
  }

  IconTypes getAppropriateExtension() {
    if (iconPath.endsWith('.svg')) {
      return IconTypes.svg;
    } else {
      return IconTypes.png;
    }
  }
}

enum IconTypes {
  png,
  svg,
}

class _BuildImage extends StatelessWidget {
  const _BuildImage({
    Key? key,
    required this.adjustedIconType,
    required this.width,
    required this.height,
    required this.onTap,
    required this.isWithDirectionality,
    required this.isNetworkBased,
    required this.iconPath,
    this.iconColor,
    required this.fit,
  }) : super(key: key);
  final IconTypes adjustedIconType;
  final VoidCallback? onTap;
  final double? width;
  final BoxFit fit;
  final double? height;
  final bool isWithDirectionality;
  final bool isNetworkBased;
  final String iconPath;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final bool isLTR =  Directionality.of(context) == TextDirection.ltr;
    final mainWidget = RotatedBox(
      quarterTurns: isLTR && isWithDirectionality ? 2 : 0,
      child: SizedBox(
          width: width,
          height: height,
          child: _BuildAppropriateImageWidget(
              adjustedIconType: adjustedIconType,
              isNetworkBased: isNetworkBased,
              iconPath: iconPath,
              height: height,
              fit: fit,
              width: width,
              iconColor: iconColor)),
    );
    if (onTap != null) {
      return Clickable(onTap: onTap!, child: mainWidget);
    }
    return mainWidget;
  }
}

class _BuildAppropriateImageWidget extends StatelessWidget {
  const _BuildAppropriateImageWidget({
    Key? key,
    required this.adjustedIconType,
    required this.isNetworkBased,
    required this.iconPath,
    required this.height,
    required this.width,
    required this.fit,
    required this.iconColor,
  }) : super(key: key);

  final IconTypes adjustedIconType;
  final bool isNetworkBased;
  final BoxFit fit;
  final String iconPath;
  final double? height;
  final double? width;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    if (adjustedIconType == IconTypes.svg) {
      if (isNetworkBased) {
        return SvgPicture.network(
          iconPath,
          height: height,
          width: width,
          fit: fit,
          color: iconColor,
        );
      } else {
        return SvgPicture.asset(
          iconPath,
          height: height,
          width: width,
          fit: fit,
          color: iconColor,
        );
      }
    } else {
      if (isNetworkBased) {
        return CustomImage(
          imagePath: iconPath,
          imageType: ImageType.network,
          isWithDecoration: false,
          fit: fit,
          // fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          iconPath,
          height: height,
          width: width,
          fit: fit,
        );
      }
    }
  }
}
