import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/service/song_record.dart';
import 'package:music_roster_admin/models/user/user_role.dart';

class ServiceModel implements Comparable<ServiceModel> {
  YearMonthDay date;
  Map<String, List<UserRole>> members;
  List<SongRecord> songs;

  // extra information
  String message;

  ServiceModel({
    required this.date,
    required this.members,
    this.message = '',
    required this.songs,
  });

  String? get leadId {
    for (var element in members.entries) {
      if (element.value.contains(UserRole.lead)) {
        return element.key;
      }
    }
    return null;
  }

  @override
  int compareTo(ServiceModel other) {
    return date.compareTo(other.date);
  }
}
