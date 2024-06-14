import 'package:flutter1/domain/entities/add_member.dart';

import 'package:hive/hive.dart';

import 'member_repository.dart';

class MemberRepositoryImpl implements MemberRepository{
  final Box<AddMemberEntity> memberBox;

  MemberRepositoryImpl(this.memberBox);
  @override
  Future<void> addMember(AddMemberEntity addMember) async{
    await memberBox.add(addMember);
  }

  @override
  List<AddMemberEntity> getMember() => memberBox.values.toList() ;

  @override
  Future<void> deleteMemberMember(AddMemberEntity key) async {
    memberBox.delete(key.key);
  }

  @override
  Future<void> updateMemberMember(dynamic key, AddMemberEntity memberEntity) async{
    memberBox.put(key, memberEntity);
  }

}