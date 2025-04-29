import 'package:chic_lyne/core/network/constants/app_constants.dart';
import 'package:chic_lyne/features/auth/login/data/models/login_request_body.dart';
import 'package:chic_lyne/features/auth/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(AppConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
