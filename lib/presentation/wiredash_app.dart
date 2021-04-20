import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import 'package:movieapp/presentation/themes/app.color.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;
  const WiredashApp({
    Key? key,
    required this.child,
    required this.languageCode,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movieapptutorial-3qahi5c',
      secret: '57twd40nlab1bgf4wwavg41dm8khiz82a2020tbxjjso92pw',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
          locale: Locale.fromSubtags(languageCode: languageCode)),
      theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryBackgroundColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
          dividerColor: AppColor.vulcan),
    );
  }
}
