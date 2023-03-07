class SongRecord {
  final String songId;
  final String songName;
  String note;

  SongRecord({
    required this.songId,
    required this.songName,
    this.note = '',
  });
}
