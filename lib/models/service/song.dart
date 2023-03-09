import 'package:music_roster_admin/api/providers/data_provider.dart';

class Song {
  final String id;
  final String name;
  String musicLinkString;
  String sheetLinkString;

  Song({
    required this.id,
    required this.name,
    required this.musicLinkString,
    required this.sheetLinkString,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json[DataProviderKey.id],
      name: json[DataProviderKey.name],
      musicLinkString: json[DataProviderKey.musicLinkString],
      sheetLinkString: json[DataProviderKey.sheetLinkString],
    );
  }

  Map<String, dynamic> get toJson {
    return {
      DataProviderKey.id: id,
      DataProviderKey.name: name,
      DataProviderKey.musicLinkString: musicLinkString,
      DataProviderKey.sheetLinkString: sheetLinkString,
    };
  }
}
