import 'package:get_it/get_it.dart';

import '../task.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'retrofit_client_service.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClientService {
  factory RestClientService(Dio dio, {String baseUrl}) = _RestClientService;

  @GET('/tasks')
  Future<List<Task>> getTasks();
}