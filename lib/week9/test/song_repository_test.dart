import '../data/repositories/songs/song_repository.dart';
import '../data/repositories/songs/song_repository_firebase.dart';
import '../model/songs/song.dart';

void main() async {
  try {
    SongRepository songRepository = SongRepositoryFirebase();
    
    print('Fetching songs...');
    List<Song> songs = await songRepository.fetchSongs();
    
    print('✓ Got ${songs.length} songs:');
    for (var song in songs) {
      print('  - ${song.title} (${song.duration.inSeconds}s)');
    }
  } catch (e) {
    print('✗ Error: $e');
    print('Stack trace: $e');
  }
}
