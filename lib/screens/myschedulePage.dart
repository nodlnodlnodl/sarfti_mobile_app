import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api.dart';

//Виджет вывода расписания по отдельным блокам
class MySchedule extends StatelessWidget {
  const MySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    List _dayWeek = [
      "Понедельник",
      "Вторник",
      "Среда",
      "Четверг",
      "Пятница",
      "Суббота",
    ];
    return Scaffold(
      body: ListView.builder(
          padding:
              EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
          scrollDirection: Axis.vertical,
          itemCount: _dayWeek.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Column(
                  children: [
                    Text(
                      '${_dayWeek[index]}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // itemsDay(),
                    // hhh(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget itemsDay() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Text('dfsdf');
        // return Card(
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        //     child: Column(
        //       children: const [
        //         Text('asdfasdfasdf'),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }

}
