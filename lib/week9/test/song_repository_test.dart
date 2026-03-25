import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository_firebase.dart';
import 'package:homework_week7/week9/model/songs/song.dart';

void main() async {
  try {
    // 1 - Test raw Firebase response
    final Uri songsUri = Uri.https(
      'week9-firebase-database-default-rtdb.asia-southeast1.firebasedatabase.app',
      '/songs.json',
    );

    print('📡 Fetching from: $songsUri');
    final http.Response response = await http.get(songsUri);
    
    print('Status: ${response.statusCode}');
    print('Response body length: ${response.body.length}');
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> root = json.decode(response.body);
      print('Root keys: ${root.keys.toList()}');
      print('Songs value type: ${root['songs'].runtimeType}');
      
      if (root['songs'] != null) {
        final Map<String, dynamic> songsMap = root['songs'] as Map<String, dynamic>;
        print('✓ Found ${songsMap.keys.length} song keys: ${songsMap.keys.toList()}');
        
        if (songsMap.isNotEmpty) {
          print('\nFirst song structure:');
          print(songsMap.entries.first.value);
        }
      } else {
        print('✗ "songs" key is null!');
      }
    } else {
      print('✗ HTTP ${response.statusCode}: ${response.body}');
    }

    // 2 - Test the repository
    print('\n--- Testing Repository ---');
    SongRepository songRepository = SongRepositoryFirebase();
    List<Song> songs = await songRepository.fetchSongs();
    
    print('Got ${songs.length} songs');
    for (var song in songs) {
      print('  - ${song.title}');
    }
  } catch (e) {
    print('✗ Error: $e');
    print('Stack trace: $e');
  }
}
