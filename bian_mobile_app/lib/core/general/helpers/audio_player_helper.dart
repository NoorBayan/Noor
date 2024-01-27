import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  // Avoid self instance
  AudioPlayerHelper() {
    audioPlayer = AudioPlayer();
  }
  late AudioPlayer audioPlayer;
  void play(String path) {
    if (audioPlayer.state == PlayerState.playing ||
        audioPlayer.state == PlayerState.paused) {
      togglePlay();
    }else{
    audioPlayer.play(UrlSource(path));
    }
  }

  void togglePlay() {
    if (audioPlayer.state == PlayerState.playing) {
      audioPlayer.pause();
    } else if (audioPlayer.state == PlayerState.paused) {
      audioPlayer.resume();
    }
  }
}
