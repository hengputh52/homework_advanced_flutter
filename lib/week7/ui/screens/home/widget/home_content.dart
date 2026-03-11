import 'package:flutter/material.dart';
import 'package:homework_week7/week7/data/repositories/user_history/user_history_repository.dart';
import 'package:homework_week7/week7/model/songs/song.dart';
import 'package:homework_week7/week7/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework_week7/week7/ui/screens/library/library_screen.dart';
import 'package:homework_week7/week7/ui/screens/library/view_model/library_view_model.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    //final LibraryViewModel libraryViewModel = context.watch<LibraryViewModel>();
    UserHistoryRepository userHistoryRepository = context.read<UserHistoryRepository>();
    List<Song> recentSong = userHistoryRepository.recentSong();
    return Expanded(
      child: ListView.builder(
        itemCount: recentSong.length,
        itemBuilder: (context, index) => SongTile(
          song: recentSong[index],
          isPlaying: homeViewModel.currentSong == recentSong[index],
          onTap:() => homeViewModel.start(recentSong[index])
          )
        )
    );
  }

  
}