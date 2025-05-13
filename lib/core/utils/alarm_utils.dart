class AlarmUtils {
  static String getRepeatLabel(bool repeat) {
    return repeat ? "매일 반복" : "한 번만";
  }

  static DateTime nextAlarmTime(DateTime now, int hour, int minute) {
    DateTime scheduled = DateTime(now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}
