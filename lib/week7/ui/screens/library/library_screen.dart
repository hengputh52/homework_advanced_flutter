import 'package:flutter/material.dart';
import 'package:homework_week7/week7/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_week7/week7/ui/screens/library/widgets/library_content.dart';
import 'package:provider/provider.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';
import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // 2- Read the globbal settings state
    AppSettingsState settingsState = context.read<AppSettingsState>();


    return Container(
      color: settingsState.theme.backgroundColor,
      child: ChangeNotifierProvider(
        create: (context) => LibraryViewModel(songRepository:  context.read<SongRepository>()),
        child: LibraryContent()
        )
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
