import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/model/task_type.dart';
import 'package:reminder_app/model/task_type_enum.dart';
import 'package:reminder_app/screens/wellcome_screen.dart';
import 'package:reminder_app/model/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  await Hive.openBox<Task>('taskbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WellcomeScreen(),
    );
  }
}
