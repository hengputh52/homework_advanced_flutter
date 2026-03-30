import 'package:flutter/widgets.dart';

import '../../model/songs/song.dart';

class PlayerState extends ChangeNotifier {
  Song? _currentSong;
  Song? _likedSong;
  Song? get currentSong => _currentSong;
  Song? get likedSong => _likedSong;
  bool isLiked = false;

  List<String> listLikedSong = [];
  void start(Song song) {
    _currentSong = song;

    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }

  void onLike(Song song) {
    if (listLikedSong.contains(song.id)) {
      listLikedSong.remove(song.id);
    } else {
      listLikedSong.add(song.id);
    }

    notifyListeners();
  }

  bool isLikedSong(Song song) => listLikedSong.contains(song.id);
}
