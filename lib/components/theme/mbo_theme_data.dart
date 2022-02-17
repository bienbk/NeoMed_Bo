import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbo/core/logger/init_logger.dart';

/// White of course
const kFFF = Color(0xffffffff);
const kWhite = kFFF;

/// I see nothing
const k000 = Color(0xff000000);
const kBlack = k000;

/// Color [kF5222D] named [kError]
const kF5222D = Color(0xFFF5222D);
const kError = kF5222D;

/// Color [k28B446] named [kSuccess]
const k28B446 = Color(0xFF28b446);
const kSuccess = k28B446;

/// Color [kFF9900] named [kWarning]
const kFF9900 = Color(0xFFFF9900);
const kWarning = kFF9900;

/// Color [kFAAD14] name [kPrice]
const kFAAD14 = Color(0xffFAAD14);
const kPrice = kFAAD14;

/// Color [k4200FF] named [kPrimary]
const k4200FF = Color(0xFF4200FF);
const kPrimary = k4200FF;

/// Color [k4276FE] named [kBlue]
const k4276FE = Color(0xff4276fe);
const kBlue = k4276FE;

/// Color [kEAF8ED] named [kWhiteBlue]
const kEAF8ED = Color(0xffeaf8ed);
const kWhiteBlue = kEAF8ED;

/// Color [kFFF5E6] named [kWhiteOrange]
const kFFF5E6 = Color(0xfffff5e6);
const kWhiteOrange = kFFF5E6;

/// Color [kFEF1F1] named [kWhiteRed]
const kFEF1F1 = Color(0xfffef1f1);
const kWhiteRed = kFEF1F1;

/// Color [kEDE6FF] named [kWhitePurple]
const kEDE6FF = Color(0xffede6ff);
const kWhitePurple = kEDE6FF;

/// Color #17431D
const k17431D = Color(0xff17431D);

/// Color [k262626] named [kGray1], so call the "Text Color 1"
const k262626 = Color(0xff262626);

/// Text Color 1
const kGray1 = k262626;

/// Color [k595959] named [kGray2], so call the "Text Color 2"
const k595959 = Color(0xff595959);

/// Text Color 2
const kGray2 = k595959;

/// Color [k8C8C8C] named [kGray3], so call the "Text Color 3"
const k8C8C8C = Color(0xff8c8c8c);

/// Text Color 3
const kGray3 = k8C8C8C;

/// Color [kC4C4C4] named [kGray4]
const kC4C4C4 = Color(0xffc4c4c4);
const kGray4 = kC4C4C4;

/// Color [kF5F5F5] named [kGray5]
const kF5F5F5 = Color(0xfff5f5f5);
const kGray5 = kF5F5F5;

/// Color [kF8F8F8] named [kGray6]
const kF8F8F8 = Color(0xfff8f8f8);
const kGray6 = kF8F8F8;

/// Color [kF1F1F1] named [kBackground], so call the "Background Color"
const kF1F1F1 = Color(0xfff1f1f1);

/// Background Color
const kBackground = kF1F1F1;

class MboThemeData with MboLogger {
  MboThemeData();

  TextStyle kText12 = TextStyle(fontSize: 12.sp);

  TextStyle kText14 = TextStyle(fontSize: 14.sp);

  TextStyle kText16 = TextStyle(fontSize: 16.sp);

  TextStyle kText18 = TextStyle(fontSize: 18.sp);

  ThemeData get getTheme {
    return ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: kPrimary,
        scaffoldBackgroundColor: kBackground,
        textTheme: TextTheme(
            headline1: kText18.copyWith(fontWeight: FontWeight.w700),
            headline2: kText16.copyWith(fontWeight: FontWeight.w700),
            headline3: kText14.copyWith(fontWeight: FontWeight.w700),
            headline4: kText12.copyWith(fontWeight: FontWeight.w500)));
  }
}
