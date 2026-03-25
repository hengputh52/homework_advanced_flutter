import 'package:homework_week7/week9/data/repositories/artists/artist_repository.dart';
import 'package:homework_week7/week9/data/repositories/artists/artist_repository_firebase.dart';
import 'package:homework_week7/week9/data/repositories/settings/app_settings_repository_mock.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository.dart';
import 'package:homework_week7/week9/data/repositories/songs/song_repository_firebase.dart';
import 'package:homework_week7/week9/main_common.dart';
import 'package:homework_week7/week9/ui/states/player_state.dart';
import 'package:homework_week7/week9/ui/states/settings_state.dart';
import 'package:provider/provider.dart';
 


/// Configure provider dependencies for dev environment
List<InheritedProvider> get devProviders {
  final appSettingsRepository = AppSettingsRepositoryMock();

  return [
 
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryFirebase()),

    Provider<ArtistRepository>(create: (_) => ArtistRepositoryFirebase()),

    // 2 - Inject the player state
    ChangeNotifierProvider<PlayerState>(create: (_) => PlayerState()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (_) => AppSettingsState(repository: appSettingsRepository),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
