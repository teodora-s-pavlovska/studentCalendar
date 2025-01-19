import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:student_calendar_app/screens/schedule_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'services/reminder_service.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // tz.initializeTimeZones();

  // final ReminderService reminderService = ReminderService();
  // await reminderService.setupNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SchedulePage(),
    );
  }
}
