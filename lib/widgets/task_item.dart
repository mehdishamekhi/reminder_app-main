import 'package:flutter/material.dart';
import 'package:reminder_app/model/task.dart';
import 'package:reminder_app/screens/edit_task_screen.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    super.key,
  });
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100),
                          child: RoundCheckBox(
                            checkedColor: Colors.black,
                            onTap: (ontap) {},
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                width: 130,
                                height: 30,
                                child: Text(
                                  task.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              height: 30,
                              child: Text(
                                task.subtitle,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          height: 30,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text(
                                  '${task.time.hour} : ${getMinUndterTen(task.time)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditTaskScreen(task: task),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 25),
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 71, 69, 69),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: Image.asset(
                      task.tasktype.image,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getMinUndterTen(DateTime time) {
    if (time.minute < 10) {
      //9-1
      return '0${time.minute}'; //9 09 8 08 0 00
    } else {
      return time.minute.toString();
    }
  }
}
