

import 'package:hive/hive.dart';
part 'my_entity.g.dart';

@HiveType(typeId: 0)
class MyEntity extends HiveObject {
  @HiveField(0)
  int id=0;

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  MyEntity(this.name, this.age);
}