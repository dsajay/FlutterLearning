import 'package:hive/hive.dart';
part 'add_member.g.dart';

@HiveType(typeId: 1)
class AddMemberEntity extends HiveObject{
  @HiveField(0)
  int id=0;

  @HiveField(1)
  String memberName;

  @HiveField(2)
  String memberCode;

  @HiveField(3)
  String memberPhone;

  @HiveField(4)
  String type;

  @HiveField(5)
  DateTime date=DateTime.now();

  @HiveField(6)
  String? amount;

  AddMemberEntity(this.memberName, this.memberCode,this.memberPhone,this.type,this.amount);

}