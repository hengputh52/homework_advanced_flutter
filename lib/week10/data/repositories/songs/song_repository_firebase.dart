import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = Uri.https(
    'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/songs.json',
  );

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<void> onLike(String id) async {
    final Uri currentLikeUri = Uri.https(
      'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/songs/$id/numberOfLikes.json',
    );

    final http.Response curentLike = await http.get(currentLikeUri);

    if (curentLike.statusCode == 200) {
      Map<String, dynamic> songJson = json.decode(curentLike.body);
      int like = songJson['numberOfLikes'];

      final http.Response updateLike = await http.put(
        currentLikeUri,
        headers: {'Content-Type': 'application/json'},
        body: like + 1,
      );

      if (updateLike.statusCode == 200) {
        print("Like update");
      }
    }
  }
}
