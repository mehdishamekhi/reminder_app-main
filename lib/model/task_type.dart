import 'package:hive/hive.dart';
import 'package:reminder_app/model/task_type_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 3)
class TaskType {
  @HiveField(0)
  String title;
  @HiveField(1)
  String image;
  @HiveField(2)
  TaskTypeEnum tasktypeenum;
  TaskType({
    required this.title,
    required this.image,
    required this.tasktypeenum,
  });
}
