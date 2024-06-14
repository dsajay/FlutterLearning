import '../../../domain/entities/add_member.dart';

abstract class MemberState{}
class LoadingState extends MemberState {}

class AddMemberState extends MemberState{
  final String added="Added successfully";
}
class GetMemberState extends MemberState{
  final List<AddMemberEntity> listMember;

  GetMemberState(this.listMember);

}
class UpdateMemberState extends MemberState{
  final String update="Updated successfully";
}