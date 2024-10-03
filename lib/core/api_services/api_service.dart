import 'package:book_store/core/app_consts.dart';
import 'package:book_store/features/auth/data/models/auth_response_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio _dio = Dio(); // yusuf is Object from Dio can make http methods

  Future get({
    required String apiUrl,
    Map<String, dynamic>? queries,
    Object? body,
  }) async {
    final response = await _dio.get(
      apiUrl,
      queryParameters: queries,
      data: body,
    );
    return response.data;
  }

  Future<AuthResponseModel> login({
    required String userEmail,
    required String password,
  }) async {
    final res = await _dio.post(
      "${AppConsts.baseUrl}/auth/login",
      data: {
        'email': userEmail,
        'password': password,
      },
    );
    res.data; // res.data => Map
    Map<String, dynamic> tokenData = res.data["data"];

    AuthResponseModel authResponseModel = AuthResponseModel.fromJson(tokenData);
    return authResponseModel;
  }

  // register({
  //   required String userEmail,
  //   required String username,
  //   required String password,
  //   required String confirmation_password,
  // }) async {
  //   final res = await yusuf.post(
  //     "${AppConsts.baseUrl}/auth/register",
  //     data: {
  //       "name": username,
  //       "email": userEmail,
  //       "password": password,
  //       "password_confirmation": confirmation_password
  //     },
  //   );
  //   res.data; // res.data => Map
  //   Map<String, dynamic> tokenData = res.data["data"];
  //   TokekModel tokenModel = TokekModel.fromJson(tokenData);
  //   return tokenModel;
  // }
}
