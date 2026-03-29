import 'package:flutter/material.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/service/song_detail_service.dart';
import 'package:homework_week7/week9/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_week7/week9/ui/states/player_state.dart';
import 'package:provider/provider.dart';


import 'widgets/library_content.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        playerState: context.read<PlayerState>(),
        songDetailService: SongDetailService(songRepository: context.read<SongRepository>(), artistRepository: context.read<ArtistRepository>()),
      ),
      child: LibraryContent(),
    );
  }
}
