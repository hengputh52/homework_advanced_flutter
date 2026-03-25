import '../../model/songs/song.dart';

class SongDto {
  static const String titleKey = 'title';
  static const String artistKey = 'artistId';
  static const String durationKey = 'duration';
  static const String imageUrlKey = 'imageUrl';

  static Song fromJson(String id, Map<String, dynamic> json) {
    return Song(
      id: id,
      title: json[titleKey] as String,
      artistId: json[artistKey] as String,
      duration: Duration(milliseconds: json[durationKey] as int),
      imageUri: Uri.parse(json[imageUrlKey] as String),
    );
  }

  Map<String, dynamic> toJson(Song song) {
    return {
      titleKey: song.title,
      artistKey: song.artistId,
      durationKey: song.duration.inMilliseconds,
      imageUrlKey: song.imageUri.toString(),
    };
  }
}
