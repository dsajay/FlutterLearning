import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/domain/entities/add_member.dart';
import 'package:flutter1/domain/use_case.dart';
import 'package:flutter1/presentation/bloc/member/member_event.dart';
import 'package:flutter1/presentation/bloc/member/member_state.dart';
import 'package:flutter1/presentation/custom/radio_grop_h.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../domain/repositories/member/member_repository.dart';
import '../generated/locale_keys.g.dart';
import 'bloc/member/member_bloc.dart';
import 'custom/custom_button.dart';
import 'custom/custom_drop_down.dart';
import 'custom/custom_edit_field.dart';

class AddMember extends StatefulWidget {
  final AddMemberEntity? memberEntity;

  const AddMember({super.key, this.memberEntity});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  String? _selectedGender;

  String? _selectedDropDown;

  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  final MemberRepository _memberRepository = GetIt.I<MemberRepository>();
  final useCase=GetIt.I<UseCase>();
  @override
  void initState() {
    useCase.getTaskList().then((it) =>it.forEach((element) {Logger().i(element.name); }));

    if (widget.memberEntity != null) {
      var member = widget.memberEntity!;
      _codeController.text = member.memberCode;
      _nameController.text = member.memberName;
      _mobileController.text = member.memberPhone;
      _amount.text = member.amount ?? '';
      _selectedDropDown = member.type;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MemberBloc memberBloc = MemberBloc(_memberRepository);
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.dashboard_add_member).tr(),
      ),
      body: BlocListener<MemberBloc,MemberState>(
        bloc: memberBloc,
        listener: (context,state){
          if(state is AddMemberState){
            Fluttertoast.showToast(
                msg: state.added,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pop(context);
          }else if(state is UpdateMemberState){
            Fluttertoast.showToast(
                msg: state.update,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pop(context);
          }

        },
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RadioGroupH(
                      selected: _selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditText(
                      labelText: LocaleKeys.add_member_enter_code.tr(),
                      hint: LocaleKeys.add_member_hint_code.tr(),
                      inputType: TextInputType.number,
                      controller: _codeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  LocaleKeys.black_enter_error_with_agr.tr(args: [LocaleKeys.add_member_hint_code.tr()]);
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditText(
                      labelText: LocaleKeys.add_member_enter_name.tr(),
                      hint: LocaleKeys.add_member_name.tr(),
                      inputType: TextInputType.name,
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  LocaleKeys.black_enter_error_with_agr.tr(args: [LocaleKeys.add_member_name.tr()]);
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditText(
                      labelText: LocaleKeys.add_member_enter_mobile.tr(),
                      hint: LocaleKeys.add_member_mobile.tr(),
                      inputType: TextInputType.phone,
                      controller: _mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  LocaleKeys.black_enter_error_with_agr.tr(args: [LocaleKeys.add_member_mobile.tr()]);
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEditText(
                      labelText: LocaleKeys.add_member_enter_amount.tr(),
                      hint: LocaleKeys.add_member_amount.tr(),
                      inputType: TextInputType.number,
                      controller: _amount,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return  LocaleKeys.black_enter_error_with_agr.tr(args: [LocaleKeys.add_member_amount.tr()]);
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDropDown(
                      items: items,
                      selectedItem: _selectedDropDown,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedDropDown = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child:  CustomButton(text: widget.memberEntity != null ? LocaleKeys.update.tr() : LocaleKeys.save.tr()),
                      onTap: () {
                        // Validate the form fields
                        if (_formKey.currentState!.validate() &&
                            _selectedGender != null &&
                            _selectedDropDown != null) {
                          // Form is valid, do something with the form data
                          String name = _nameController.text;
                          String code = _codeController.text;
                          String mobile = _mobileController.text;
                          String amount = _amount.text;
                          if (widget.memberEntity != null) {

                             memberBloc.add(UpdateMemberEvent(widget.memberEntity?.key, AddMemberEntity(name, code, mobile, _selectedDropDown!, amount)));
                          } else {
                            memberBloc.add(AddMemberEvent(AddMemberEntity(name, code, mobile, _selectedDropDown!, amount)));
                          }

                          _nameController.clear();
                          _codeController.clear();
                          _mobileController.clear();
                          _mobileController.clear();
                          _amount.clear();



                        } else if (_selectedGender == null) {
                          Fluttertoast.showToast(
                              msg: "Please select GENDER",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (_selectedDropDown == null) {
                          Fluttertoast.showToast(
                              msg: "Please select DROP DOWN",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);

                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),

      ),
    );
  }
}
