import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/presentation/themes/app.color.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!
      .copyWith(fontSize: Sizes.dimen_20, color: Colors.white);

  static TextStyle get _whiteHeadline5 => _poppinsTextTheme.headline5!
      .copyWith(fontSize: Sizes.dimen_24, color: Colors.white);

  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1!
      .copyWith(fontSize: Sizes.dimen_16, color: Colors.white);

  static TextStyle get _whiteButton => _poppinsTextTheme.subtitle1!
      .copyWith(fontSize: Sizes.dimen_14, color: Colors.white);

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.button!.copyWith(
      fontSize: Sizes.dimen_14,
      color: Colors.white,
      wordSpacing: 0.25,
      letterSpacing: 0.25,
      height: 1.5);

  static getTextTheme() => TextTheme(
        headline5: _whiteHeadline5,
        headline6: _whiteHeadline6,
        subtitle1: whiteSubtitle1,
        bodyText2: whiteBodyText2,
        button: _whiteButton,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle => subtitle1!.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
}
