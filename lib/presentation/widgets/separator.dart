import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/themes/app.color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_4,
      width: Sizes.dimen_110,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2,
        bottom: Sizes.dimen_6,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1)),
          gradient:
              LinearGradient(colors: [AppColor.violet, AppColor.royalBlue])),
    );
  }
}
