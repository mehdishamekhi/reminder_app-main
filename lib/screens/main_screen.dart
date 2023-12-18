import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder_app/screens/add_task_screen.dart';
import 'package:reminder_app/model/task.dart';
import 'package:reminder_app/widgets/task_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isfabvisible = true;
  @override
  Widget build(BuildContext context) {
    var taskbox = Hive.box<Task>('taskbox');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Tasks',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            ValueListenableBuilder(
              valueListenable: taskbox.listenable(),
              builder: (context, value, child) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    setState(() {
                      if (notification.direction == ScrollDirection.forward) {
                        isfabvisible = true;
                      }
                      if (notification.direction == ScrollDirection.reverse) {
                        isfabvisible = false;
                      }
                    });
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: taskbox.length,
                    itemBuilder: (BuildContext context, int index) {
                      var tasks = taskbox.values.toList()[index];
                      return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            taskbox.values.toList()[index].delete();
                          },
                          child: TaskItem(task: tasks));
                    },
                  ),
                );
              },
            ),
            Positioned(
              right: 40,
              bottom: 80,
              child: Visibility(
                visible: isfabvisible,
                child: FloatingActionButton(
                  backgroundColor: Colors.amber,
                  splashColor: Colors.red,
                  onPressed: () {
                    Navigator.of(context).push(_createRoute());
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddTaskScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}
