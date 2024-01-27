import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../common/widgets/loading.dart';
import '../../core/general/asset_path/app_animations.dart';
import '../../core/general/helpers/base_change_notifier.dart';
import '../../core/general/helpers/custom_logger.dart';
import '../../core/general/providers/app_provider.dart';
import '../../core/general/theme/theme.dart';

part 'splash_screen_controller.dart';

final _isAnimationShownProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

class SplashView extends ConsumerStatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const String routeName = 'splash_screen';
  static const String path = '/splash_screen';

  @override
  ConsumerState<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // remove native splash screen
      FlutterNativeSplash.remove();
    });
    ref.read(splashScreenController).onShowSplashScreen(context);
    // ref.read(splashScreenController).onShowSplashScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashScreenController, (previous, next) {});
    // final splashController = ref.watch(splashScreenController);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
            child: _LogoAnimation(
              onCompleted: () {
                final splashController = ref.read(splashScreenController);
                splashController.isShowingAnimation = false;
                if (!splashController.isProcessing) {
                  splashController.onEndSplashScreen(context);
                }
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Loading(),
              20.verticalSpace,
            ],
          )
          //  Align(
          //     alignment: Alignment.topCenter,
          //     child: Loading(),
          //   ),
          
        ],
      ),
    );
  }
}

class _BuildBottomText extends StatelessWidget {
  const _BuildBottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          _BuildLoading(),
          Spacer(),
          // 80.h.verticalSpace,
          // Container(
          //   margin: EdgeInsetsDirectional.only(
          //     start: 18.w,
          //     end: 18.w,
          //     bottom: 20.h,
          //   ),
          //   width: 1.sw,
          //   height: 50.r,
          //   alignment: Alignment.center,
          //   child: const CustomIcon(
          //     iconPath: AppIcons.developedBy,
          //     // width: 188.r,
          //     // height: 39.r,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _BuildLoading extends StatelessWidget {
  const _BuildLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 34.39.r,
      height: 34.39.r,
      child: const Loading(
        color: Colors.black,
      ),
    );
  }
}

class _LogoAnimation extends StatefulWidget {
  const _LogoAnimation({
    required this.onCompleted,
  });

  final VoidCallback onCompleted;
  @override
  State<_LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<_LogoAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      // duration: const Duration(milliseconds: 1000),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onCompleted();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.splashAnimation,
      alignment: Alignment.center,
      height: 1.sh,
      fit: BoxFit.fill,
      width: double.infinity,
      controller: _animationController,
      onLoaded: (composition) {
        logger.d('composition.duration: ${composition.duration}');
        _animationController
          ..duration = composition.duration
          ..reset()
          ..forward();
      },
    );
  }
}
