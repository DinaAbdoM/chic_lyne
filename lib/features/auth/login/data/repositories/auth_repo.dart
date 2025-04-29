import 'package:chic_lyne/core/network/constants/api_error_handler.dart';
import 'package:chic_lyne/core/network/constants/api_result.dart';
import 'package:chic_lyne/core/network/constants/api_service.dart';
import 'package:chic_lyne/features/auth/login/data/models/login_request_body.dart';
import 'package:chic_lyne/features/auth/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}