import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/utils/routess/routes_name.dart';
import 'package:mvvm_archectecture/views/home_screen.dart';
import 'package:mvvm_archectecture/views/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final argues = settings.arguments;
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Text("No Routes Defines"),
          );
        });
    }
  }
}
