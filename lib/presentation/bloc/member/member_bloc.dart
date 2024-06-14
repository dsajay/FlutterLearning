
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter1/presentation/bloc/member/member_event.dart';
import 'package:flutter1/presentation/bloc/member/member_state.dart';


import '../../../domain/repositories/member/member_repository.dart';

class MemberBloc extends Bloc<MemberEvent,MemberState>{
  final MemberRepository _memberRepository;
  MemberBloc(this._memberRepository):super(LoadingState()){
    on<AddMemberEvent> (_addMember);
    on<UpdateMemberEvent> (_updateMember);
    on<GetMemberEvent> (_getMemberList);

}


Future<FutureOr<void>> _addMember(AddMemberEvent addMemberEvent,Emitter<MemberState> emit) async {
  _memberRepository.addMember(addMemberEvent.addMemberEntity);
  emit(AddMemberState());
}

  Future<FutureOr<void>> _updateMember(UpdateMemberEvent updateMemberEvent,Emitter<MemberState> emit) async {
    _memberRepository.updateMemberMember(updateMemberEvent.key,updateMemberEvent.addMemberEntity);
    emit(UpdateMemberState());
  }
  Future<FutureOr<void>> _getMemberList(GetMemberEvent updateMemberEvent,Emitter<MemberState> emit) async {

    var list= _memberRepository.getMember();
    emit(GetMemberState(list));
  }
}