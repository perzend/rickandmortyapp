import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTextStyle {

  static const mainTitle= TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'FiraCode',  );

  static const subTitle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'FiraCode',  );

  static const greyText = TextStyle(
    color: AppColors.lightGreyColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: 'FiraCode',  );

  static const usualText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'FiraCode',  );

  static const mainCharacterTitle= TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: 'FiraCode',  );

  static const grayCharacterText= TextStyle(
    color: AppColors.lightGreyColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'FiraCode',  );
}
