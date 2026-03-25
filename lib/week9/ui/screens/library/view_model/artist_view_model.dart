import 'package:flutter/material.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/model/artists/artist.dart';
import 'package:homework_week7/week9/ui/utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  ArtistViewModel({required this.artistRepository}) {
    _init();
  }

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  void _init() async {
    fetchArtist();
  }

  void fetchArtist() async {
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistRepository.fetchArtists();
      artistValue = AsyncValue.success(artists);
    } catch (e) {
      artistValue = AsyncValue.error(e);
    }

    notifyListeners();
  }
}
