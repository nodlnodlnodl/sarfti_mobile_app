import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class ScheduleWidget extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: daysOfWeek.length,
        itemBuilder: (context, index) {
          final day = daysOfWeek[index];
          return _buildDaySchedule(day);
        },
      ),
    );
  }

  Widget _buildDaySchedule(String day) {
    return Card(
      elevation: 40.0,
      margin: const EdgeInsets.only(
          left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.all(10.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildTimeSlot('Математический анализ', '2к122', '8:30-10:15',
              'Чернявский В.П.'),
          _buildTimeSlot('Технология программирования', '2к132', '10:15-11:50',
              'Травов И.Ф.'),
          _buildTimeSlot('Сервисы', '2к222', '12:00-13:35', 'Рыжачкин И.П.'),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(
      String subject, String audit, String time, String name) {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(audit),
                Text(time),
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
