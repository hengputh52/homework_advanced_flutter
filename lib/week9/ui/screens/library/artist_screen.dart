import 'package:flutter/material.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/ui/screens/library/view_model/artist_view_model.dart';
import 'package:homework_week7/week9/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_week7/week9/ui/screens/library/widgets/artist_content.dart';
import 'package:homework_week7/week9/ui/states/player_state.dart';
import 'package:provider/provider.dart';

import 'widgets/library_content.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => ArtistViewModel(
            artistRepository: context.read<ArtistRepository>(),
          ),
      child: ArtistContent(),
    );
  }
}
