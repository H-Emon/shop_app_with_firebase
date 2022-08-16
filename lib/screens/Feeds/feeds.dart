import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_firebase/provider/dark_theme_provider.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: MediaQuery.of(context).size.height * .28,
              width: MediaQuery.of(context).size.width * .30,
              color: themeChange.darkTheme ? Colors.grey : Colors.white,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Stack(children: [
                        Image.asset(
                          "assets/images/fridge.jpg",
                          width: MediaQuery.of(context).size.width * .4,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.height * .06,
                            color: themeChange.darkTheme
                                ? Colors.purple
                                : Colors.red,
                            child: Icon(
                              Icons.discount_rounded,
                              size: 20,
                              color: themeChange.darkTheme
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        )
                      ])),
                  Expanded(
                      flex: 1,
                      child: Container(
                        //color:Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Walton Fridge",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: themeChange.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$45,000",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.purple,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Quantity",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: themeChange.darkTheme
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "....",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.purple,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
