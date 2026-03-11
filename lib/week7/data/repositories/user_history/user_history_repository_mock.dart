import 'package:homework_week7/week7/data/repositories/songs/song_repository_mock.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository.dart';
import 'package:homework_week7/week7/model/songs/song.dart';

class UserHistoryRepositoryMock extends UserHistoryRepository {
  final List<Song> _recentSongs = [];
  @override
  List<Song> recentSong() {
    return _recentSongs;
  }

  @override
  void addRecentSong(Song song) {
    _recentSongs.add(song);
  }
}
