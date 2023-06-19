import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/switch_theme.dart';

class MySettings extends StatefulWidget {
  const MySettings({super.key});

  @override
  State<MySettings> createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Выбор группы'),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text('Группа:', style: TextStyle(fontSize: 20)),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'Пожалуйста введите группу';
                      String p = r'[А-Я]{2,3}-\b[0-9]{2}\b';
                      RegExp regExp = RegExp(p);
                      if(regExp.hasMatch(value)) return null;
                      return 'Некорректная форма ввода. (ААА-00, АА-00)';
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate())
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Группа введена'),
                          backgroundColor: Colors.green,
                        ));
                    },
                    child: Text('Ввод', style: TextStyle(fontSize: 30)),
                  ),
                ],
              )),
        ));
  }
}
