class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  NetworkException(this.message, {this.statusCode});

  @override
  String toString() {
    return 'NetworkException: $message' + 
           (statusCode != null ? ' (Status Code: $statusCode)' : '');
  }
}

// يمكنك إضافة أنواع محددة من الاستثناءات إذا أردت
class ServerException extends NetworkException {
  ServerException(String message, {int? statusCode}) 
    : super(message, statusCode: statusCode);
}

class CacheException extends NetworkException {
  CacheException(String message) : super(message);
}

class NoInternetException extends NetworkException {
  NoInternetException() : super('No Internet Connection');
}
class SocketException extends NetworkException {
  SocketException(String message) : super(message);
}
