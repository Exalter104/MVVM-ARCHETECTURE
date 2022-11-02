import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/utils/routess/routes.dart';
import 'package:mvvm_archectecture/utils/routess/routes_name.dart';
import 'package:mvvm_archectecture/views_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesNames.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
