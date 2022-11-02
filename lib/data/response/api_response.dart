// ignore_for_file: file_names

import 'Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete() : status = Status.COMPLETE;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "status: $status\n message: $message \n data: $data";
  }
}
