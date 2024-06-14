import '../../entities/add_member.dart';

abstract class MemberRepository{
  Future<void> addMember(AddMemberEntity addMember);
  Future<void> deleteMemberMember(AddMemberEntity key);
  Future<void> updateMemberMember(dynamic key,AddMemberEntity memberEntity);
  List<AddMemberEntity> getMember();
}