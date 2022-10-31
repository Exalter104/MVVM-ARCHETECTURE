class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? prefix])
      : super(message, "Error During Message");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnautherizedException extends AppException {
  UnautherizedException([String? message])
      : super(message, "Unautherize Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Inputs");
}
