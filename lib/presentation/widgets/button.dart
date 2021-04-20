import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/String_extensions.dart';
import 'package:movieapp/presentation/themes/app.color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:
                LinearGradient(colors: [AppColor.royalBlue, AppColor.violet])),
        child: TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            text.t(context),
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
