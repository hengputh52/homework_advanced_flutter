import 'package:flutter/widgets.dart';

import '../../model/songs/song.dart';

class PlayerState extends ChangeNotifier {
  Song? _currentSong;
 
  bool isLike = false;
  Song? get currentSong => _currentSong;
 

  void start(Song song) {
    _currentSong = song;

    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }

  void onLike(Song song) {
    isLike = !isLike;
    
    notifyListeners();
  }
}
