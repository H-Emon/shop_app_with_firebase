import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_firebase/provider/dark_theme_provider.dart';
import 'package:shop_app_with_firebase/screens/bottom_bar_screen.dart';

import 'consts/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();

  }


  @override
  void initState(){
    super.initState();
    getCurrentAppTheme();
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: BottomBarScreen());
        }));
  }
}
