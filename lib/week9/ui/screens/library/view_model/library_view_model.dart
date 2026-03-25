import 'package:flutter/material.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/model/artists/artist.dart';
import 'package:homework_week7/week9/model/songs/song.dart';
import 'package:homework_week7/week9/ui/states/player_state.dart';
import 'package:homework_week7/week9/ui/utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  AsyncValue<List<Song>> songsValue = AsyncValue.loading();

  LibraryViewModel({
    required this.songRepository,
    required this.playerState,

  }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    fetchSong();
  }

  void fetchSong() async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Song> songs = await songRepository.fetchSongs();



      songsValue = AsyncValue.success(songs);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
