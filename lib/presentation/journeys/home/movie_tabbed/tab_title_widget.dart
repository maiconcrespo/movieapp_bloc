import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/string_extensions.dart';
import 'package:movieapp/presentation/themes/app.color.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: isSelected ? AppColor.royalBlue : Colors.transparent,
                    width: Sizes.dimen_2))),
        child: Text(title.t(context), //'popular,'now,'soon
            style: isSelected
                ? TextStyle(
                    color: AppColor.royalBlue,
                    fontWeight: FontWeight.w600,
                  )
                : Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}
