import 'package:flutter/widgets.dart';
import 'package:homework_week7/week9/model/songs/song.dart';


class PlayerState extends ChangeNotifier {
  Song? _currentSong;

  Song? get currentSong => _currentSong;

  void start(Song song) {
    _currentSong = song;

    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }
}
