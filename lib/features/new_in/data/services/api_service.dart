import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}