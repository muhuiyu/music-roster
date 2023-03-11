// import 'package:equatable/equatable.dart';
// import 'package:music_roster/extensions/date_time_extensions.dart';
// import 'package:music_roster/model/common/year_quarter.dart';

// // ignore: must_be_immutable
// class YearMonthWeek extends Equatable implements Comparable<YearMonthWeek> {
//   int year;
//   int month; // 1 to 12
//   int week; // 1 to 5

//   YearMonthWeek({
//     required this.year,
//     required this.month,
//     required this.week,
//   });

//   factory YearMonthWeek.fromFormattedString(
//       String string, YearQuarter yearQuarter) {
//     // TODO: change to another format
//     // final items = string.split('-'); // format: 2022-Jan-W01
//     // if (items.length != 3) return YearMonthWeek.current();

//     // final year = int.parse(items[0]);
//     // final month = getMonthIntFromString(items[1]);
//     // final week = int.parse(items[2].toLowerCase().replaceAll('w', ''));

//     // return YearMonthWeek(year: year, month: month, week: week);

//     // Current format: 2022-W01
//     final items = string.split('-W');
//     if (items.length != 2) return YearMonthWeek.current();

//     final year = int.parse(items[0]);
//     final weekIndex = int.parse(items[1]);

//     List<YearMonthWeek> weeks = [];
//     yearQuarter.months.forEach((element) {
//       weeks.addAll(yearQuarter.getWeeksInMonth(element));
//     });
//     weeks.sort();

//     if (weekIndex > weeks.length) return YearMonthWeek.current();
//     return YearMonthWeek(
//       year: year,
//       month: weeks[weekIndex - 1].month,
//       week: weeks[weekIndex - 1].week,
//     );
//   }

//   int get weekIndexInCurrentQuarter {
//     var quarter = (month / 4).ceil();
//     return weeksBetween(
//         YearQuarter(year: year, quarter: quarter).startDate, firstDayInWeek);
//   }

//   String get formattedString {
//     return '${year.toString()}-W${weekIndexInCurrentQuarter.toString().padLeft(2, '0')}';
//   }

//   bool get isNotFirstWeek {
//     return week != 1;
//   }

//   bool get isCurrentWeek {
//     return this == current();
//   }

//   bool get isFutureWeek {
//     return compareTo(current()) > 0;
//   }

//   // Define the first day as Monday
//   DateTime get firstDayInWeek {
//     var firstDayOfMonth = DateTime(year, month, 1);
//     return firstDayOfMonth.add(Duration(
//         days: 7 * (week - 1) + (DateTime.monday - firstDayOfMonth.weekday)));
//   }

//   bool isWithin(YearQuarter yearQuarter) {
//     if (year != yearQuarter.year) return false;
//     return yearQuarter.months.contains(month);
//   }

//   static YearMonthWeek current() {
//     return getYearMonthWeekFromDate(DateTime.now());
//   }

//   static YearMonthWeek getYearMonthWeekFromDate(DateTime date) {
//     var firstSundayInMonth =
//         date.getFirstCertainWeekdayInMonth(DateTime.sunday);
//     final week = ((date.day - firstSundayInMonth.day) / 7).ceil() + 1;
//     return YearMonthWeek(year: date.year, month: date.month, week: week);
//   }

//   static int weeksBetween(DateTime from, DateTime to) {
//     from = DateTime.utc(from.year, from.month, from.day);
//     to = DateTime.utc(to.year, to.month, to.day);
//     return (to.difference(from).inDays / 7).ceil();
//   }

//   @override
//   int compareTo(YearMonthWeek other) {
//     if (year != other.year) return year - other.year;
//     if (month != other.month) return month - other.month;
//     return week - other.week;
//   }

//   @override
//   List<Object?> get props => [year, month, week];
// }
