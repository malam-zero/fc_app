class FortuneException implements Exception {
  final String message;
  FortuneException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends FortuneException {
  NetworkException([super.message = 'Network error occurred']);
}

class ServerException extends FortuneException {
  ServerException([super.message = 'Server error occurred']);
}

class UnexpectedException extends FortuneException {
  UnexpectedException([super.message = 'An unexpected error occurred']);
}
