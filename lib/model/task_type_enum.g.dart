// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 2;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.metting;
      case 1:
        return TaskTypeEnum.school;
      case 2:
        return TaskTypeEnum.sport;
      case 3:
        return TaskTypeEnum.study;
      case 4:
        return TaskTypeEnum.working;
      default:
        return TaskTypeEnum.metting;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.metting:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.school:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.sport:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.study:
        writer.writeByte(3);
        break;
      case TaskTypeEnum.working:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
