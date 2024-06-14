import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter1/presentation/add_member.dart';
import 'package:flutter1/presentation/bloc/member/member_bloc.dart';
import 'package:flutter1/presentation/bloc/member/member_event.dart';
import 'package:flutter1/presentation/bloc/member/member_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../domain/repositories/hive_repository.dart';
import '../utils/date_format.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> entries = <String>['A', 'B', 'C'];

  final HiveRepository myRepository = GetIt.I<HiveRepository>();

  final ScrollController _scrollController = ScrollController();
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isFabVisible) {
          setState(() {
            _isFabVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isFabVisible) {
          setState(() {
            _isFabVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MemberBloc memberBloc = BlocProvider.of<MemberBloc>(context);

    //memberList.sort((a, b) => b.date.compareTo(a.date));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:
            const Align(alignment: Alignment.centerLeft, child: Text("Anil")),
      ),
      body: BlocConsumer<MemberBloc, MemberState>(
        listener: (context, state) {
          if (state is LoadingState) {
          } else if (state is AddMemberState) {
          } else if (state is GetMemberState) {
          }
        },
        builder: (BuildContext context, MemberState state) {
          if (state is LoadingState) {
            memberBloc.add(GetMemberEvent());
            return const Center(child: Text("Loading..."));
          } else if (state is GetMemberState) {
            return state.listMember.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'No Member found',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddMember()),
                      ).then((value) => memberBloc.add(GetMemberEvent()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: const Text(
                        'Add Member',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : ListView.custom(
                controller: _scrollController,
                childrenDelegate: SliverChildBuilderDelegate(
                    childCount: state.listMember.length, (context, index) {
                  return InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text(
                                'Are you sure you want Edit/Delete?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  myRepository
                                      .deleteMemberMember(state.listMember[index]);
                                 memberBloc.add(GetMemberEvent());
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddMember(
                                            memberEntity: state.listMember[index])),
                                  ).then((value) => memberBloc.add(GetMemberEvent()));
                                  // Close the dialog when the "OK" button is pressed
                                },
                                child: const Text('Edit'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Close the dialog when the "OK" button is pressed
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  state.listMember[index].memberName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                    Text(state.listMember[index].amount ?? 'S'),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(DateUtilsFormat.formatDateTime(
                                        state.listMember[index].date)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }));
          }
          return const Text("");
        },
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isFabVisible ? 1.0 : 0.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddMember()),
            ).then((value) => memberBloc.add(GetMemberEvent()));
          },
          tooltip: 'Add Member',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
