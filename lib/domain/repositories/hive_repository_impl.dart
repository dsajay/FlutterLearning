import 'package:flutter1/domain/entities/add_member.dart';
import 'package:hive/hive.dart';

import '../entities/my_entity.dart';
import 'hive_repository.dart';

class HiveRepositoryImpl implements HiveRepository {
  final Box<MyEntity> box;
  final Box<AddMemberEntity> memberBox;

  HiveRepositoryImpl(this.box, this.memberBox);

  @override
  Future<void> insertMyEntity(MyEntity entity) async {
    await box.add(entity);
  }

  @override
  Future<MyEntity?> getMyEntity(String key) async {
    return box.get(key)  ;
  }

  @override
  Future<void> updateMyEntity(String key, MyEntity entity) async {
    await box.put(key, entity);
  }

  @override
  Future<void> deleteMyEntity(String key) async {
    await box.delete(key);
  }

  @override
  Future<List<MyEntity>> getList() {
    throw box.values.toList();
  }

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