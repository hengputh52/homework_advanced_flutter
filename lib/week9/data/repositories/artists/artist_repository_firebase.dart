import 'dart:convert';

import 'package:homework_week7/week9/data/dtos/artist_dto.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/model/artists/artist.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistUri = Uri.https(
    'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<Artist?> fetchArtistById(String id) {
    // TODO: implement fetchArtistById
    throw UnimplementedError();
  }

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load artists");
    }

    final Map<String, dynamic> artistMap = json.decode(response.body);

    return artistMap.entries
        .map((entry) => ArtistDto.fromJson(entry.key, entry.value))
        .toList();
  }
}
