import 'package:flutter1/domain/entities/add_member.dart';

import '../entities/my_entity.dart';

abstract class HiveRepository {
  Future<void> insertMyEntity(MyEntity entity);
  Future<MyEntity?> getMyEntity(String key);
  Future<void> updateMyEntity(String key, MyEntity entity);
  Future<void> deleteMyEntity(String key);
  Future<List<MyEntity>> getList();

  Future<void> addMember(AddMemberEntity addMember);
  Future<void> deleteMemberMember(AddMemberEntity key);
  Future<void> updateMemberMember(dynamic key,AddMemberEntity memberEntity);
  List<AddMemberEntity> getMember();
}