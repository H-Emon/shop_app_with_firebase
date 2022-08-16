import 'package:flutter/material.dart';

class Styles{


  static ThemeData themeData(bool isDarkTheme ,BuildContext context){
    return ThemeData(

      scaffoldBackgroundColor: isDarkTheme ? Colors.black: Colors.grey.shade300,
      primarySwatch: Colors.purple,
      primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
      accentColor:Colors.deepPurple,
      backgroundColor: isDarkTheme ?Colors.grey.shade300 :Colors.white,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) :  Color(0xffCBDCFB),
      buttonColor:isDarkTheme ? Color(0xff3B3B3B) :  Color(0xffF1F5FB),
      hintColor:isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      textSelectionColor: isDarkTheme ? Colors.white:Colors.grey,
      brightness:isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme:Theme.of(context).buttonTheme.copyWith(
        colorScheme:isDarkTheme ? ColorScheme.dark():ColorScheme.light() ),
      appBarTheme:AppBarTheme(
        elevation:0
      )



    );
  }



}