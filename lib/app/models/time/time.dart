import 'package:nursey/app/utils/date_formarter.dart';
import 'package:nursey/configs/configs.dart';

/// Used for specifying a time in 24 hour format.
part 'time.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Time extends Equatable {
  /// The hour component of the time.
  ///
  /// Accepted range is 0 to 23 inclusive.
  @JsonKey()
  final int hour;

  /// The minutes component of the time.
  ///
  /// Accepted range is 0 to 59 inclusive.
  @JsonKey()
  final int minute;

  /// The seconds component of the time.
  ///
  /// Accepted range is 0 to 59 inclusive.
  @JsonKey()
  final int second;

  const Time([
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
  ])  : assert(hour >= 0 && hour < 24),
        assert(minute >= 0 && minute < 60),
        assert(second >= 0 && second < 60);

  String toStringHHMM() {
    return '${NumberFormats.format_00.format(hour)}:${NumberFormats.format_00.format(minute)}';
  }

  Time add(Time time) {
    int minutes = hour * 60 + minute + time.hour * 60 + time.minute;
    final int hours = (minutes / 60).truncate();
    minutes -= hours * 60;
    return Time(hours, minutes);
  }

  Time remove(Time time) {
    int minutes = hour * 60 + minute - time.hour * 60 + time.minute;
    final int hours = (minutes / 60).truncate();
    minutes -= hours * 60;
    return Time(hours, minutes);
  }

  String toStringhhmmtt() {
    final formatter = NumberFormats.format_00;
    String ampm = 'AM';
    int newHour = hour;
    if (hour > 12) newHour -= 12;
    if (hour >= 12) ampm = 'PM';
    return '${formatter.format(newHour)}:${formatter.format(minute)} $ampm';
  }

  static Iterable<Time> getTimes(
    Time startTime,
    Time endTime,
    Time step,
  ) sync* {
    int startHour = startTime.hour;
    int startMinute = startTime.minute;
    final stepMinutes = step.hour * 60 + step.minute;
    while (startHour < endTime.hour ||
        (startHour == endTime.hour && startMinute <= endTime.minute)) {
      yield Time(startHour, startMinute);
      startMinute += stepMinutes;
      while (startMinute >= 60) {
        startMinute -= 60;
        startHour++;
      }
    }
  }

  @override
  List<Object> get props => [hour, minute, second];

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
