import 'package:flutter/material.dart';
import 'package:reminder_app/model/task_type.dart';

class TaskTypeItem extends StatefulWidget {
  const TaskTypeItem({
    required this.tasktype,
    required this.index,
    required this.selectedindex,
    super.key,
  });
  final TaskType tasktype;
  final int index;
  final int selectedindex;
  @override
  State<TaskTypeItem> createState() => _TaskTypeItemState();
}

class _TaskTypeItemState extends State<TaskTypeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: (widget.selectedindex == widget.index) ? 5 : 1,
          color: (widget.selectedindex == widget.index)
              ? const Color.fromARGB(255, 255, 123, 0)
              : Colors.black,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(widget.tasktype.image),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.tasktype.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: (widget.selectedindex == widget.index) ? 22 : 15,
              fontWeight: (widget.selectedindex == widget.index)
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
