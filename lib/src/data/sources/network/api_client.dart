import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_customers/src/data/models/page_response_model.dart';
import 'package:test_customers/src/data/models/user_response_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('/users/?page={page}')
  Future<PageResponseModel> getUsers(@Path() int page);

  @GET('/users/{id}')
  Future<UserResponseModel> getUser(@Path() int id);
}
