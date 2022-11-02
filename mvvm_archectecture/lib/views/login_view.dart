import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/resources/colors.dart';
import 'package:mvvm_archectecture/resources/components/round_button.dart';
import 'package:mvvm_archectecture/utils/routess/utils.dart';

// import '../utils/routess/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text("HomeScreen")),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Exarth",
                style: TextStyle(fontSize: 35, color: AppColor.buttonColor),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.feildFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ValueListenableBuilder(
                  valueListenable: obsecurePassword,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      obscureText: obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              obsecurePassword.value = !obsecurePassword.value;
                            },
                            child: Icon(obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .08,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Roundbutton(
                  title: "Login",
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      Utils.snackBar("Please Enter email", context);
                    } else if (passwordController.text.isEmpty) {
                      Utils.snackBar("Please Enter password", context);
                    } else if (passwordController.text.length < 6) {
                      Utils.snackBar("Please Enter 6 digit password", context);
                    } else {
                      print("Api hit");
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
