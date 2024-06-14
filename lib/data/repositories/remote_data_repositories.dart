import 'package:flutter1/data/remote/task.dart';

abstract class RemoteDataRepositories{
  Future<List<Task>> getTask();
}