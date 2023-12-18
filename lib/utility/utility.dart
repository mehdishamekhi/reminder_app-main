import 'package:reminder_app/model/task_type.dart';
import 'package:reminder_app/model/task_type_enum.dart';

List<TaskType> gettasktypelist() {
  var list = [
    TaskType(
      title: 'meeting',
      image: 'assets/images/meeting.gif',
      tasktypeenum: TaskTypeEnum.metting,
    ),
    TaskType(
      title: 'school',
      image: 'assets/images/school.gif',
      tasktypeenum: TaskTypeEnum.school,
    ),
    TaskType(
      title: 'sport',
      image: 'assets/images/sport.gif',
      tasktypeenum: TaskTypeEnum.sport,
    ),
    TaskType(
      title: 'study',
      image: 'assets/images/study.gif',
      tasktypeenum: TaskTypeEnum.study,
    ),
    TaskType(
      title: 'working',
      image: 'assets/images/working.gif',
      tasktypeenum: TaskTypeEnum.working,
    ),
  ];
  return list;
}
