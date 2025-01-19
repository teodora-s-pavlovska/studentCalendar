import 'package:flutter/material.dart';
import 'package:student_calendar_app/model/exam_event.dart';
import 'package:table_calendar/table_calendar.dart';
import '../services/firestore_service.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  final FirestoreService _firestoreService = FirestoreService();
  Map<DateTime, List<ExamEvent>> _events = {};
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    List<ExamEvent> events = await _firestoreService.retrieveEvents();
    Map<DateTime, List<ExamEvent>> groupedEvents = {};
    for (var event in events) {
      DateTime dateKey =
          DateTime(event.date.year, event.date.month, event.date.day);
      if (!groupedEvents.containsKey(dateKey)) {
        groupedEvents[dateKey] = [];
      }
      groupedEvents[dateKey]!.add(event);
    }
    setState(() {
      _events = groupedEvents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Planner')),
      body: TableCalendar(
        focusedDay: _selectedDay,
        firstDay: DateTime(2020),
        lastDay: DateTime(2030),
        calendarFormat: CalendarFormat.month,
        onDaySelected: (selectedDay, focusedDay) {
          setState(() => _selectedDay = selectedDay);
        },
        eventLoader: (day) => _events[day] ?? [],
      ),
    );
  }
}
