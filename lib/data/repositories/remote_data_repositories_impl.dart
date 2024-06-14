import 'package:flutter1/data/remote/task.dart';
import 'package:flutter1/data/repositories/remote_data_repositories.dart';
import 'package:get_it/get_it.dart';

import '../remote/api/retrofit_client_service.dart';

class RemoteDataRepositoriesImpl extends RemoteDataRepositories {
  final RestClientService _restClientService=GetIt.I<RestClientService>();

  RemoteDataRepositoriesImpl();

  @override
  Future<List<Task>> getTask() {
    return _restClientService.getTasks();
  }
}
