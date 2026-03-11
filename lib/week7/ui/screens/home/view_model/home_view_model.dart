import 'package:flutter/material.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository_mock.dart';
import 'package:homework_week7/week7/model/songs/song.dart';

class HomeViewModel extends ChangeNotifier {
  final UserHistoryRepository userHistoryRepostiory;

  HomeViewModel({required this.userHistoryRepostiory});

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
