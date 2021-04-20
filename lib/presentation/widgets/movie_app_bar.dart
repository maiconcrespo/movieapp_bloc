import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4,
          left: Sizes.dimen_16,
          right: Sizes.dimen_16),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_32,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Expanded(child: Logo(height: Sizes.dimen_32)),
          IconButton(
              icon:
                  Icon(Icons.search, color: Colors.white, size: Sizes.dimen_32),
              onPressed: () {})
        ],
      ),
    );
  }
}
