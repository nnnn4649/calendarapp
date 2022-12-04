library calendar_widget;

import "package:calendar_logic/calendar_logic.dart";
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final calendarData = CalendarBuilder().build(date);

    return Column(
      children: [
        const _WeekRow(['月', '火', '水', '木', '金', '土', '日']),
        ...calendarData.map(
          (week) => _WeekRow(
            week.map((date) => date?.toString() ?? '').toList(),
          ),
        ),
      ],
    );
  }
}

class _WeekRow extends StatelessWidget {
  const _WeekRow(this.datesOfWeek);

  final List<String> datesOfWeek;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        datesOfWeek.length,
        (index) => Expanded(
          child: _DateBox(
            datesOfWeek[index],
            weekday: index + 1,
          ),
        ),
      ).toList(),
    );
  }
}

class _DateBox extends StatefulWidget {
  const _DateBox(
    this.label, {
    required this.weekday,
    // ignore: unused_element
    super.key,
  });

  final String label;
  final int weekday;

  @override
  State<_DateBox> createState() => _DateBoxState();
}

var _count = 0;

class _DateBoxState extends State<_DateBox> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () {
          showDialog<void>(
              context: context,
              builder: (_) {
                return AlertDialogSample();
              });
          //       print("クリックされたぞ");
        },
        //    child: Text("クリックしてみそ"),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1),
            color: widget.weekday == 6
                ? Colors.blue.shade50
                : widget.weekday == 7
                    ? Colors.red.shade50
                    : Colors.white,
          ),
          //    child: Center(
          //child: Text(widget.label),
          // ),
          // child: GestureDetector(
          child: Text(widget.label),
          //    child: Container(
          //    width: 150,
          //  height: 150,
          // color: Colors.blue,
          //),
        ),
      ),
    );
  }
}

class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('予定の登録'),
      content: Text('予定を登録しますか？'),
      actions: <Widget>[
        GestureDetector(
          child: Text('いいえ'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text('はい'),
          onTap: () {},
        )
      ],
    );
  }
}
