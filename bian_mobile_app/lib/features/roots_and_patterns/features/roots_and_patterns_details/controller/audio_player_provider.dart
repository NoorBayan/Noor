import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bian_mobile_app/core/general/helpers/audio_player_helper.dart';
import 'package:bian_mobile_app/core/general/util/result_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/general/helpers/base_change_notifier.dart';
import '../../../../../core/general/helpers/custom_logger.dart';

final audioPlayProvider = ChangeNotifierProvider.autoDispose
    .family<AudioPlayerController, String>((ref, currentAudioFile) {
  return AudioPlayerController(currentAudioFile);
});

class AudioPlayerController extends BaseChangeNotifier {
  late AudioPlayerHelper audioPlayerHelper;
  final String currentAudioFile;
  late StreamSubscription<PlayerState> playerStateStream;
  late StreamSubscription<Duration> durationStream;
  late StreamSubscription<Duration> totalDurationStream;

  PlayerState currentPlayerState = PlayerState.stopped;
  Duration? duration;
  Duration? totalDuration;

  AudioPlayerController(this.currentAudioFile) {
    audioPlayerHelper = AudioPlayerHelper();
    playerStateStream =
        audioPlayerHelper.audioPlayer.onPlayerStateChanged.listen((event) {
      currentPlayerState = event;
      logger.d("Current State = $event");
      notifyListeners();
    });
    durationStream =
        audioPlayerHelper.audioPlayer.onPositionChanged.listen((event) {
      duration = event;
      notifyListeners();
    });
    totalDurationStream =
        audioPlayerHelper.audioPlayer.onDurationChanged.listen((event) {
      totalDuration = event;
      notifyListeners();
    });
    currentPlayerState = PlayerState.stopped;
  }
  void play() {
    logger.d("current file $currentAudioFile");
    currentPlayerState = PlayerState.disposed;
    notifyListeners();
    audioPlayerHelper.play(currentAudioFile);
  }

  @override
  void dispose() {
    durationStream.cancel();
    playerStateStream.cancel();
    totalDurationStream.cancel();
    audioPlayerHelper.audioPlayer.dispose();
    super.dispose();
  }
}
