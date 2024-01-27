import 'package:audioplayers/audioplayers.dart';
import 'package:bian_mobile_app/common/widgets/clickable.dart';
import 'package:bian_mobile_app/common/widgets/custom_icon.dart';
import 'package:bian_mobile_app/common/widgets/loading.dart';
import 'package:bian_mobile_app/features/roots_and_patterns/features/roots_and_patterns_details/controller/audio_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/general/asset_path/app_icons.dart';

class AudioWidget extends ConsumerWidget {
  const AudioWidget(this.audioFilePath, {super.key});
  final String audioFilePath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(audioPlayProvider(audioFilePath));
    return Row(
      children: [
        _BuildAudioButton(
          playerState: controller.currentPlayerState ,
          duration: controller.duration,
          totalDuration: controller.totalDuration,
          onTap: () => controller.play(),
        )
      ],
    );
  }
}

class _BuildAudioButton extends StatelessWidget {
  const _BuildAudioButton(
      {super.key,
      required this.onTap,
      this.duration,
      this.totalDuration,
      required this.playerState});
  final VoidCallback onTap;
  final PlayerState playerState;
  final Duration? duration;
  final Duration? totalDuration;
  @override
  Widget build(BuildContext context) {
    return Clickable(
      onTap: onTap,
      child: SizedBox(
        width: 50.r,
        height: 50.r,
        child: Stack(
          children: [
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: playerState == PlayerState.playing
                    ? CustomIcon(
                        iconPath: AppIcons.pause,
                        size: 18.r,
                      )
                    : CustomIcon(
                        iconPath: AppIcons.play,
                        size: 18.r,
                      ),
              ),
            ),
            Center(
              child: Loading(
                size: 50.r,
                value: totalDuration == null
                    ? playerState != PlayerState.stopped
                        ? null
                        : 0
                    : ((duration?.inMicroseconds ?? 1) /
                        (totalDuration!.inMicroseconds)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
