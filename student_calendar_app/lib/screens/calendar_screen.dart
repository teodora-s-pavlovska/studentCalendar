import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late Map<DateTime, List<String>> events;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    events = {};
  }

  void addEvent(String event) {
    setState(() {
      if (events[selectedDate] == null) {
        events[selectedDate] = [];
      }
      events[selectedDate]!.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Schedule'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDate,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            selectedDayPredicate: (day) => isSameDay(selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                selectedDate = selectedDay;
              });
            },
            eventLoader: (day) => events[day] ?? [],
          ),
          const SizedBox(height: 20),
          ...events[selectedDate]
                  ?.map((event) => ListTile(title: Text(event))) ??
              [],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add Event'),
            content: TextField(
              onSubmitted: (value) {
                addEvent(value);
                Navigator.pop(context);
              },
              decoration:
                  const InputDecoration(hintText: 'Enter event details'),
            ),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
