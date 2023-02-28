import 'package:music_roster_admin/models/common/year_month_day.dart';
import 'package:music_roster_admin/models/event/event.dart';
import 'package:music_roster_admin/models/event/song_record.dart';
import 'package:music_roster_admin/models/notifications/team_notification.dart';
import 'package:music_roster_admin/models/user/user_role.dart';

List<TeamNotification> notificationsTestEntries = [
  TeamNotification(
      id: 'team-notification-1',
      title: 'Please sign up for March and April team!',
      content: 'As I mentioned above, please sign up!'),
  TeamNotification(
      id: 'team-notification-2',
      title: 'Roster is ready, team!',
      content: 'Please check your slots.'),
];

ServiceModel serviceModelTestEntry = ServiceModel(
  date: YearMonthDay(year: 2023, month: 12, day: 3),
  members: {
    'Grace': [UserRole.bass, UserRole.vocal],
  },
  songs: [
    SongRecord(
        songId: 'song-1',
        songName: '10,000 Reasons',
        note: 'on key E, play once'),
    SongRecord(
        songId: 'song-2',
        songName: 'Slient Night',
        note: 'on key G, only guitar and vocal'),
  ],
);
