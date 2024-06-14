import 'package:flutter1/data/repositories/remote_data_repositories.dart';
import 'package:get_it/get_it.dart';

import '../data/remote/task.dart';

class UseCase{
  final RemoteDataRepositories _remoteDataRepositories=GetIt.I<RemoteDataRepositories>();
  Future<List<Task>> getTaskList() {
    return _remoteDataRepositories.getTask();
  }

}