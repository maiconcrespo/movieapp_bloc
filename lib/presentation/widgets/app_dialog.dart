import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/constants/translations_constants.dart';

import 'package:movieapp/presentation/themes/app.color.dart';
import 'package:movieapp/common/extensions/String_extensions.dart';
import 'package:movieapp/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Widget? image;
  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.t(context),
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description.t(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          if (image != null) image!,
          Button(
              text: TranslationConstants.okay,
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
