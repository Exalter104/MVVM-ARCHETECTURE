// ignore_for_file: use_rethrow_when_possible

import 'package:mvvm_archectecture/data/network/base_api_response.dart';
import 'package:mvvm_archectecture/data/network/network_api_response.dart';
import 'package:mvvm_archectecture/resources/components/urls.dart';

class AuthRepo {
  BaseApiResponse repo = NetworkApiResponse();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await repo.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> signUpApi(dynamic data) async {
  //   try {
  //     dynamic response = await repo.getPostApiResponse(AppUrls.signUpUrl, data);
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
