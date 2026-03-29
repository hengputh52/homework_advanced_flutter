import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/model/artists/artist.dart';
import 'package:homework_week7/week9/model/songs/song.dart';

class SongDetailService {
  final SongRepository songRepository;
  final ArtistRepository artistRepository;

  List<Artist> artists = [];
  List<Song> songs = [];
  SongDetailService({
    required this.songRepository,
    required this.artistRepository,
  });

  Artist getArtist(Song song) {
    try {
      return artists.firstWhere((artist) => artist.id == song.artistId);
    } catch (e) {
      throw ("Error fetching", e);
    }
  }

  void fetchSongDetail() async {
    songs = await songRepository.fetchSongs();
    artists = await artistRepository.fetchArtists();
  }
}
