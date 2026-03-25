import 'package:homework_week7/week9/model/songs/song.dart';

abstract class SongRepository {
  Future<List<Song>> fetchSongs();
  
  Future<Song?> fetchSongById(String id);
}
