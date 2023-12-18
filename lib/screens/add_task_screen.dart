import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reminder_app/model/task.dart';
import 'package:reminder_app/utility/utility.dart';
import 'package:reminder_app/widgets/task_type_item.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode focusnodetitle = FocusNode();
  FocusNode focusnodesubtitle = FocusNode();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController subtitlecontroller = TextEditingController();
  DateTime? _time;
  final box = Hive.box<Task>('taskbox');
  int _selecteditemindex = 0;

  @override
  void initState() {
    super.initState();
    focusnodetitle.addListener(() {
      setState(() {});
    });
    focusnodesubtitle.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      focusNode: focusnodetitle,
                      controller: titlecontroller,
                      decoration: InputDecoration(
                        label: const Text(
                          'Task title',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      focusNode: focusnodesubtitle,
                      controller: subtitlecontroller,
                      decoration: InputDecoration(
                        label: const Text(
                          'Task content',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.red,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomHourPicker(
                      elevation: 2,
                      onPositivePressed: (context, time) {
                        _time = time;
                      },
                      onNegativePressed: (context) {},
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: gettasktypelist().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selecteditemindex = index;
                              });
                            },
                            child: TaskTypeItem(
                              tasktype: gettasktypelist()[index],
                              index: index,
                              selectedindex: _selecteditemindex,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        addtask(titlecontroller.text, subtitlecontroller.text);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Add task',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addtask(String title, String subtitle) {
    var task = Task(
      title: title,
      subtitle: subtitle,
      time: _time!,
      tasktype: gettasktypelist()[_selecteditemindex],
    );
    box.add(task);
  }
}
