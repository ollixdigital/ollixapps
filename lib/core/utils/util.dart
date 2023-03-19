import 'package:flutter/services.dart';
import 'package:hyip_lab/core/utils/my_color.dart';

class MyUtils{

  static void splashScreenUtils(){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColor.primaryColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: MyColor.primaryColor,
      systemNavigationBarIconBrightness: Brightness.light)
    );
  }

  static void allScreensUtils(bool isDark){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: MyColor.getPrimaryColor(),
        statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: MyColor.getScreenBgColor(),
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark
      )
    );
  }
}