import 'package:flutter/material.dart';
import 'package:homework_week7/week7/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week7/data/repositories/songs/song_repository_mock.dart';
import 'package:homework_week7/week7/data/repositories/songs/song_repository_remote.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository_mock.dart';
import 'package:homework_week7/week7/model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;

  LibraryViewModel({required this.songRepository}) {
    init();
  }
  UserHistoryRepositoryMock userHistoryRepostioryMock = UserHistoryRepositoryMock();
  Song? _currentSong;

  Song? get currentSong => _currentSong;

  List<Song> init() {
    return SongRepositoryRemote().fetchSongs();
  }

  void start(Song song) {
    _currentSong = song;
    userHistoryRepostioryMock.addRecentSong(song);
    notifyListeners();
  }

  void stop() {
    _currentSong = null;

    notifyListeners();
  }
}
