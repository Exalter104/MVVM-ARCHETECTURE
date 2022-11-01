import 'package:flutter/material.dart';
import 'package:mvvm_archectecture/resources/colors.dart';

class Roundbutton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const Roundbutton(
      {super.key,
      this.loading = false,
      required this.title,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: AppColor.buttonColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: AppColor.whiteColor),
              ),
            ),
          )),
    );
  }
}
