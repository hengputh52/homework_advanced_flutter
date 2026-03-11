import 'package:homework_week7/week7/model/songs/song.dart';

abstract class UserHistoryRepository {
  List<Song> recentSong();
  void addRecentSong(Song song);
}
