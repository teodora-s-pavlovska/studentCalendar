import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class ReminderService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> setupNotifications() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: androidInit);
    await _notifications.initialize(initSettings);
  }

  Future<void> scheduleReminder({
    required String title,
    required String message,
    required DateTime reminderDate,
  }) async {
    await _notifications.zonedSchedule(
      0,
      title,
      message,
      tz.TZDateTime.from(reminderDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'exam_channel',
          'Exam Reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
