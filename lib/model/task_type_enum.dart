import 'package:hive/hive.dart';
part 'task_type_enum.g.dart';

@HiveType(typeId: 2)
enum TaskTypeEnum {
  @HiveField(0)
  metting,
  @HiveField(1)
  school,
  @HiveField(2)
  sport,
  @HiveField(3)
  study,

  @HiveField(4)
  working,
}
