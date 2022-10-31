// ignore_for_file: unused_local_variable, prefer_adjacent_string_concatenation

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_archectecture/data/app_exception.dart';
import 'package:mvvm_archectecture/data/network/base_api_response.dart';
import 'package:http/http.dart' as http;

class NetworkApiResponse extends BaseApiResponse {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 2));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await post(Uri.parse(url), body: {data})
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        break;
      case 400:
        dynamic responseJson = jsonDecode(response.body.toString());
        break;
      case 501:
        dynamic responseJson = jsonDecode(response.body.toString());
        break;
      default:
        throw FetchDataException("ErrorOccured while communicate with server" +
            "with StatusCode" +
            response.statusCode.toString());
    }
  }
}
