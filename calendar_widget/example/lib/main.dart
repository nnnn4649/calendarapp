import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:calendar_widget/calendar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _CalendarSample(),
    );
  }
}

class _CalendarSample extends StatelessWidget {
  const _CalendarSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CalendarSample')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Calendar(date: DateTime(2022, 6)),
      ),
    );
  }
}
