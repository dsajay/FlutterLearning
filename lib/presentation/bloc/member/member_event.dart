import 'package:flutter1/domain/entities/add_member.dart';

abstract class MemberEvent{}


class AddMemberEvent extends MemberEvent{
  final AddMemberEntity addMemberEntity;
  AddMemberEvent(this.addMemberEntity);
}
class UpdateMemberEvent extends MemberEvent{
  final dynamic key;
  final AddMemberEntity addMemberEntity;
  UpdateMemberEvent(this.key,this.addMemberEntity);
}
class GetMemberEvent extends MemberEvent{

}