import 'package:flutter/material.dart';
import 'package:homework_week7/week9/model/artists/artist.dart';
import 'package:homework_week7/week9/model/songs/song.dart';
import 'package:homework_week7/week9/ui/screens/library/view_model/artist_view_model.dart';
import 'package:homework_week7/week9/ui/screens/library/view_model/library_view_model.dart';
import 'package:homework_week7/week9/ui/theme/theme.dart';
import 'package:homework_week7/week9/ui/utils/async_value.dart';
import 'package:homework_week7/week9/ui/widgets/artist/artist_tile.dart';
import 'package:homework_week7/week9/ui/widgets/song/song_tile.dart';
import 'package:provider/provider.dart';

class ArtistContent extends StatelessWidget {
  const ArtistContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    ArtistViewModel mv = context.watch<ArtistViewModel>();

    AsyncValue<List<Artist>> asyncValue = mv.artistValue;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(
          child: Text(
            'error = ${asyncValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );

      case AsyncValueState.success:
        List<Artist> artists = asyncValue.data!;
        content = ListView.builder(
          itemCount: artists.length,
          itemBuilder:
              (context, index) => ArtistTile(
                artist: artists[index],
              ),
        );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Expanded(child: content),
        ],
      ),
    );
  }
}
