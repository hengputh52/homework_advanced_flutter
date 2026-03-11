import 'package:flutter/material.dart';
import 'package:homework_week7/week7/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week7/model/songs/song.dart';
import 'package:homework_week7/week7/ui/screens/library/library_screen.dart';
import 'package:homework_week7/week7/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_week7/week7/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryViewModel = context.watch<LibraryViewModel>();
    SongRepository songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text("Library", style: AppTextStyles.heading),

        SizedBox(height: 50),

        Expanded(
          child: ListView.builder(
            itemCount: songs.length,
            itemBuilder:
                (context, index) => SongTile(
                  song: songs[index],
                  isPlaying: libraryViewModel.currentSong == songs[index],
                  onTap: () {
                    libraryViewModel.start(songs[index]);
                  },
                ),
          ),
        ),
      ],
    );
  }
}
