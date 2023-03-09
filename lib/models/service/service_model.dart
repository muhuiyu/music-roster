import 'package:music_roster_admin/api/providers/data_provider.dart';
import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/service/song_record.dart';
import 'package:music_roster_admin/models/user/user_role.dart';

class ServiceModel implements Comparable<ServiceModel> {
  YearMonthDay date;
  List<YearMonthDay> rehearsalDates;
  Map<UserRole, List<String>> duty;
  List<SongRecord> songs;

  // extra information
  String message;

  ServiceModel({
    required this.date,
    required this.duty,
    required this.rehearsalDates,
    this.message = '',
    required this.songs,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    final YearMonthDay date = YearMonthDay(
        year: json[DataProviderKey.year],
        month: json[DataProviderKey.month],
        day: json[DataProviderKey.day]);

    List<YearMonthDay> rehearsalDates = (json[DataProviderKey.rehearsalDates]
            as List<dynamic>)
        .map(
            (element) => YearMonthDay.fromJson(element as Map<String, dynamic>))
        .toList();

    Map<UserRole, List<String>> duty = {};
    List<SongRecord> songs = [];

    (json[DataProviderKey.duty] as Map<String, dynamic>)
        .entries
        .forEach((element) {
      final role = UserRole.getUserRoleFromString(element.key);
      if (role != null) {
        duty[role] =
            (element.value as List<dynamic>).map<String>((e) => e).toList();
      }
    });

    (json[DataProviderKey.songs] as List<dynamic>).forEach((element) {
      songs.add(SongRecord.fromJson(element as Map<String, dynamic>));
    });

    return ServiceModel(
        date: date, rehearsalDates: rehearsalDates, duty: duty, songs: songs);
  }

  Map<String, dynamic> get dutyJson {
    Map<String, dynamic> dutyJson = {};
    duty.keys.forEach((key) {
      dutyJson[key.key] = duty[key];
    });
    return dutyJson;
  }

  Map<String, dynamic> toJson() {
    return {
      DataProviderKey.year: date.year,
      DataProviderKey.month: date.month,
      DataProviderKey.day: date.day,
      DataProviderKey.monthGroup: date.monthGroup,
      DataProviderKey.duty: dutyJson,
      DataProviderKey.rehearsalDates: rehearsalDates.map((e) => e.toJson()),
      DataProviderKey.songs: songs.map((e) => e.toJson()),
    };
  }

  List<String> get memberIds {
    return duty.values.fold(<String>{}, (previousValue, element) {
      previousValue.addAll(element);
      return previousValue;
    }).toList();
  }

  String? get leadId {
    final leads = duty[UserRole.lead.key];
    return leads?.first;
  }

  @override
  int compareTo(ServiceModel other) {
    return date.compareTo(other.date);
  }
}
