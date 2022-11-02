// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/repositories/auth_repo.dart';
import 'package:mvvm_archectecture/utils/routess/routes_name.dart';
import 'package:mvvm_archectecture/utils/routess/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepos = AuthRepo();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepos.loginApi(data).then((value) {
      setLoading(false);
      Utils.snackBar("Success", context);
      Navigator.pushNamed(context, RoutesNames.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.snackBar("Error ", context);
        print(error.toString());
      }
    });
  }
}
