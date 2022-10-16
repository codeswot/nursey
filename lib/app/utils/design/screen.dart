import 'dart:math';

import 'package:flutter/material.dart';

enum DeviceScreenSize { mobile, desktop, tablet, other }

extension DeviceScreenSizeX on DeviceScreenSize {
  bool get isMobile => this == DeviceScreenSize.mobile;
  bool get isDesktop => this == DeviceScreenSize.desktop;
  bool get isTablet => this == DeviceScreenSize.tablet;
  bool get isOther => this == DeviceScreenSize.other;
}

class ScreenUtil {
  static bool initialized = false;
  static late double heightRatio;
  static late double widthRatio;
  static late double screenHeight;
  static late double absoluteHeight;
  static late double absoluteWidth;
  static late double screenWidth;
  static late double notchHeight;
  static late double fontRatio;
  static late double pixelRatio;

  static setScreenRatio(MediaQueryData mediaQueryData) {
    const kMaxWidth = 480.0;

    initialized = true;
    final Size size = mediaQueryData.size;
    notchHeight = mediaQueryData.padding.top;
    absoluteHeight = mediaQueryData.size.height;
    absoluteWidth = mediaQueryData.size.width;
    screenHeight = size.height - mediaQueryData.viewPadding.vertical;
    screenWidth =
        min(size.width, kMaxWidth) - mediaQueryData.padding.horizontal;
    heightRatio = screenHeight / 812.0;
    widthRatio = screenWidth / 375.0;
    pixelRatio = mediaQueryData.devicePixelRatio;
    fontRatio = min(widthRatio, heightRatio);
  }
}
