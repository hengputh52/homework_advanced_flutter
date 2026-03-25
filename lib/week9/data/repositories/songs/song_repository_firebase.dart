import 'dart:convert';
import 'package:homework_week7/week9/data/dtos/song_dto.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/model/songs/song.dart';
import 'package:http/http.dart' as http;

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load songs');
    }

    final Map<String, dynamic> songsMap =
        json.decode(response.body);

    return songsMap.entries.map((entry) => SongDto.fromJson(entry.key, entry.value)).toList();
  }

  @override
  Future<Song?> fetchSongById(String id) async {
    final Uri songByIdUri = Uri.https(
      'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/songs/$id.json',
    );

    final http.Response response = await http.get(songByIdUri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load song: $id');
    }

    if (response.body == 'null') {
      return null;
    }

    final Map<String, dynamic> songJson =
        json.decode(response.body);

    return SongDto.fromJson(id, songJson);
  }
}
