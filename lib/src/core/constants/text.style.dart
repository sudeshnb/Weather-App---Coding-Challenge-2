library text_style;

import 'package:flutter/material.dart';
import 'constants.dart';

//
class AppTextStyle extends TextStyle {
  static TextStyle get defaultStyle => TextStyle(
        color: AppColor.whiteText,
        fontSize: 16.0,
        fontWeight: Weight.n,
      );
  //Body
  static TextStyle get style1 => style3.copyWith(fontSize: 10.0);
  static TextStyle get style2 => style4.copyWith(
        fontSize: 14.0,
        fontWeight: Weight.sb,
      );
  static TextStyle get style3 => style2.copyWith(fontWeight: Weight.n);

  static TextStyle get style4 => defaultStyle.copyWith(
        fontWeight: Weight.l,
        shadows: [TextShadow.defaultShadow],
      );
  //Title
  static TextStyle get style5 => defaultStyle.copyWith(
        color: AppColor.white.withOpacity(0.8),
        fontWeight: Weight.sb,
      );
  static TextStyle get style6 => style5.copyWith(fontWeight: Weight.l);
  static TextStyle get style7 => style3.copyWith(fontSize: 18.0);
  static TextStyle get style8 => style12.copyWith(fontSize: 24.0);
  static TextStyle get style9 => style8.copyWith(height: 3);
  static TextStyle get style10 => style5.copyWith(fontSize: 24.0);

  static TextStyle get style11 => TextStyle(
        color: AppColor.white,
        fontWeight: Weight.sb,
        fontSize: 40.0,
      );
  static TextStyle get style12 => style11.copyWith(
        fontWeight: Weight.b,
        shadows: [TextShadow.defaultShadow],
      );
//
  static TextStyle get style13 => style12.copyWith(
        fontSize: 48.0,
        fontWeight: Weight.sb,
      );
  static TextStyle get style14 => style13.copyWith(fontSize: 86.0);
}

//
mixin Weight implements FontWeight {
  static FontWeight get l => FontWeight.w300;
  static FontWeight get n => FontWeight.w400;
  static FontWeight get sb => FontWeight.w500;
  static FontWeight get b => FontWeight.w700;
}

mixin TextShadow implements Shadow {
  static Shadow get defaultShadow => Shadow(
        color: AppColor.black.withOpacity(0.25),
        blurRadius: 4.0,
        offset: const Offset(0, 4),
      );
}
