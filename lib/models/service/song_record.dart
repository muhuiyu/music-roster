import 'package:music_roster_admin/api/providers/data_provider.dart';

class SongRecord {
  final String songId;
  final String songName;
  String note;

  SongRecord({
    required this.songId,
    required this.songName,
    this.note = '',
  });

  factory SongRecord.fromJson(Map<String, dynamic> json) {
    final String note = json[DataProviderKey.note] ?? '';
    return SongRecord(
        songId: json[DataProviderKey.songId] as String,
        songName: json[DataProviderKey.songName] as String,
        note: note);
  }

  Map<String, dynamic> toJson() {
    return {
      DataProviderKey.songId: songId,
      DataProviderKey.songName: songName,
      DataProviderKey.note: note,
    };
  }
}
