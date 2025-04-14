class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  NetworkException(this.message, {this.statusCode});

  @override
  String toString() {
    return 'NetworkException: $message${statusCode != null ? ' (Status Code: $statusCode)' : ''}';
  }
}

// يمكنك إضافة أنواع محددة من الاستثناءات إذا أردت
class ServerException extends NetworkException {
  ServerException(super.message, {super.statusCode});
}

class CacheException extends NetworkException {
  CacheException(super.message);
}

class NoInternetException extends NetworkException {
  NoInternetException() : super('No Internet Connection');
}
class SocketException extends NetworkException {
  SocketException(super.message);
}
